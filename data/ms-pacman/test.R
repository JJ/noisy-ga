library(ggplot2)

#Function definitions
process.to.df <- function( data ){
    df <- data.frame(ID=character(),
                     Fitness=character())
    for (i in 1:length(data)) {
        for ( j in 1:length(data[,i])) {
            df <- rbind( df, data.frame(ID=paste("i",j),fitness=data[j,i]))
        }
    }
    return(df)
}

#load stuff
gen1.df <- process.to.df(read.csv("gen1.csv",head=FALSE))
gen25.df <- process.to.df(read.csv("gen25.csv",head=FALSE))
gen50.df <- process.to.df(read.csv("gen50.csv",head=FALSE))



ggplot(gen1.df, aes(fitness, fill = ID)) + geom_bar(position="dodge")
ggplot(gen25.df, aes(fitness, fill = ID)) + geom_bar(position="dodge")
ggplot(gen50.df, aes(fitness, fill = ID)) + geom_bar(position="dodge")
