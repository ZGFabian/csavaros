---
title: "A minimal example for xaringan presentation"
layout: single
categories: [rstats]
tags: [xaringan, presentation]
excerpt: "The following post is a minimal example of local xaringan presentation deployment that is independent of any R IDE."
output:
  md_document:
    preserve_yaml: true
---

## Aim

In my [previous
post](https://zgfabian.github.io/2021-04-28-xaringan-prez/) I tried to
show how to deploy a xaringan presentation to a *Jekyll* site hosted on
a *github.io* site. The following post is a minimal example of local
deployment that is independent of any R IDE. You can execute it from a
terminal like:

    Rscript minimal-example.R

However, if you run the script outside Rstudio IDE, you will have to
install [pandoc](https://www.pandoc.org) for your OS environment.
RStudio is bundled with pandoc, and other dependencies (like javascript
and css) are handled by `xaringan` itself. You can verify pandoc
installation from a terminal with:

    pandoc --version

## Review of the `minimal-example.R`

### Get `remark.js` with xaringan

Download `remark.js`. It can be a good idea to pin a specific version.

    setwd(".")
    dir.create("./lib", showWarnings = FALSE)
    xaringan::summon_remark(version = "0.14.1", to = "./lib/")
    list.files("./lib/")

    ## [1] "header-attrs-2.8"     "remark-0.14.1.min.js" "remark-css-0.0.1"

### Download or create a minimal Rmarkdown example

    url <- "https://gist.githubusercontent.com/ZGFabian/039aa35a6e9847b45e3c635ae747216a/raw/"
    download.file(url = url, destfile = "minimal-example.rmd")

If you would create Rmarkdown yourself, you can do it with
`file.create()`, `file.edit()` functions programmatically.

### Render Rmarkdown to HTML

After we got `minimal-example.rmd` to render Rmarkdown to HTML:

    rmarkdown::render(input = 'minimal-example.rmd',
                      output_format = 'xaringan::moon_reader',
                      output_file = "minimal-example.html",
                      output_dir = ".",
                      clean = TRUE)

    # list.files("./lib/")

You can see with `list.files("./lib/")` command, `render` have created
some new folders in `lib` directory: “header-attrs-2.8” and
“remark-css-0.0.1”. Take this note like a technical remark and you don’t
need to care about now. Go ahead and check out the fresh presentation in
a browser (firefox in the example):

    options(browser = "firefox") # any browser of your choice
    browseURL("minimal-example.html")

## Files

-   Rscript (minimal-example.R): [download as
    zip](https://gist.github.com/ZGFabian/a017e662d3b3494f2e143db1c9c98d02/archive/9aa28c6d9468d43826bb2fe9cd08f6023baca2a1.zip)
-   Example Rmarkdown file: [download as
    zip](https://gist.github.com/ZGFabian/039aa35a6e9847b45e3c635ae747216a/archive/aac28c03fe41a329c66c1e7bee48f212055692e8.zip)
    | [view as raw
    text](https://gist.githubusercontent.com/ZGFabian/039aa35a6e9847b45e3c635ae747216a/raw/)

## Appendix

    R version 4.1.0 (2021-05-18)
    Platform: x86_64-pc-linux-gnu (64-bit)
    Running under: Manjaro Linux

    Matrix products: default
    BLAS:   /usr/lib/libopenblasp-r0.3.17.so
    LAPACK: /usr/lib/liblapack.so.3.10.0

    attached base packages:
    [1] stats     graphics  grDevices utils     datasets  methods   base

    loaded via a namespace (and not attached):
     [1] digest_0.6.27     R6_2.5.0          jsonlite_1.7.2    magrittr_2.0.1
     [5] evaluate_0.14     xaringan_0.22     stringi_1.7.3     rlang_0.4.11
     [9] jquerylib_0.1.4   bslib_0.2.5.1     rmarkdown_2.8     tools_4.1.0
    [13] stringr_1.4.0     xfun_0.23         yaml_2.2.1        compiler_4.1.0
    [17] htmltools_0.5.1.1 knitr_1.33        sass_0.4.0
