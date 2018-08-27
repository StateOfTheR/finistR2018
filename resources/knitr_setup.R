## libraries always loaded 
library(microbenchmark)
library(tidyverse)

## Basic option chunks
knitr::opts_chunk$set(warning = FALSE, message = FALSE, cache = TRUE, verbose = TRUE,
               size = 'scriptsize',dev = 'pdf', fig.align = "center", results = "markup", 
               fig.width = 6, fig.height = 4,  fig.pos = 'htbp!', out.width = '.8\\textwidth',

               fig.path = "figures/", cache.path = "cache/")
knitr::opts_knit$set(child.path = params$child_path)

# knitr::knit_hooks$set(subdir = function(before, options, envir) {
# 
#     knitr::opts_knit$set(child.path = paste0(opt$child_path, "functionals/"))
#   options$child.path <- paste(options$child.path, subdir)
#   options
# })

## -----------------------------------------------------------------------------
## CUSTOMIZE CHUNKS

## Block font color in light gray
color_block = function(color) {
  function(x, options) sprintf('\\color{%s}\\begin{verbatim}%s\\end{verbatim}\\color{black}', color, x)
}
knitr::knit_hooks$set(output = color_block('gray'))
def.chunk.hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- def.chunk.hook(x, options)
  ifelse(options$size != "normalsize", paste0("\\", options$size,"\n\n", x, "\n\n \\normalsize"), x)
})

## -----------------------------------------------------------------------------
## GGPLOT OPTIONS

# Set plotting to bw plot default, but with transparent background elements.  
# Note transparency requires the panel.background, plot.background, and device background all be set!
theme_set(theme_bw(base_size=12))
theme_update(panel.background = element_rect(fill = "transparent", colour = NA),
             plot.background = element_rect(fill = "transparent", colour = NA))
knitr::opts_chunk$set(dev.args=list(bg="transparent"))
# I fail to define a permanent palette up to now
# # Set a color-blind friendly pallette
# # adapted from http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# cbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", 
#                "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# 

