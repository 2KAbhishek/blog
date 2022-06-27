+++
title = "Trim Unnecessary Files From Git History ✂️🗃️"
date = 2019-08-25T18:28:00+05:30
tags = ["git","github","tutorial"]
+++

Here's a common scenario, You have committed a file to your git repo and have also pushed to remote.

The file wasn't supposed to be there, maybe it was something you forgot to mention in your `gitignore` or something that was supposed to be an environment variable, or maybe it was a binary not related to the project at all ( Cat GIFs? 😉).

This not only raises some security concerns but also drives the  size of your repository up and simply deleting the file won't fix the problem.

Here's how to fix it using a few commands:

1) Clone your repo and make sure all branches are up-to-date with remote.

2) Identity the filename and its path that you want to remove.

3) Then using git filter-branch remove the files from history

```bash
git filter-branch --tag-name-filter cat --index-filter \ "git rm -r --cached --ignore-unmatch filename****" --prune-empty -f -- --all
```

4) Remove the files from the local repo.

```bash
rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
```

5) Push your changes to remote.

```bash
git push origin --force --all
git push origin --force --tag
```

6) Make sure anyone else with a local clone of this repo either uses **git rebase** or a fresh clone, to avoid restoring the repo to earlier state.

If this seems too much to got through you can also use a program I wrote to solve this problem :

## Gitrim

[Gitrim](https://github.com/2kabhishek/gitrim/) also has a feature to list out the objects, which are taking the highest space in the `.git` directory.

That's all, see you in the next one.
There's also other alternatives git filter-repo and BFG repo cleaner, you can look into those too.
