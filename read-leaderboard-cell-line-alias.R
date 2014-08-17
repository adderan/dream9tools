alias <- as.character(read.table("data/Cell_line_annotation_leaderboard_phase2.txt", fill=TRUE)[,2])
alias <- alias[-1]
save(alias, file="parsed-data/leaderboard-cell-line-alias.RData")
