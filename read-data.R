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
		altname <- as.character(altnames[[i]])
		name <- as.character(names[[i]])
		map[[altname]] <- name
	}
	return(map)
}
		
make.inverse.map <- function(name.map) {
	invmap <- list()
	for(i in 1:length(name.map)) {
		altname <- names(name.map)[[i]]
		name <- name.map[[i]]
		invmap[[name]] <- altname
	}
	return(invmap)
}

read.challenge.data <- function() {
	


	essentiality <- read.table("/home/alden/dream9tools/data/Achilles_v2.11_training_phase2.gct", skip=2, header=TRUE)
	expression.training <- read.table("/home/alden/dream9tools/data/CCLE_expression_training_phase2.gct", skip=2, header=TRUE)
	expression.leaderboard <- read.table("/home/alden/dream9tools/data/CCLE_expression_leaderboard_phase2.gct", skip=2, header=TRUE)
	copynumber.training <- read.table("/home/alden/dream9tools/data/CCLE_copynumber_training_phase2.gct", skip=2, header=TRUE)
	copynumber.leaderboard <- read.table("/home/alden/dream9tools/data/CCLE_copynumber_leaderboard_phase2.gct", skip=2, header=TRUE)

	name.map <- make.altnames.map(expression.training)
	inv.name.map <- make.inverse.map(name.map)
	expression.training <- gct.to.matrix(expression.training)
	essentiality <- gct.to.matrix(essentiality)
	expression.leaderboard <- gct.to.matrix(expression.leaderboard)
	copynumber.training <- gct.to.matrix(copynumber.training)
	copynumber.leaderboard <- gct.to.matrix(copynumber.leaderboard)



	save(name.map, inv.name.map, expression.training, essentiality, expression.leaderboard, copynumber.training, copynumber.leaderboard, file="/home/alden/dream9tools/parsed-data/challenge-parsed.RData")

}
ccle.expression.matrix <- function(ccle.expression) {
	rnames <- ccle.expression[,1]
	duplicates <- which(duplicated(rnames) == TRUE)
	while(length(duplicates) > 0) {
		print(duplicates)
		rnames <- rnames[-duplicates[[1]]]
		ccle.expression <- ccle.expression[-duplicates[[1]],]
		duplicates <- which(duplicated(rnames) == TRUE)
	}
	rownames(ccle.expression) <- rnames
	ccle.expression <- ccle.expression[,-1]
	ccle.expression <- as.matrix(ccle.expression)
	return(ccle.expression)
}


read.ccle.data <- function() {
	ccle.expression <- read.table("/home/alden/dream9tools/data/CCLE_Expression_Entrez_2012-09-29.tab", header=TRUE, fill=TRUE)
	ccle.expression <- ccle.expression.matrix(ccle.expression)
	drug.data <- read.csv("/home/alden/dream9tools/data/CCLE_NP24.2009_Drug_data_2012.02.20.csv", header=TRUE)
	drug.profiles <- read.csv("/home/alden/dream9tools/data/CCLE_NP24.2009_profiling_2012.02.20.csv", header=TRUE)
	source("make-drug-response-matrix.R")
	drug.response.matrix <- make.response.matrix(drug.data, drug.profiles, ccle.expression)
	
	save(ccle.expression, drug.data, drug.profiles, drug.response.matrix, file="/home/alden/dream9tools/parsed-data/ccle-data.RData")
}
read.pathways <- function() {
	pathwayfile <- file("data/msigdb_c2_cp_deredund.tab")
	lines <- readLines(pathwayfile)
	lines <- strsplit(lines, "\t")
	pathways <- list()
	for(i in 1:length(lines)) {
		line <- lines[[i]]
		pathwayname <- line[[1]]
		genes <- line[-1]
		pathways[[pathwayname]] <- genes
	}
	save(pathways, file="parsed-data/pathways.RData")

}

