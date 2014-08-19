write.challenge3.list <- function(features, filename) {
	sink(filename)
	for(i in 1:length(features)) {
		cat(features[[i]])
		if(i < 100) {
			cat("\t")
		}
	}
	cat("\n")
	sink()
}

