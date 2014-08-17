write.gct <- function(results, filename) {
	print("wriing gct")
	sink(filename)
	cat("#1.2\n")
	cat(dim(results)[[1]], "\t", dim(results)[[2]], "\n")
	cat("Name", "\t", "Description")
	for(i in 1:dim(results)[[2]]) {
		cat("\t")
		cat(colnames(results)[[i]])
	}
	cat("\n")
	for(i in 1:dim(results)[[1]]) {
		cat(rownames(results)[[i]])
		cat("\t")
		cat(rownames(results)[[i]])
		for(j in 1:dim(results)[[2]]) {
			cat("\t")
			cat(results[i,j])
		}
		cat("\n")
	}
	sink()
}


