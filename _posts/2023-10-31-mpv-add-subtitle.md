---
title: "A minimal example for xaringan presentation"
layout: single
categories: [mpv]
tags: [mpv, subtitle]
excerpt: "The following post is about how to add custom subtitle to mpv video player"
output:
  md_document:
    preserve_yaml: true
---

There are at least three way to add custom subtitle to a video in mpv player:

1. Drag and drop subtitle file into `mpv` while it is playing.
2. Use `--sub-auto=all` command-line option, when starting mpv from a terminal. This can be set in `mpv.conf` file as well. (See details in this [blog post](https://devicetests.com/mpv-player-auto-pick-subtitles).)
3. Specifying exact path to subtitle file like this: "To load a specific subtitle file in MPV, use the `--sub-file=` or `--sub-files=` command-line argument. Note that this argument does not expand `~` to the user's home directory. If you want to refer to something in your home, use a command like: `mpv --sub-file=$HOME/directory/sub.vtt video.webm`." ([Source](https://emacsconf.org/mpv/))

