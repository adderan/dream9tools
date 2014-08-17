
drug.correlations <- read.table("../dream9tools/data/CCLE_vs_challenge.Amax.tab", header=TRUE)
drug.correlations.names <- drug.correlations[,1]
rownames(drug.correlations) <- drug.correlations.names
drug.correlations <- drug.correlations[,-1]


choose.drugs <- function() {
	
	n.genes <- dim(drug.correlations)[[1]]
	most.correlated.drugs <- list()
	for(i in 1:n.genes) {
		correlations.for.gene <- drug.correlations[i,]
		gene.name <- rownames(drug.correlations)[[i]]
		drug.index <- which.max(correlations.for.gene)
		most.correlated.drugs[[gene.name]] <- colnames(drug.correlations)[[drug.index]]
	}
	save(most.correlated.drugs, file="most-correlated-drugs.RData")
}
