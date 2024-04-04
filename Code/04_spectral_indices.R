# indici spettrali

# riflettanza divisione tra energia riflessa al numeratore ed energia d'incidenza al denominatore, con range 0 e 1
# indice vegetazionale di riflettanza si ottiene con la differenza tra i valori di riflettanza in nir con quella della banda del rosso
# DVI
# la riflettanza dipende, oltre che dalla pianta in sè (firma spettrale), anche dallo stato di salute e dal tipo di copertura
# rededge ultima parte vicino al rosso ed indica quanto una pianta è sana, < è la pendenza migliore è lo stato di salute
# nir riflesso dal mesofillo
library(terra)
library(imageRy)

# curiosità: html codice che costituiscono l'output dei siti web ctrl+maiusc+c
# NASA earth observatory, NASA visible earth, NASA landsat science - siti web
# costruito immagini in falsi colori con banda 1 in nir, 2 rosso e 3 verde
im.list() # richiamo la lista 
# importo matogrosso1992 attraverso funzione im.import
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
# band 1 = nir
# band 2 = red
# band 3 = green
# plotto l'immagine con le conseguenti immagini
im.plotRGB(m1992, r=1, g=2, b=3)
# nir in verde
im.plotRGB(m1992, 2, 1, 3)
# far risultare il suolo nudo come giallo allore nir in blu
im.plotRGB(m1992, 2, 3, 1)
# l'acqua diventa nera se c'è il nir tra i falsecolor, in quanto assorbe completamete il nir
# altri colori possono esser determinati da vegetazione algale o sedimenti

m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

par(mfrow=c(1,2))
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m2006, 1, 2, 3)
dev.off()

im.plotRGB(m2006, 2, 1, 3) #nir on green
im.plotRGB(m2006, 2, 3, 1) #nir on blue

par(mfrow=c(2,3))
im.plotRGB(m1992, 1, 2, 3) #nir on red
im.plotRGB(m1992, 2, 1, 3) #nir on green
im.plotRGB(m1992, 2, 3, 1) #nir on blue
im.plotRGB(m2006, 1, 2, 3) #nir on red
im.plotRGB(m2006, 2, 1, 3) #nir on green
im.plotRGB(m2006, 2, 3, 1) #nir on blue
dev.off()

# valori di riflettanza da 0 a 1, troppe informazioni serve semplificare e poter trasmettere un messaggio complesso -> sistema binario di comunicazione
# approsimiamo tutti i valori per l'intero trasformiamo tutti i valori di riflettanza in 8bit ovvero tra 0 a 256 <- migliore getione dell'immagine
# esa con 16bit ovvero da 0 a 65536 <- però questo operativo dal 2018
# risoluzione spaziale - dimensione del pixel
# risoluzione spettrale - quante bande ho e su cui posso operare
# risoluzione radiometrica - quanti valori di bit sto usando

# 3, 13, 1113, 3113, 132113, ...... trovo l'ultimo numero 1113122113

# calcolo di indice di vegetazione DVI (difference vegetation index)
# immagine a 8bit, dunque con un range tra -255 e 255 - mi dice che questo indice è forstemtente influenzato dalla lunghezza radiometrica
dvi1992 = m1992[[1]] - m1992[[2]]

# altrimenti cercando in m1992 lo faccio direttamente con i nomi delle bande associandoli con il $, presenti nei metadati

# plot del DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

# plot DVI 2006
dvi2006 = m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# par
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)
dev.off()

# normalizzazione = ndvi
# nir-r/nir+r 
# range tra 1 e -1, con nir max = 1 con nir nullo = -1
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])

# qual'è il problema con le palette? perchè hai usato l'ndvi anziche il dvi
# par
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
dev.off()







