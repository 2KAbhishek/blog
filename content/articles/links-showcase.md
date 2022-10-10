+++
title = "Links - Present Your Links In Style 🔗🔮"
date = 2022-08-13T10:36:00+05:30
tags = ["github","side-project","open-source","portfolio","webdev"]
+++

Have you ever wanted a place that can make all your profiles and links nicely organized, easily searchable and with super customizability?

Well, now you can!

## Introducing links

Present all your links in style with an easily accessible and highly customizable web app! ✨

## Inspiration

Needed a place to display all my profiles, used my [project's repo](https://2kabhishek.github.io/projects) as inspiration.

## Getting links

To get links, follow these steps:

```bash
git clone https://github.com/2kabhishek/links
cd links
```

## Setup Your Own links

You can easily set up links to show your own profiles.

-   Fork the repo
-   Clone it
-   Open up `script.js` and update the `username` variable to your internet username.
-   Edit the `links` JSON array in `script.js`, add/remove link elements as required.
-   Open up `index.html` and update the `title` tag to make it your username.
-   You may also want to update the favicon, update the `link` tag in `index.html`
-   Push your changes
-   Go to repo settings on GitHub and enable GitHub Pages.

The site should be live on `https://<your-username>.github.io/links`

### JSON Schema

Every link has the following properties:

-   `name`: The name of the link
-   `description`: Brief description about the link
-   `url`: The URL to open when clicked on the link
-   `icon`: The icon of the link, font awesome classes in use
-   `color`: The color of the link icon, hex code in use

### Overriding URL Logic

If your username is different across sites, or you want to add a custom URL as a link just add the entire URL in the `url` field.
Presence of `http` in the URL string will override the URL building logic and present your link as is.

### Order Of Links

The order of links presented will be the same as their order in the `links` array in `scrip.js`.

### Themes

Comes with a light and dark theme, changes depending upon your system settings.

### Brand Icons

This project uses [Font Awesome Brand](https://fontawesome.com/v6/icons?s=brands) for adding icons, if the icon you are looking for is not available, try using the full version of [Font Awesome](https://fontawesome.com/v6/icons/).

## Use Cases

Although, the original purpose of links is to create a web app for your profiles, it can also be used in some other scenarios.

-   **Portfolio Replacement**: Adding just a little bit of information about yourself to the `index.htnl` can convert links to your full fledged Portfolio.
-   **Link.tree Replacement**: Combined with some basic tracking and metrics, links can easily be used as an alternative to link.tree.
-   **Custom Home Page**: You can create a custom home page with your favourite links, just add the page's complete URL to `links` in `script.js` and set your live website's link as your browser homepage.
-   **Sharing Resources**: Links with overridden URLs can be easily used to share resources after talks and presentations.

## Viewing links

Open `index.html` in your favorite browser or visit [2kabhishek.github.io/links](https://2kabhishek.github.io/links).

## How it was built

links was built using `HTML` `CSS` & `JavaScript`.
It was built on `neovim` and the node `live-server`.
Uses font awesome for icons.

## What I learned

-   Learned new use cases for `JSON Arrays`

## What's next

You tell me!

Hit the ⭐ button if you found this useful.

[links repo](https://github.com/2kabhishek/links)

To showcase all your GitHub projects see:

[Projects article](htpps://2kabhishek.github.io/blog/projects-showcase-github)
