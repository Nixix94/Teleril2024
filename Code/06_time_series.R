# Metodo per quantificare il cambiamento nel tempo
# time series analysis

library(imageRy)
library(terra)

im.list()

# importare i dati
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)
# .auto mi prende automaticamente le prime tre bande

# using the first element (band) of images
dif = EN01[[1]] - EN13[[1]]
# differenza tra ogni pixel del primo livello, mi dice quali punti hanno avuto un cambiamento maggiore
# palette con rosso i valori maggiori di riduzione livelli inquinamento
cldif <- colorRampPalette(c("blue", "white", "red")) (100)
plot(dif, col=cldif)








