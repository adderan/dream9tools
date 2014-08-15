select <- function(features, data) {
	if(length(features) == 0) return(NULL)
	selected.data <- matrix(0, length(features), dim(data)[[2]])
	for(i in 1:length(features)) {
		f <- features[[i]]
		#if(! (f %in% rownames(data))) break
		#print(f)
		selected.data[i,] <- data[f,]
	}
	return(selected.data)
}
