#!/usr/bin/env bash
wget https://github.com/jameslittle230/stork/releases/download/v1.6.0/stork-ubuntu-22-04
chmod +x stork-ubuntu-22-04
hugo --gc --minify
./stork-ubuntu-22-04 build --input public/index.toml --output public/posts.st
