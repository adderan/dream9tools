make.feature.list <- function(feature.lists, essentialities, filename) {
	cat("making feature list\n")
	sink(filename)
	for(i in 1:length(feature.lists)) {
		f <- feature.lists[[i]]
		cat(essentialities[[i]])
		for(j in 1:length(f)) {
			cat("\t")
			cat(f[[j]])
		}
		cat("\n")
	}
	sink()
}

