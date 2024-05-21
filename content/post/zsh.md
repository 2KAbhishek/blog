+++
title = "How I organize my zsh config 🐚📂"
date = 2023-01-29
tags = ["cli","zsh","terminal","tools","shell","open-source","linux","productivity"]
+++

I have been using zsh as my shell for over 6 years now.
Over the years, I've experimented with various configurations and setups, and I have finally settled on a setup that I like.
In this post, I will discuss how I organize my zsh config and how you can do it too.

Let's get started.

## Config Structure

Before we dive into the config files, let's look at the structure of my config directory.

Here is the structure of my config directory, with all the files related to zsh:

```sh
├── shell
│   ├── aliases.sh
│   ├── environment.sh
│   ├── functions.sh
│   └── local.sh
└── zsh
    ├── .zshenv
    ├── .zshrc
    ├── aliases.zsh
    ├── completions.zsh
    ├── keys.zsh
    ├── omz.zsh
    ├── options.zsh
    └── prompt
        ├── init.zsh
        ├── p10k.mise.zsh
        ├── p10k.zsh
        └── powerlevel2k.zsh
```

Every file under the `shell` directory is a shared configuration file that is common across shells.
Every file under the `zsh` directory is a zsh-specific configuration file.

### Config Location and [.zshenv](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/.zshenv)

I like to keep my zsh config in the `~/.config/zsh` directory to keep my home directory uncluttered.
To do this, you need to set the `ZDOTDIR` environment variable to `~/.config/zsh`.

I do something similar with the `~/.config/.zshenv` file, which symlinks to `~/.zshenv`.
The contents of the file are:

```sh
ZDOTDIR="${${(%):-%x}:P:h}"
```

This sets the `ZDOTDIR` to the directory where the `.zshenv` file is present.

### [.zshrc](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/.zshrc)

This is the entry point for my zsh config, which sources all the config files in a specific order.

```sh
# Load configs in specific order
source ~/.config/shell/environment.sh
source "$ZDOTDIR/prompt/init.zsh"
source "$ZDOTDIR/omz.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/completions.zsh"
source ~/.config/shell/functions.sh
source ~/.config/shell/aliases.sh
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/keys.zsh"

# Load Local configuration if exists
[ -f ~/.config/shell/local.sh ] && source ~/.config/shell/local.sh
```

Now let's discuss the purpose of each file.
I will be going through the files in order, without discussing the contents of each file too much in detail, you can click on the file name to view the contents.

### [environment.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/environment.sh)

The first file to get loaded is the environment file, which contains environment variables and exports needed for the shell.
This includes the `PATH` and `EDITOR` variables along with other environment variables.
This is where you should add other enhancements to `PATH` like `~/.local/bin` or `brew` paths.

### [prompt/init.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/prompt/init.sh)

Next in line is the prompt initialization file.
This loads the prompt theme [Powerlevel10k](https://github.com/romkatv/powerlevel10k) along with the instant prompt feature.
I also load my custom prompt theme [powerlevel2k](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/prompt/powerlevel2k.zsh) here.

### [omz.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/omz.zsh)

This is the initialization script for [Oh My Zsh](https://ohmyz.sh/) along with the plugins and themes used.
To install Oh My Zsh, the custom plugins, and the theme, I use my [dots2k setup script](https://github.com/2KAbhishek/dots2k/blob/main/setup.sh#L72-L95).

If you do not want to use Oh My Zsh, you can skip this file and replace it with your own custom plugins and theme.

### [options.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/options.zsh)

This contains all the options used for zsh, like `setopt` and `unsetopt`, along with plugin-specific options.

### [completions.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/completions.zsh)

This file contains the completions setup for zsh, along with custom tool completions, like fzf.

### [functions.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/functions.sh)

This is where I define my shell functions, shared across shells.

### [aliases.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/aliases.sh)

This contains the shell aliases that I use, shared across shells.

### [aliases.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/aliases.zsh)

I define zsh-specific aliases, primarily suffix and global aliases here.

### [keys.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/keys.zsh)

The last file is the keys file, which contains key bindings for zsh.
The reason this is last is that it can override the key bindings set by plugins.

### local.sh

This is an optional file that I use to store local configurations specific to that machine or any one off configurations.
This file is intentionally not checked into the repository.

## Conclusion

This setup provides me with a fast and modular shell experience, allowing me to easily add or remove features without cluttering my config.
I hope this post helps you in organizing your own zsh config.

For more details, you can check out my [dots2k repo](https://github.com/2KAbhishek/dots2k/) where I keep all my dotfiles.

If you have any questions or suggestions, feel free to reach out to me on [Twitter](https://twitter.com/2KAbhishek) or leave a comment below.
If you liked the post, consider sharing it with others who might find it useful.
