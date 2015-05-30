library(fitdistrplus)

for ( j in unique(subset(fitness,Gen==64)$ID) ) {
    writeLines( paste( "ID ", j ))
    descdist(subset(fitness,Gen==64&ID==j)$Fitness,discrete=FALSE,boot=1000);
    readline(prompt="Press [enter] to continue");
}
