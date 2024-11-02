+++
title = "Useful Shell Functions for Developers"
date = 2024-11-02
slug = "useful-shell-functions"
tags = ["terminal","bash","cli","productivity","workflow"]
+++

A well-crafted shell function can be a game changer for developer productivity.
These functions streamline repetitive tasks directly in the terminal, avoiding context switches and speeding up common workflows.

I recently introduced a few of these functions to my setup, and they’ve been invaluable.
Here’s a rundown of each one, with descriptions of the tools you’ll need and how each function fits into a developer’s workflow.

### Tools You’ll Need

- **`fzf`**: Fuzzy finder for quick file and string searches.
- **`rg`**: A fast, versatile text search tool.
- **`git`** and **`gh`**: For version control and GitHub interactions.
- **`delta`**: A syntax-highlighting pager for diffs.
- **vim / neovim** (recommended): A highly configurable text editor.

If you prefer a video, check out: [Useful Shell Functions for Developers on Youtube](https://www.youtube.com/watch?v=56LAmHdxNTs)

---

## `grep_open` (alias: `vg`)

Shows all files in a `fzf` list that contain a particular search term, and opens the selected file in your default editor.
If you’re using vim or neovim, it even searches for the term within the file.

```bash
grep_open() {
    local editor="$EDITOR"
    if [ "$EDITOR" = "vim" ] || [ "$EDITOR" = "nvim" ]; then
        local editor="$EDITOR +/$1 +'norm! n'"
    fi
    rg -l "$1" | fzf --bind "enter:execute($editor + {})"
}
```

**Use cases**: Quickly find and edit code snippets, locate references across a codebase.

---

## `review_changes` (alias: `vr`)

Displays a list of files changed in the current branch compared to a base branch. It uses `fzf` to show diffs in preview mode and opens selected files in your editor. Defaults to comparing against the main branch if no base branch is specified.

```bash
review_changes() {
    local base_branch="${1:-}"

    if [ -z "$base_branch" ]; then
        base_branch=$(git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@')
        [ -z "$base_branch" ] && base_branch="main"
    fi

    git diff --name-only "$base_branch"...HEAD | fzf \
        --preview "git diff $base_branch...HEAD -- {} | delta --width \$FZF_PREVIEW_COLUMNS" \
        --bind "enter:execute($EDITOR {})"
}
```

**Use cases**: Reviewing PRs, comparing code changes across branches.

---

## `changed_files` (alias: `vc`)

Lists both staged and unstaged files using `git status` and previews diffs for each file with `delta`. Opens selected files in the editor.

```bash
changed_files() {
    git status --short | awk '{print $2}' | fzf \
        --preview "git diff --cached -- {} | delta --width \$FZF_PREVIEW_COLUMNS && git diff -- {} | delta --width \$FZF_PREVIEW_COLUMNS" \
        --bind "enter:execute($EDITOR {})"
}
```

**Use cases**: Reviewing your local changes, preparing files for commit.

---

## `pr_diff` (alias: `ghpd`)

Displays the diff of a specified pull request for the current repository, using the GitHub CLI (`gh`) and `delta` for syntax highlighting. Pass the PR number as an argument.

```bash
pr_diff() {
    gh pr diff "$1" | delta
}
```

**Use cases**: Reviewing merged PRs, code comparisons against other branches.

---

## `pr_files` (alias: `ghpf`)

Shows a list of files modified in a specified pull request, with `fzf` for preview and selection. Opens the selected file in your editor.

```bash
pr_files() {
    gh pr diff "$1" --name-only | fzf \
        --bind "enter:execute($EDITOR {})"
}
```

**Use cases**: Quickly navigate changed files in a PR

---

## `binary_edit` (alias: `vb`)

Finds and opens a binary or executable file in the system path with your editor. Useful for quick edits on scripts or symlinked executables. Note: Editing binaries directly can be risky, so use this for shell scripts and other readable executables.

```bash
binary_edit() {
    local bin=""
    bin=$(which "$1")
    if [ -z "$bin" ]; then
        echo "Binary not found in path"
        return 1
    fi
    $EDITOR "$bin"
}
```

**Use cases**: Editing symlinked shell scripts, quickly modifying executables in the path.

---

### Code Repository

You can find the code for all of these functions and more on [functions.sh in dots2k](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/functions.sh).

If you have any recommendations or questions, feel free to drop a comment or raise an issue on the [dots2k repo](https://github.com/2KAbhishek/dots2k/).
Thanks for reading!
