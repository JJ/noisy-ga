library(e1071)
library(ggplot2)

s.k <- data.frame(Gen=character(), 
                  Skewness=character(),
                  Kurtosis=character(),
                  stringsAsFactors=FALSE)
for ( i in c(64,128,256)) {
    for ( j in unique(subset(fitness,Gen==i)$ID) ) {
        writeLines( paste( "Gen ", i, " ID ", j ))
        this.data <- subset(fitness,Gen==i & ID==j)$Fitness
        s.k <- rbind( s.k
                     , data.frame(Gen=paste("Gen",i)
                                  ,Skewness=skewness(this.data)
                                  ,Kurtosis=kurtosis(this.data)))
    }
}

ggplot(s.k,aes(x=Skewness,y=Kurtosis,color=Gen))+geom_point()+scale_x_continuous(limits=c(-1,2.5))+scale_y_continuous(limits=c(-1,8))
