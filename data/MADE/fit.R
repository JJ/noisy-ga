library(fitdistrplus)

fitnames <-  c('weibull','norm','gamma','pois','beta','cauchy','uniform')

fit.to.noise <- function( data ) {
    fits <- list()
    for ( f in fitnames ) {
        writeLines( paste("------->Model ", f ))
        fit <-   try(fitdist( data, f))
        if(isTRUE(all.equal(class(fit), "try-error"))) {
            writeLines(paste("------->Model ", f,  "failed"))
        } else {
            fits[[f]] <- fit
        }
    }
    return(fits)
}

df <- data.frame(Gen=character(), 
                 ID=character(),
                 Models=character(),
                 stringsAsFactors=FALSE)

noise.params <- data.frame(Gen=character(), 
                           ID=character(),
                           Models=character(),
                           param1=character(),
                           param2=character(),
                           stringsAsFactors=FALSE)

for ( i in c(64,128,256) ){
    writeLines(paste("\n\n->Generation",i))
    for (j in unique(fitness[fitness$Gen==i,]$ID)) {
        writeLines(paste("\n---->ID ",j))
        noise.models <-fit.to.noise(subset(fitness,Gen==i & ID==j)$Fitness)
        if (length(noise.models) > 1 ) {
            models <- paste(names(noise.models),sep=' - ')
            print( paste("With models ", models) )
#            gof <- gofstat( noise.models, fitnames=names(noise.models))
            df <- rbind( df, data.frame(Gen=i,ID=j,Models=models))
#            print(gof)
        } else if (length(noise.models) == 1 ) {
            models <- paste(names(noise.models))
            df <- rbind( df, data.frame(Gen=i,ID=j,Models=models))
            noise.params <- rbind( noise.params
                                  , data.frame(Gen=i,ID=j
                                               ,Models=models
                                               ,param1=noise.models[[1]]$estimate[1]
                                               ,param2=noise.models[[1]]$estimate[2]))
            print(noise.models[[1]])
        }
        writeLines(paste("\n---->End ID ",j))
    }
    writeLines(paste("\n\n->End generation",i))
        
}
