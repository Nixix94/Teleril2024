# indici spettrali

# riflettanza divisione tra energia riflessa al numeratore ed energia d'incidenza al denominatore, con range 0 e 1
# indice vegetazionale di riflettanza si ottiene con la differenza tra i valori di riflettanza in nir con quella della banda del rosso
# DVI (Difference Vegetation Index)
# Il DVI è un indice che si calcola sottraendo la banda del rosso alla banda del NIR. 
# In seguito deve essere normalizzato a NDVI per renderlo confrontabile con altri valori dello stesso indice.
# Nelle piante sane il NIR è riflesso molto e il rosso è assorbito quasi tutto dalle cellule a palizzata del mesofillo foliare 
#(solitamente in posizione verticale di massima riflettanza, una accanto all'altra). 
#Quando la pianta è stressata o sta morendo, il mesofillo collassa e le sue cellule si dispongono obliquamente,
# riflettendo di meno l'infrarosso e assorbendo meno rosso. 
# Nelle rispettive bande quindi, una pianta sana rifletterà più infrarosso e meno rosso (perchè viene assorbito) 
# mentre una pianta sotto stress o morta rifletterà meno infrarosso e più rosso. 
# Passando da una pianta sana a una sttressata/morta, i valori di riflettanza nell'infrarosso diminuiscono, mentre quelli nel rosso aumentano. 
# Su immagini satellitari dello stesso posto in anni differenti si può quindi vedere come variano questi indici per ogni pixel 
# dell'immagine, calcolando i due indici e confrontando le loro variazioni.
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

# normalizzazione = ndvi: 
# L'indice di differenza di vegetazione normalizzato è un indice semplice ma efficace per quantificare la vegetazione verde. 
# È una misura dello stato di salute della vegetazione basata su come le piante riflettono la luce a determinate lunghezze d'onda.
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
