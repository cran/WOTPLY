# Example with 3 transition matrices and 4 different time points.

transition_1 <- matrix(0.2,ncol = 4,nrow = 4)
colnames(transition_1) <- c("Stage1", "Stage2", "Stage3","Stage4")
row.names(transition_1) <- c("Stage1", "Stage2", "Stage3","Stage4")
transition_2 <- matrix(0.2,ncol = 4,nrow = 4)
colnames(transition_2) <- c("Stage1", "Stage2", "Stage3","Stage4")
row.names(transition_2) <- c("Stage1", "Stage2", "Stage3","Stage4")
transition_3 <- matrix(0.2,ncol = 4,nrow = 4)
colnames(transition_3) <- c("Stage1", "Stage2", "Stage3","Stage4")
row.names(transition_3) <- c("Stage1", "Stage2", "Stage3","Stage4")

list_transition_matrices_example <- list((transition_1), (transition_2), (transition_3))
selected_stages <- c("Stage1", "Stage2")
cluster_label_example <- c("Stage1", "Stage2", "Stage3","Stage4")
legend_time_example <- c("Day1", "Day2", "Day3", "Day4")


customize_color <- WOTPLY:::gg_color_hue(length(cluster_label_example))


# WOTPLY return an error if one or more transition matrices have only zeros

transition_1 <- matrix(0,ncol = 4,nrow = 4)
colnames(transition_1) <- c("Stage1", "Stage2", "Stage3","Stage4")
row.names(transition_1) <- c("Stage1", "Stage2", "Stage3","Stage4")
list_transition_matrices_example <- list((transition_1), (transition_2), (transition_3))



test_that("WOTPLY return an error if one or more transition matrices have only zeros", {
  expect_error(WOTPLY(list_transition_matrices_example, selected_stages, cluster_label_example, legend_time_example, customize_color, NULL)
, "One or more transition matrices have only zeros")
})

# WOTPLY return an error if the names of cluster_label is different from row.names or col.names of the transition matrices

transition_1 <- matrix(0.1, ncol = 4, nrow = 4)
colnames(transition_1) <- c("Stage_new_name", "Stage2", "Stage3","Stage4")
row.names(transition_1) <- c("Stage1", "Stage2", "Stage3","Stage4")
legend_time_example <- c("Day1","Day2","Day3","Day4")
cluster_label_example <- c("Stage1", "Stage2", "Stage3","Stage4")

list_transition_matrices_example <- list((transition_1), (transition_2), (transition_3))

test_that("WOTPLY return an error if the names of cluster_label is different from row.names or col.names of the transition matrices", {
  expect_error(WOTPLY(list_transition_matrices_example, selected_stages, cluster_label_example, legend_time_example, customize_color, NULL)
               , "Some row.names or colnames of transition matrices are different from names in cluster_label")
})










