+++
title = "Must Know Shell Keybindings ð§ð"
date = 2019-05-19T04:51:00+05:30
tags = ["cli","linux","zsh","bash"]
+++

A shell also known as the command line is one of the most important tools for any software developer.
You can do very complex things very quickly here.
Learning to use the shell efficiently can make your life much easier.

In this post I'll be writing about the most useful keybindings for the bash and zsh shells.
*nix systems generally ship with the Bourne again shell or bash and zsh or Z shell is also quite popular among developers as it provides some very powerful features.
Some of these shortcuts may work with other shells too.

# **Shell Keybindings**

## **Navigation** ð

Alt + f/b  - Move cursor to previous/next word
Ctrl + a/e - Move cursor to beginning/end of command
Ctrl + xx  - Toggle between the start of line and current cursor position

---

## **Editing** âï¸

Ctrl + x,e   - Open command in editor
Ctrl + k     - Cut till end
Ctrl + u     - Delete whole line (zsh)/ cut until beginning (bash)
Alt + w      - Delete until beginning (zsh)
Alt + l/u    - Lowercase/Uppercase word
Alt + c       - Capitalize word
Ctrl + w     - Cut previous word
Alt + Del    - Delete previous word
Alt + d        - Delete next word
Alt +. or !$ - Previous commands last arguement
!\*                - All arguments of previous command
Alt + t        - Swap current word with previous
Ctrl + t       - Swap the last two characters before the cursor (typo).
Esc + t       - Swap the last two words before the cursor
Ctrl + y      - Paste
Ctrl + \_      - Undo
Alt + r        - Cancel the changes, revert

---

## **Process** ð

Ctrl + l - Clear screen
Ctrl + c - Interrupt/Kill
Ctrl + d - Close current shell
Ctrl + z - Background/Foreground job

---

## **History** â³

Ctrl + r   - History search
Ctrl + s   - Go back to the next most recent command
^abcÂ­^Â­def   - Run previous command, replacing abc with def

---

## **Modes** ð¹ï¸

Ctrl +x,v - vi mode (zsh)
set -o vi - Vi mode

If you know any other useful keybindings, feel free to comment below.
GitHub gist [here](https://gist.github.com/9c6d607e160b0439a186d4fbd1bd81df).
