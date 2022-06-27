+++
title = "Sync Forked Repository With Upstream 🔁✔️"
date = 2020-06-07T13:24:00+05:30
tags = ["developer","git","github","opensource"]
+++

Here's the situation, You have forked a repository on GitHub, you have made your changes and sent a pull request, and that request has been merged.

  Now you want to make further changes, but the repository mentions that you are X commits ahead or/and X commits behind upstream repository.

**So how do you sync it?**

  You can delete your fork and fork the original repository again, but that is a very tedious thing to do.

Here's another way to do this:

1. Clone your fork

```bash
git clone https://github.com/yourname/repo.git
cd yourname/repo
```

2. Add upstream remote

```bash
git remote add upstream https://github.com/original-author/repo.git
git fetch upstream
```

3. Ignore all changes in fork and sync with upstream

```bash
git reset --hard upstream/master
git push -f origin master
```

Only do this if you have no changes on your fork that you would like to keep.
This will set your fork's master to be the same as upstream's master.
Now you are free to make any changes you wish to make.

  If you just want to get the changes from upstream you can do

```bash
git pull upstream master
git push origin master
```

> Just a word of caution: Be extra careful when using the -f or --force option.

Thank you for reading, hope you found this useful, see you in the next one.
