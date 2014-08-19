load("../dream9tools/parsed-data/challenge-parsed.RData")
load("../dream9tools/parsed-data/ccle-data.RData")
load("../dream9tools/gene-lists.RData")
load("../dream9tools/most-correlated-drugs.RData")
load("../dream9tools/parsed-data/leaderboard-cell-line-alias.RData")
source("../dream9tools/select-data.R")
source("../dream9tools/fix-drugnames.R")
source("../dream9tools/write-gct.R")
source("../dream9tools/parse-gct.R")



#make a matrix similar to achilles expression matrix, with drug responses as labels
make.drug.gcts <- function() {
	expression.features.achilles <- rownames(expression.training)
	expression.features.ccle <- rownames(ccle.expression)

	mapped.expression.features.achilles <- name.map[expression.features.achilles]


	expression.features <- intersect(mapped.expression.features.achilles, expression.features.ccle)

	expression.features.altnames <- inv.name.map[expression.features]

	expression.data <- ccle.expression[expression.features,]

	rownames(expression.data) <- expression.features.altnames

	print(identical(name.map[rownames(expression.data)], expression.features))




	copynumber.features.achilles <- rownames(copynumber.training)
	copynumber.features.ccle <- rownames(ccle.copynumber)

	copynumber.features <- intersect(copynumber.features.achilles, copynumber.features.ccle)
	
	copynumber.data <- ccle.copynumber[copynumber.features,]


	sample.intersection <- intersect(colnames(expression.data), colnames(copynumber.data))
	sample.intersection <- intersect(rownames(drug.response.matrix), sample.intersection)

	copynumber.data <- copynumber.data[,sample.intersection]
	expression.data <- expression.data[,sample.intersection]
	drug.response.matrix <- drug.response.matrix[sample.intersection,]
	#return(list(copynumber.data, expression.data, drug.response.matrix))



	write.gct(t(drug.response.matrix), "drug-prediction/drug-response.gct")
	
	write.gct(expression.data, "drug-prediction/ccle-expression.gct")
	write.gct(copynumber.data, "drug-prediction/ccle-copynumber.gct")


}
convert.to.rdata <- function() {
	
	ccle.expression <- parse.gct("../dream9drugbaselinev2/drug-prediction/ccle-expression.gct")
	ccle.copynumber <- parse.gct("../dream9drugbaselinev2/drug-prediction/ccle-copynumber.gct")
	drug.response <- parse.gct("../dream9drugbaselinev2/drug-prediction/drug-response.gct")
	save(ccle.expression, ccle.copynumber, drug.response, file="drug-prediction/drug-prediction.RData")
}

	

