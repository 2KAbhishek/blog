+++
title = "Tmux-Tilit - Better tiling for tmux 🪟🪓"
date = 2023-01-11T00:58:00+05:30
tags = ["cli","terminal","tools","side-projects","open-source","tmux","productivity"]
+++

If you have used tmux then you already know that tmux provides ways to create multiple panes on your terminal among many other things.

You might have also felt that the default way of doing these things is kind of clumsy and doesn't feel natural.

# Introducing tmux-tilit:
![Screenshot](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/3p6b2sqivrf1xajhbh27.jpg)

## What is this

tmux-tilit is a tmux plugin that adds tiling window manager like features and keybindings to tmux.

## Inspiration

tmux-tilit was inspired by [tmux-tilish](https://github.com/jabirali/tmux-tilish).
I wanted to add some new commadns, make the keybindings match better with tmux's defaults, hence tilit was born!

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of `tmux` and `tpm`.

## Installing tmux-tilit

To get tmux-tilit, add the following to your `~/.tmux.conf`:

```bash
set -g @plugin '2kabhishek/tmux-tilit'
```

## Using tmux-tilit

### Keybindings

Finally, here is a list of the actual keybindings. Most are [taken from `i3wm`][1].
Below, a "workspace" is what `tmux` would call a "window" and `vim` would call a "tab",
while a "pane" is what `i3wm` would call a "window" and `vim` would call a "split".

| Keybinding | Description |
| ---------- | ----------- |
| <kbd>Alt</kbd> + <kbd>0</kbd>-<kbd>9</kbd> | Switch to workspace number 0-9 |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>0</kbd>-<kbd>9</kbd> | Move pane to workspace 0-9 |
| <kbd>Alt</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> | Move focus left/down/up/right |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>h</kbd><kbd>j</kbd><kbd>k</kbd><kbd>l</kbd> | Move pane left/down/up/right |
| <kbd>Alt</kbd> + <kbd>Enter</kbd> | Create a new pane at "the end" of the current layout |
| <kbd>Alt</kbd> + <kbd>-</kbd> | Horizontal Split |
| <kbd>Alt</kbd> + <kbd>\</kbd> | Vertical Split |
| <kbd>Alt</kbd> + <kbd>s</kbd> | Switch to layout: split then vsplit |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>s</kbd> | Switch to layout: only split |
| <kbd>Alt</kbd> + <kbd>v</kbd> | Switch to layout: vsplit then split |
| <kbd>Alt</kbd> + <kbd>Shift</kbd> + <kbd>v</kbd> | Switch to layout: only vsplit |
| <kbd>Alt</kbd> + <kbd>t</kbd> | Switch to layout: fully tiled |
| <kbd>Alt</kbd> + <kbd>z</kbd> | Switch to layout: zoom (fullscreen) |
| <kbd>Alt</kbd> + <kbd>r</kbd> | Refresh current layout |
| <kbd>Alt</kbd> + <kbd>n</kbd> | Name current workspace |
| <kbd>Alt</kbd> + <kbd>x</kbd> | Quit (close) pane |
| <kbd>Alt</kbd> + <kbd>d</kbd> | Exit (detach) `tmux` |
| <kbd>Alt</kbd> + <kbd>r</kbd> | Reload config |

For detailed instructions please read [DOCS](https://github.com/2KAbhishek/tmux-tilit/blob/main/DOCS.md)

## How it was built

tmux-tilit was built using `neovim`

## Challenges faced

Making sure the keybindings work accross different cli programs was challenging.

## What I learned

- Learned more about the tmux api.

## What's next

You tell me!

Hit the ⭐ button if you found this useful.

## More Info

Major credits to [tmux-tilish](https://github.com/jabirali/tmux-tilish)
Also checkout the nice powerline plugin you see on the screenshot, [tmux2k](https://github.com/2KAbhishek/tmux2k)

