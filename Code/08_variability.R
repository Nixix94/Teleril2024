# Measuring variability from satellite imagery
# Varianza - estraggo la media del campione e poi vedo quanto ogni singolarità ottengo lo scarto, tutto al quadrato, ed infine si divide per il num tot

library(imageRy)
library(terra)
library(viridis)

im.list()
# estraggo dalla lista l'immagne
sent <- im.import("sentinel.png")

# band 1 = NIR
# band 2 = red
# band 3 = green

im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=2, g=1, b=3)

nir <- sent[[1]]
plot(nir)

cl <- colorRampPalette(c("red", "orange", "yellow"))(100)
plot(nir, col=cl)
# variabilità spettrale - situazione eterogenea i pixel costituiscono varie rifflettanze, diverse tra loro. Diffirente se parliamo di una continuità del 
# moving window - finestra di calcolo 3*3 e la uso sull'immagine estraendo i 
# focal funzione con oggetto e matrice
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

viridisc <- colorRampPalette(viridis(7))(256)
plot(sd3, col=viridisc)
# si nota una variabilità molto alta in corrispondenza della alta variabilità geologica e conformazione del terreno

# Calcolare la variabilità con una moving window di 7*7 pixels
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7, col=viridisc)

# plot via par(mfrow()) del 3x3 e del 7x7 della deviazione standard
par(mfrow=c(1,2))
plot(sd3, col=viridisc)
plot(sd7, col=viridisc)
dev.off()

# original image plus the 7x7 sd
im.plotRGB(sent, r=2, g=1, b=3)
plot(sd7, col=viridisc)

# stack
stacksd <- c(sd3, sd7)
plot(stacksd, col=viridisc)

# Standard deviation 13x13
sd13 <- focal(nir, matrix(1/169, 13, 13), fun=sd)

stacksd <- c(sd3, sd7, sd13)
plot(stacksd, col=viridisc)

# non c'è un modello migliore, dipende dallo scopo ho una finestra più appropriata

pairs(sent)
# ho la correlazione tra le varie bande
# in questo caso ho un'elevata correlazione tra rosso e verde
# posso unsare la componente principale per semplificare i calcoli
