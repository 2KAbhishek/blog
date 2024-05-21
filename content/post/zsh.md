+++
title = "How I organize my zsh config 🐚📂"
date = 2023-01-29
tags = ["cli","zsh","terminal","tools","shell","open-source","linux","productivity"]
+++

I have been using zsh as my shell for a 6+ years now.
I have tried a lot of configurations and setups over the years and have finally settled on a setup that I like.
In this post, I will be discussing how I organize my zsh config and how you can do it too.
So, let's get started.

## Config structure

Before we start discussing the config files, let's discuss the structure of the config directory.

This is the structure of my config directory, with all the files related to zsh:

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
    ├── prompt
    │   ├── init.zsh
    │   ├── p10k.mise.zsh
    │   ├── p10k.zsh
    │   └── powerlevel2k.zsh
    └── tools.zsh
```

Every file under the `shell` directory is a shared configuration file that can be used with any shell.
Every file under the `zsh` directory is a zsh specific configuration file.

### Config location and [~/.zshenv](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/.zshenv)

I like to keep my zsh config in the `~/.config/zsh` directory so that my home directory is not cluttered.
To do this you need to set the `ZDOTDIR` environment variable to `~/.config/zsh`.

I do something similar with the `~/.config/.zshenv` file, which is symlinked to `~/.zshenv`.
The contents of the file are:

```sh
ZDOTDIR="${${(%):-%x}:P:h}"
```

This sets the `ZDOTDIR` to the directory where the `.zshenv` file is present.

### [.zshrc](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/.zshrc)

This is the entry point for my zsh config which sources all the config files in a specific order.

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

Now let's discuss the purpose of each file, I will not be discussing the contents of each file in detail.
You can click on the file name to view the contents.

### [environment.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/environment.sh)

The first file to get loaded is the environment file, which contains environment variables and exports needed for the shell.
This contains the `PATH` and `EDITOR` variables along with other environment variables.
This is where you should put other enhancements to `PATH` like `~/.local/bin` or `brew` paths.

### [prompt/init.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/prompt/init.sh)

The next file to get loaded is the prompt initialization file.
This file loads up the prompt theme, I use [Powerlevel10k](https://github.com/romkatv/powerlevel10k) along with the instant prompt feature.
I also load my custom prompt theme [powerlevel2k](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/prompt/powerlevel2k.zsh) here.

### [omz.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/omz.zsh)

This file contains the initialization of [Oh My Zsh](https://ohmyz.sh/) along with the plugins and theme configuration.
To install Oh My Zsh, the custom plugins and theme, I use my [dots2k setup script](https://github.com/2KAbhishek/dots2k/blob/main/setup.sh#L72-L95).

If you do not want to use Oh My Zsh, you can skip this file and replace it with your own custom plugins and theme.

### [options.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/options.zsh)

This file contains all the options used for zsh, like `setopt` and `unsetopt`, along with plugin specific options.

### [completions.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/completions.zsh)

This file contains the completions setup for zsh, this is where I also define custom tool completions, like fzf.

### [functions.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/functions.sh)

This is where I have my shell functions defined, these functions are present across shells.

### [aliases.sh](https://github.com/2KAbhishek/dots2k/blob/main/config/shell/aliases.sh)

Contains the shell aliases that I use, these are shared across shells.

### [aliases.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/aliases.zsh)

Contains zsh specific aliases, primarily containing suffix and global aliases.

### [keys.zsh](https://github.com/2KAbhishek/dots2k/blob/main/config/zsh/keys.zsh)

The last file to be loaded is the keys file, which contains key bindings for zsh.
The reason this is last is that it can override the key bindings set by plugins.

## Conclusion

This setup provides me a fast and modular shell experience, it allows me to easily add or remove features without cluttering my shell config.
I hope this post helps you in organizing your own zsh config.

For more details, you can check out my [dots2k repo](https://github.com/2KAbhishek/dots2k/) where I keep all my dotfiles.

If you have any questions or suggestions, feel free to reach out to me on [Twitter](https://twitter.com/2KAbhishek) or leave a comment below.
If you liked the post, consider sharing it with others who might find it useful.
