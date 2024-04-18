# Come importare dati da cartelle esterne

library(terra)
library(imageRy)
# install.packages("RNetCDF")
library(RNetCDF)
# per poter leggere le immagini scaricate da Copernicus


# selezionare la working directory, cartella sulla quale si sta lavorando:
# setwd("youtpath") funzione con argomento il percorso della cartella
# Windowa users: C:\\path\Downloads -> C://path/Downloads

setwd("C:/Users/Utente/Documents/R/Progetti R/Telerilevamento2024")
# rast funzione, all'interno del pacchetto "terra", che mi permette di importare le immagini
eclissi <- rast("najafiraq_etm_2003140_lrg.jpg")  # like in im.import()
# avviso "unknow extent" per avvisare che l'immagine non è georeferenziata
eclissi
# richiamo il dato per vedere il nome delle bande
# plot the data
plotRGB(eclissi, 1, 2, 3)
plotRGB(eclissi, 2, 3, 1)
# differenza tra bande (che in questo caso non serve a nulla)
diff = eclissi[[1]] - eclissi[[2]] # analisi temporale
plot(dif)

# esercizio con un'altra foto
costa <- rast("costa.jpg")
costa
plotRGB(costa, 1, 2, 3)
plotRGB(costa, 3, 1, 2)
plotRGB(costa, 2, 1, 3)

# importazione del dato scaricato da Copernicus
# pacchetto terra si integra con pacchetto RNetCDF
ice <- rast("c_gls_SCE500_202404040000_CEURO_MODIS_V1.0.1.nc")
ice
plot(ice)

# fare un crop, ritaglio
ext <- c(10, 20, 45, 50) # decido l'estensione del ritaglio
icecrop <- crop(ice, ext) # uso funzione crop
plot(icecrop) # risultato








