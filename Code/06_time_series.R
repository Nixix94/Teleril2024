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


# lezione su temperature della Groelandia - ice melting
# proxy - variabile usata al posto di un'altra perchè è più facile lavorarci
# EuroLST - dataset temperatura al suolo per l'europa
# Poi ESA ne ha creato uno per tutta la terra
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2000, col=clg)
# i valori affianco sono i numeri di bit, poi si possono convertire in °C
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

plot(g2015, col=clg)

par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)
dev.off()
# stacking the data <- trasformo in bande di un'unica immagine
stackg <- c(g2000, g2005, g2010, g2015)
plot(stackg, col=clg)
# livelli di una stessa immagine (ogetto: stackg), senza fare il par

# make the differencxe between the first and the final elemnts of the stack
difg <- stackg[[1]] - stackg[[4]]
# difg = g2000 - g2015
cldifg <- colorRampPalette(c("red", "white", "blue")) (100)
plot(difg, col=cldifg)
# differenza tra 2000 e 2015, dove è rosso le temperature sono aumentate


# Exercise: make a RGB plot using different years
im.plotRGB(stackg, r=1, g=2, b=4)
# r=2000, g=2005, b=2015
# pongo i livelli al posto delle bande e a seconda del colore dominante so di quale anno sono le temp più alte
# servono per dare una quantificazione al cambiamento tenendo valori continuii, facendo una semplice differenza tra immagini



