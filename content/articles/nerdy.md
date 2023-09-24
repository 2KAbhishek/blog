+++
title = "Nerdy.nvim - Find Nerd Glyphs Easily 🤓🔭"
date = 2023-09-24T08:28:00+05:30
tags = ["cli","terminal","tools","side-projects","open-source","neovim","plugin"]
+++

![nerdy.nvim screenshot](https://raw.githubusercontent.com/2kabhishek/nerdy.nvim/main/images/screenshot.png)

Do you like [Nerd fonts](https://github.com/ryanoasis/nerd-fonts)? but don't like going over to [their site](https://www.nerdfonts.com/cheat-sheet) just to fetch a glyph for your pretty terminal?

Well, me too!

Introducing [**nerdy.nvim**](https://github.com/2kabhishek/nerdy.nvim), a super handy plugin that lets you easily search, preview and insert all nerd font glyphs straight from neovim!

## ✨ Features

- Fuzzy search nerd glyphs
- Preview glyphs before inserting
- Super lightweight
- Can auto generate new icons from source

## Setup

### ⚡ Requirements

- You have installed the latest version of `neovim`

These two plugins are optional but highly recommended for a smoother user experience.

- [dressing.nvim](https://github.com/stevearc/dressing.nvim) — for prettier select UI
- [telescope](https://github.com/nvim-telescope/telescope.nvim) — for fuzzy searching in list

### 🚀 Installation

```lua
-- Lazy
{
    '2kabhishek/nerdy.nvim',
    dependencies = {
        'stevearc/dressing.nvim',
        'nvim-telescope/telescope.nvim',
    },
    cmd = 'Nerdy',
},

-- Packer
use '2kabhishek/nerdy.nvim'

```

### 💻 Usage

`nerdy.nvim` adds a new command `Nerdy`.

You can add your custom bindings for the command, the recommended keybinding is `<leader>f,`.

check `:help nerdy` for more details.

> NOTE: By default there are no configured keybindings.

#### Fetch new icons

Running the `python scripts/generator.py` command will automatically fetch new icons from [source](https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/glyphnames.json) and update the icons.

##  Behind The Code

### 🌈 Inspiration

I love nerd font glyphs, and I use them anywhere I can! but I was wasting a lot of time going back and forth between nerd font site and neovim, also the copy feature was super buggy for me on the site, so I made nerdy!

### 💡 Challenges/Learnings

- Making the generated icon table with vim.ui.select was a bit tricky.

### 🧰 Tooling

- [dots2k](https://github.com/2kabhishek/dots2k) — Dev Environment
- [nvim2k](https://github.com/2kabhishek/nvim2k) — Personalized Editor

### 🔍 More Info

- [nerdicons.nvim](https://github.com/nvimdev/nerdicons.nvim) — Nerdy was inspired by nerdicons, thanks to the original authors for the groundwork.
- [co-author.nvim](https://github.com/2kabhishek/co-author.nvim) — Another one of my plugin that easily lets you add co authors

