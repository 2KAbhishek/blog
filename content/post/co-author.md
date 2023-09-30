+++
title = "Co-author.nvim - Add commit authors from nvim 💻🪄"
date = 2023-01-02T10:28:00+05:30
tags = ["cli","terminal","tools","side-projects","open-source","neovim","plugin"]
+++

![co-author.nvim screenshot](https://raw.githubusercontent.com/2kabhishek/co-author.nvim/main/images/screenshot.png)

## What is this

How many times have you been working on a piece of code with someone and then when committing you ask their full name and email address for adding a Co-author to the commit?

Upgrade to 21st century, use this plugin to automatically fetch author details from your commit history and then add to your commit message, all from inside neovim.

It shows you a list of all the unique authors in your current repo.

`co-author.nvim` automatically works with telescope and presents the list in a nice fuzzy searchable UI.

## Inspiration

Noticed something similar on a co-workers using IntelliJ, and I wanted it!

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of `neovim`

## Installing co-author.nvim

To get co-author.nvim, add the following to your plugin list:

```lua
-- Packer
use '2kabhishek/co-author.nvim'

-- Lazy
'2kabhishek/co-author.nvim'

```

## Using co-author.nvim

`co-author.nvim` adds a new command `:GitCoAuthors`.

You can add your custom bindings for the command `:GitCoAuthors`, the recommended keybinding is `<leader>gA`.

check `:help co-author` for more details.

> NOTE: By default there are no configured keybindings.

## How it was built

co-author.nvim was built using `nvim, lua`

## Challenges faced

Figuring out vim's rtp was tricky initially.

## What I learned

- Learned about nvim plugin ecosystem
- Explored vim APIs

## What's next

You tell me!

Hit the ⭐ button if you found this useful.

## More Info

[co-author.nvim repo](https://github.com/2KAbhishek/co-author.nvim)
[my neovim IDE configs repo](https://github.com/2KAbhishek/nvim2k)

