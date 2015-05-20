gen.1 <- read.csv("gen1.csv",head=FALSE)
gen.25 <- t(read.csv("gen25.csv",head=FALSE))
gen.50 <- t(read.csv("gen50.csv",head=FALSE))

gen1.df <- data.frame(ID=character(),
                      Fitness=character())
for (i in 1:length(gen.1)) {
    for ( j in 1:length(gen.1[,i])) {
        gen1.df <- rbind( gen1.df, data.frame(ID=paste("i",j),fitness=gen.1[j,i]))
    }
}
library(ggplot2)
ggplot(gen1.df, aes(fitness, fill = ID)) + geom_bar(alpha = 0.2)
