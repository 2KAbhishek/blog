+++
title = "Five Git Tricks To Make Crafting Software Easier"
slug = "five-git-tricks"
date = 2022-06-14T00:10:46+05:30
description = "Five common git workflows, which you will be using a lot"
tags = ["git", "opensource", "tools", "developer"]
+++

Git is the most widely used version control system in the world, and it is something that every Software Craftsperson should master.

In this article, we'll be going through five git tricks that will make your software crafting easier.

Here are the tricks we'll be covering in this article:

1. [Quickly set up Git SSH credentials with GitHub CLI](#quickly-set-up-git-ssh-credentials-with-github-cli)
2. [Create a new branch and track it with remote](#create-a-new-branch-and-track-it-with-remote)
3. [Quickly test changes across branches with the help of stash](#quickly-test-changes-across-branches-with-the-help-of-stash)
4. [Split one large branch into multiple](#split-one-large-branch-into-multiple)
5. [Delete a branch from remote](#delete-a-branch-from-remote)

## Quickly set up Git SSH credentials with GitHub CLI

The first thing you want to do before trying out these tricks is to set up `git` and its credentials.

If you have set up git with ssh credentials earlier then you definitely know how cumbersome the entire process can be, for those who are unaware here's a very brief overview:

- Set up your .gitconfig with username and mail
- Generate a new ssh key
- Add the ssh key to GitHub

But wait, there's a smarter (and foolproof) way of setting up git with your GitHub credentials. All you need is the GitHub CLI installed on your system.

After that, it's as simple as:

```bash
gh auth login
```

This will take care of all the steps mentioned above + more.

## Create a new branch and track it with remote

Now that we are all set up with git credentials and have cloned the repo, it's time to create a new branch and start working on that new feature.

But wait, how do we do all this?

- First, you create the branch in your local

```bash
git checkout -b <branch> # old way
git switch -c <branch> # new way
```

- Then to track this branch with remote

```bash
git push -u origin <branch>
```

This will push the branch to remote, and it will be available for everyone to pull from.

## Quickly test changes across branches with the help of stash

Let's say you want to try out a new config that you have added to your branch and have tested successfully, but before committing you want to make sure that this config change doesn't break the `main` branch.

How do you do this?

- Here's one way you can quickly do that using stash:

```bash
# Stash your current changes
git stash push
# Or if you have multiple stashes
git stash push -m "configs" # Saves stash with an identifier
```

- Now you can switch to `main` and test your changes

```bash
git switch main # Switch to the main branch
git stash apply # Applies most recent stashed changes without removal
# Or if you have multiple things in the stash
git stash list # Get all stashes with index
git stash apply stash@{<index>} # Apply stash at <index>
```

- Once you are done with your changes switch back to the previous branch and continue

```bash
git switch - # Switch to the previous branch
git stash pop # Applies changes and removes the most recent stash
```

Now you can commit your changes and push them to remote without worrying about the `main` branch.

## Split one large branch into multiple

While working on the feature, you got carried away and accidentally added commits for the next feature to the same branch, and now you want to split the branch into multiple branches.

Here's how you can do that:

- Identify the commit hash from where you want to split the new branch using `git log`, you can also use the following command for prettier logs.

```bash
git log --oneline --decorate --graph
```

- Create the new branch, but don't check out yet, the `new-branch` should point to your current branch's `HEAD`

```bash
git branch <new-branch>
```

- Hard reset the current branch to the splitting commit

```bash
git reset --hard <commit-hash>
```

- Force push the updated current branch head to remote

```bash
git push --force-with-lease
```

- Switch to `new-branch` and add it to remote

```bash
git switch <new-branch>
git push -u origin <new-branch>
```

You are done!

To create multiple splits, use `git rebase --onto` to link the branches.

## Delete a branch from remote

What if one of the branches is no longer needed or what if you made a typo while creating the branch.

You definitely want to delete the branch from remote right?

Here's how you can do that:

- Delete branch from local

```bash
git branch -d <branch>
git branch -D <branch> #Force delete
```

- Delete branch from remote

```bash
git push origin :<branch>
```

This will delete the branch from local and remote.

## Bonus: Use git aliases to make your life easier

Alright! you made it to the end of this article, and you have already seen a lot of git commands.

But how do you remember all this? Easy!

You can use git aliases to make your life easier. You can add these aliases to your `.gitconfig` file.

```bash
[alias]
    a = add
    c = commit
    l = pull
    p = push
    co = checkout
    br = branch
    st = stash
    sw = switch
```

Or you can use the following commands to add these aliases to your current shell config file (`~/.bashrc`,`~/.zshrc`, etc):

```bash
alias g='git'
alias ga='git add'
alias gc='git commit -m'
alias gl='git pull'
alias gp='git push'
alias gco='git checkout'
alias gbr='git branch'
alias gst='git stash'
alias gsw='git switch'
```

Add as many aliases as you want, saving these few keystrokes will make your life much easier in the long run.

## More to explore

This is only the tip of the iceberg when it comes to `git`, there are many more awesome things you can do with it. Go ahead and explore!

We will be covering more commands and tricks in the future.
