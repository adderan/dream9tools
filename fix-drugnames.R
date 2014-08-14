fix.drugnames <- function(drug.response.matrix) {
	newcolnames <- list()
	for(i in 1:length(colnames(drug.response.matrix))) {
		newcolnames[[i]] <- gsub("[-]", ".", colnames(drug.response.matrix)[[i]])
	}
	newcolnames[[4]] <- "PF2341066"
	newcolnames[[11]] <- "PD.0332991"
	newcolnames[[19]] <- "X17.AAG"
	newcolnames[[21]] <- "Panobinostat"
	newcolnames[[6]] <- "ZD.6474"
	colnames(drug.response.matrix) <- newcolnames
	return(drug.response.matrix)
}


