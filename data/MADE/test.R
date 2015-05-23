library(ggplot2)
fitness <- read.csv("made-data.csv")


 ggplot(fitness[fitness$Gen==64,], aes(Fitness,fill=ID)) + geom_bar(position="dodge")
 ggplot(fitness[fitness$Gen==128,], aes(Fitness,fill=ID)) + geom_bar(position="dodge")
 ggplot(fitness[fitness$Gen==256,], aes(Fitness,fill=ID)) + geom_bar(position="dodge")
