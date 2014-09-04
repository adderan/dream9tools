#!/usr/bin/env Rscript

source("../dream9tools/parse-gct.R")
answers <- parse.gct("phase2_leaderboard_answers.gct")

args <- commandArgs(trailingOnly = TRUE)
filename <- args[1]

predictions <- parse.gct(filename)

n.essentialities <- dim(answers)[[1]]
n.samples <- dim(answers)[[2]]
correlations.each.gene <- matrix(0, 1, n.essentialities)

for(i in 1:n.essentialities) {
	correlations.each.gene[i] <- cor(answers[i,], predictions[i,], method="spearman")
}
score <- mean(correlations.each.gene)
cat("score: ", score, "\n")



