# indici spettrali

# riflettanza divisione tra energia riflessa al numeratore e incidenza al denominatore
# indice vegetazionale di riflettanza si ottiene con la differenza tra i valori di riflettanza in nir con quella della banda del rosso
# DVI
# la riflettanza dipende, oltre che dalla pianta in sè (firma spettrale), anche dallo stato di salute e dal tipo di copertura
# rededge ultima parte vicino al rosso ed indica quanto una pianta è sana, < è la pendenza migliore è lo stato di salute

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








