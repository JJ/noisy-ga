library(fitdistrplus)

fitnames <-  c('weibull','norm','gamma')

fit.to.noise <- function( data ) {
    fits <- list()
    for ( i in fitnames ) {
        print( i )
        fit <-   try(fitdist( data, i))
        if(isTRUE(all.equal(class(fit), "try-error"))) {
            writeLines(paste("Model ", i,  "failed"))
        } else {
            fits[[i]] <- fit
        }
    }
    return(fits)
}

df <- data.frame(Gen=character(), 
                 ID=character(),
                 Models=character(),
                 stringsAsFactors=FALSE) 
for ( i in c(64,128,256) ){
    print(i)
    for (j in unique(fitness[fitness$Gen==i,]$ID)) {
        print(j)
        noise.models <-fit.to.noise(subset(fitness,Gen==i & ID==j)$Fitness)
        if (length(noise.models) > 1 ) {
            models <- paste(names(noise.models),sep=' - ')
            print( "With models ", models )
            gof <- gofstat( noise.models, names(noise.models))
            df <- rbind( df, data.frame(Gen=i,ID=j,Models=models))
            print(gof)
        } else if (length(noise.models) == 1 ) {
            df <- rbind( df, data.frame(Gen=i,ID=j,Models=paste(names(noise.models),sep=' - ')))
            print(noise.models[[1]])
        }
    }
        
}
