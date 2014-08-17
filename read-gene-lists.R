top25 <- as.character(read.table("../dream9tools/genelists/top25per.features.lst")[,1])

expression.allowed.features <- as.character(read.table("../dream9tools/genelists/expression_feature_list_phase2.txt")[,1])

copynumber.allowed.features <- as.character(read.table("../dream9tools/genelists/copynumber_feature_list_phase2.txt")[,1])

sigGenes <- as.character(read.table("../dream9tools/genelists/copynumber_feature_list_phase2.txt")[,1])

essentialities.to.rank <- as.character(read.table("../dream9tools/genelists/prioritized_gene_list_phase2.txt")[,1])

save(top25, expression.allowed.features, copynumber.allowed.features, sigGenes, essentialities.to.rank, file="gene-lists.RData")


