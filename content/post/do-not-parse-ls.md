+++
title = "Do Not Parse ls! (Use this instead) ❌📂"
date = 2024-06-26
slug = "do-not-parse-ls"
tags = ["filesystem","unix","shell","open-source","linux","programming"]
+++

## TLDR

ls parsing bad, do this

```bash
ls -1iq | grep -o '^ *[0-9]*' # get file inodes
find /path/to/search -inum <inode_number> # convert inodes to file info
```

You can continue your doomscroll now 👍🏼

---

You still here? (thanks!! 😇) ok, then read on:

Do you know why its not recommended to parse `ls` output for operation on a list of files?
It's because the UNIX system allows any characters in filenames so things like newline, whitespaces, `~` (and a lot more weird chars) are all valid.

On a large enough fileset this can cause a lot of issues. So what to do now? Regex?! 😵‍💫

No!! I'll stop you right there. Before you go and write (or copy paste 😏) a piece of regex, that you need to google (or ask ChatGPT) everytime to understand.

## inode to the rescue

In UNIX-like operating systems, an inode (index node) is a data structure used to represent a filesystem object such as a file or a directory.
Inodes store metadata about the file but do not contain the file name or its data.

So how do you see inodes? simple use the `-i` flag with ls.

```bash
ls -i # gives you the file names and inode
ls -1i # file names and inodes in a list
ls -liq # li + replace non-graphic chars as '?'
```

Ok now that you have the inodes, lets get em! ✊🏼

Now we'll use a bit of Regex (little bit is ok! 😉)

```bash
ls -1iq | grep -o '^ *[0-9]*' # outputs only inode numbers as a list
```

Oh, did I tell you that inodes are always integers! (you would have known if you tried the commands I posted earlier 😈)

Ok, now you have a list of numbers, what next? What do you do with it?
How would I know? 🤷🏼‍♂️ do whatever you want, you can now store them any way you want.

But if you want to get the file info from the inode, you can do either of these:

```bash
find /path/to/search -inum <inode_number>
# or
ls -i /path/to/search/* | grep <inode_number>
```

This gives you a safe way to "parse ls" and be confident with your implementation. 🥳
And don't worry, you can work with inodes in any programming language, I used bash because its the simplest to explain (again little bit bash is ok!)

That's it, go try it out now! (don't forget to add error handling 😐)

[Inspired by this discussion](https://unix.stackexchange.com/questions/128985/why-not-parse-ls-and-what-to-do-instead) - 👆🏼 this article was just supposed to be on my notes, with the TLDR. 🤐

> P.S - I know you will doomscroll again, but I hope you learned something new 🤓

> P.P.S - Ask AI to write a blog post like this! 😏
