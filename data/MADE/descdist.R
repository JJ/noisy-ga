library(fitdistrplus)

for ( i in c(64,128,256)) {
    for ( j in unique(subset(fitness,Gen==i)$ID) ) {
        writeLines( paste( "Gen ", i, " ID ", j ))
        try(descdist(subset(fitness,Gen==i&ID==j)$Fitness,discrete=FALSE,boot=1000));
        readline(prompt="Press [enter] to continue");
    }
}
