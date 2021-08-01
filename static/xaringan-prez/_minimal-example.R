setwd(".")
dir.create("./lib")
## download remark.js /it can be good idea to pin a specific version to be future-proof/
xaringan::summon_remark(version = "0.14.1", to = "./lib/")
list.files("./lib/")

## file.create("minimal-example.rmd")
# file.edit("minimal-example.rmd") or download
url <- "https://gist.githubusercontent.com/ZGFabian/039aa35a6e9847b45e3c635ae747216a/raw/"
download.file(url = url, destfile = "minimal-example.rmd")

## after editing "minimal-example.rmd"
## render Rmarkdown to html
rmarkdown::render(input = 'minimal-example.rmd',
                  output_format = 'xaringan::moon_reader',
                  output_file = "minimal-example.html",
                  output_dir = ".",
                  clean = TRUE)
list.files("./lib/")
options(browser = "firefox") # any browser of your choice
browseURL("minimal-example.html")
x <- sessionInfo()
print(x, locale = FALSE)
