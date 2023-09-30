+++
title = "Posh2K - A universal prompt for power users 💪🌈"
date = 2022-12-04T00:58:00+05:30
tags = ["cli","terminal","tools","side-projects","open-source","powershell","shell","windows"]
+++

![Posh2K](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tzdqbmny606hz26vudub.png)

## What is this

[Posh2K](https://github.com/2kabhishek/Posh2K) is a prompt for [oh-my-posh](https://ohmyposh.dev/), it works on all shells, has multiple segments with aesthetically pleasing colors.

## Inspiration

Most of my workflow is based on the command line, recently I had to use a Windows system for some work and was really displeased by the CLI experience.

So, I needed a prompt that can work across shells and has support for different segments and Posh2K was born.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed the latest version of [oh-my-posh](https://ohmyposh.dev/docs/installation/linux)

## Getting Posh2K

To get Posh2K, follow these steps:

```bash
git clone https://github.com/2kabhishek/Posh2K

# for Powershell, add this to $Profile
oh-my-posh init pwsh --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json | Invoke-Expression

# for Zsh, add this to ~/.zshrc
eval "$(oh-my-posh init zsh --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json)"

# for Bash, add this to ~/.bashrc
eval "$(oh-my-posh init bash --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json)"

# for Fish, add this to ~/config/fish/config.fish
oh-my-posh init fish --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json | source

# for nu shell, run
oh-my-posh init nu --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json
source ~/oh-my-posh.nu

# for cmd, install Clink, then add this
load(io.popen('oh-my-posh init cmd --config ~/PATH_TO_DIR/Posh2K/posh2k.omp.json'):read("*a"))()

```

### More

[Posh2K repo](https://github.com/2kabhishek/Posh2K)

Show some love by liking and sharing, let me know if you have any feedback in the comments

Follow me on [Twitter](https://twitter.com/2kabhishek) | [Linkedin](https://linkedin.com/in/2kabhishek) | [Instagram](https://instagram.com/2kabhishek) to stay in touch.

