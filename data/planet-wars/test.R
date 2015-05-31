library(ggplot2)

#Function definitions
process.to.df <- function( data ){
    df <- data.frame(Gen=character(),
                     ID=character(),
                     Fitness=character())
    for (i in 1:length(data$Fitness)) {
        df <- rbind( df
                    , data.frame(Gen=data[i,]$Gen
                                 , ID=paste(data[i,]$ID,"2")
                                 , Fitness=data[i,]$Fitness)
                    )
    }
    return(df)
}

#load stuff
planet.wars.df <- read.csv("experiment-1.csv")
planet.wars.df <- rbind(planet.wars.df,process.to.df(read.csv("experiment-2.csv")))

