## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width=7, 
  fig.height=5
)

## ----setup--------------------------------------------------------------------
library(WOTPLY)

## -----------------------------------------------------------------------------

load(system.file("extdata", "cluster_label_example.Rda", package = "WOTPLY"))
#load(system.file("extdata", "time_label_example.Rda", package = "WOTPLY"))

load(system.file("extdata", "example_day_10_12.Rda", package = "WOTPLY"))
load(system.file("extdata", "example_day_12_14.Rda", package = "WOTPLY"))
load(system.file("extdata", "example_day_14_16.Rda", package = "WOTPLY"))
load(system.file("extdata", "example_day_16_18.Rda", package = "WOTPLY"))




## -----------------------------------------------------------------------------
list_transition_matrices_example <- list(example_day_10_12,example_day_12_14,example_day_14_16,example_day_16_18)
selected_stages <- c("IPS","Trophoblast","Epithelial","STROMAL","NEURAL")
legend_time_example <- c("day_10","day_12","day_14","day_16","day_18")


customize_color <- WOTPLY:::gg_color_hue(length(levels(factor(cluster_label_example))))



## -----------------------------------------------------------------------------


#png("/Users/gabriele.lubatti/Desktop/Phd/Embryo_Organoids/wot_publsihed_data/input_wot/WOTPLY_1.png")
WOTPLY(list_transition_matrices_example, selected_stages, cluster_label_example, legend_time_example, customize_color, top_link = NULL)
#dev.off()


## -----------------------------------------------------------------------------

#png("/Users/gabriele.lubatti/Desktop/Phd/Embryo_Organoids/wot_publsihed_data/input_wot/WOTPLY_2.png")
WOTPLY(list_transition_matrices_example, selected_stages, cluster_label_example, legend_time_example,customize_color, top_link = 3)
#dev.off()

## -----------------------------------------------------------------------------
utils::sessionInfo()

