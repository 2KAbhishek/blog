+++
title = "My Intro To Github Actions ⚙️🤷"
date = 2020-09-14T00:00:00+05:30
tags = ["github","devops","opensource"]
+++

GitHub actions are something that I was always curious about but never really explored, thanks to this hackathon I took a dive and was able to come up with something that actually solves one of my problems.

### Gulp Runner

Like many of us, I have a [personal site](https://2kabhishek.github.io) deployed on GitHub Pages. 🌐

It uses SCSS so I have to convert it to CSS pre-deployment, I also like to have my scripts and styles minified.
While building the site I used gulp for these tasks and everything worked as it should.

The only issue is when I have to make some quick updates to the styles or scripts on a new machine or on my phone, I have to setup the local dev environment along with node, npm and lots of node modules.

While reading up on GitHub actions this is the problem that came up to my mind, that can be fixed quite easily using a simple workflow. 🤔

What this action does is, on push events it looks at changes in the script and styles file. If it does find any changes It runs and carries out the gulp tasks (sass -> css & minifying) and makes a new commit.

Thus allowing me to tweak my site from anywhere without worrying about node or npm at all. 📱😁

### Submission Category

- Phone Friendly
- DIY Deployments

### gulp-runner.yml

```yaml
name: Run gulp tasks

# Controls when the action will run.
on:
  push:
    # On which branch
    branches: ["master"]
    # On which files
    paths: ["scripts/scripts.js", "styles/styles.scss"]

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # Job name
  build:
    # Runner name
    runs-on: ubuntu-latest

    steps:
      # Checks-out your repository under $GITHUB_WORKSPACE, so your job can access it
      - uses: actions/checkout@v2
      # Sets up node
      - uses: actions/setup-node@v1
        with:
          node-version: 12
      - run: npm ci
      - run: gulp

      - name: Commit files
        run: |
          git config --local user.name  ${{ github.actor }}
          git add -A
          git commit -m "Update gulp output files"
      - name: Push changes
        uses: ad-m/github-push-action@master
        with:
          github_token: ${{ secrets.REPO_GITHUB_TOKEN }}
          # force: true

```

### Additional Resources / Info

My portfolio site's [repo](github.com/2kabhishek/2kabhishek.github.io), using this workflow

