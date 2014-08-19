parse.gct <- function(filename) {
	data <- read.table(filename, skip=2, header=TRUE)
	rownames(data) <- data[,1]
	data <- data[,-1]
	data <- data[,-1]

	data <- as.matrix(data)
	return(data)
}
