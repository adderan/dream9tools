gct.to.matrix <- function(data) {
	rnames <- data[,1]
	data <- data[,-1]
	data <- data[,-1]
	rownames(data) <- rnames
	data <- as.matrix(data)
	return(data)
}
make.altnames.map <- function(expression) {
	altnames <- expression[,1]
	names <- expression[,2]
	map <- list()
	for(i in 1:length(altnames)) {
		altname <- altnames[[i]]
		name <- names[[i]]
		map[[altname]] <- name
	}
	return(map)
}

read.challenge.data <- function() {
	


	essentiality <- read.table("/home/alden/dream9tools/data/Achilles_v2.11_training_phase2.gct", skip=2, header=TRUE)
	expression.training <- read.table("/home/alden/dream9tools/data/CCLE_expression_training_phase2.gct", skip=2, header=TRUE)
	expression.leaderboard <- read.table("/home/alden/dream9tools/data/CCLE_expression_leaderboard_phase2.gct", skip=2, header=TRUE)
	copynumber.training <- read.table("/home/alden/dream9tools/data/CCLE_copynumber_training_phase2.gct", skip=2, header=TRUE)
	copynumber.leaderboard <- read.table("/home/alden/dream9tools/data/CCLE_copynumber_leaderboard_phase2.gct", skip=2, header=TRUE)

	name.map <- make.altnames.map(expression.training)
	expression.training <- gct.to.matrix(expression.training)
	essentiality <- gct.to.matrix(essentiality)
	expression.leaderboard <- gct.to.matrix(expression.leaderboard)
	copynumber.training <- gct.to.matrix(copynumber.training)
	copynumber.leaderboard <- gct.to.matrix(copynumber.leaderboard)

	save(name.map, expression.training, essentiality, expression.leaderboard, copynumber.training, copynumber.leaderboard, file="/home/alden/dream9tools/parsed-data/challenge-parsed.RData")

}

read.ccle.data <- function() {
	ccle.expression <- read.table("/home/alden/dream9tools/data/CCLE_Expression_Entrez_2012-09-29.tab", header=TRUE, fill=TRUE)
	drug.data <- read.csv("/home/alden/dream9tools/data/CCLE_NP24.2009_Drug_data_2012.02.20.csv", header=TRUE)
	drug.profiles <- read.csv("/home/alden/dream9tools/data/CCLE_NP24.2009_profiling_2012.02.20.csv", header=TRUE)

	save(ccle.expression, drug.data, drug.profiles, file="/home/alden/dream9tools/parsed-data/ccle-data.RData")
}

