#  Makes a dataset that aggregates presence and absence to the generic level.

p.set <- pollen.set[match(colnames(presence), pollen.set$spec.code),]

pres.ge <- adply(.data = presence, 
                 .margins = 1, 
                 .expand = FALSE,
                 .fun = function(x) {run <- aggregate(as.numeric(x) ~ p.set$genus, FUN=sum)
                                     out <- run[,2]
                                     names(out) = run[,1]; out},
                 .progress='text')[,-1]
 
write.csv(pres.ge, 'RichnessCSVs/pres.ge.csv')

rm(p.set)