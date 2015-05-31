library(ggplot2)

#Function definitions
process.to.df <- function( data, gen ){
    df <- data.frame(Gen=character(),
                     ID=character(),
                     Fitness=character())
    for (i in 1:length(data)) {
        for ( j in 1:length(data[,i])) {
            df <- rbind( df, data.frame(Gen=gen,ID=paste("i",j),Fitness=data[j,i]))
        }
    }
    return(df)
}

#load stuff
pacman.df <- process.to.df(read.csv("gen1.csv",head=FALSE),1)
pacman.df <- rbind(pacman.df,process.to.df(read.csv("gen25.csv",head=FALSE),25))
pacman.df <- rbind(pacman.df,process.to.df(read.csv("gen50.csv",head=FALSE),50))
