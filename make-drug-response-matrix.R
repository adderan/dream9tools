
make.response.matrix <- function(drug.response, drug.profiles, ccle.expression) {
	drug.names <- drug.profiles[,1]
	sample.names <- colnames(ccle.expression)
	n.points <- dim(drug.response)[[1]]
	n.drugs <- length(drug.names)

	response.matrix <- matrix(0, n.ccle.samples, n.drugs)
	
	colnames(response.matrix) <- drug.names
	rownames(response.matrix) <- sample.names
	for(i in 1:n.points) {
		drugname <- drug.response[i, "Compound"]
		samplename <- drug.response[i, "CCLE.Cell.Line.Name"]
		#print(drugname)
		#print(samplename)
		#cat("drug name: ", drugname, " sample name: ", samplename, "\n")
		response.matrix[samplename, drugname] <- drug.response[i, "Amax"]
	}
	return(response.matrix)
	
}
