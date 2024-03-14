# https://sentinels.copernicus.eu/web/sentinel/user-guides/sentinel-2-msi/resolutions/spatial

# visuallizzazione dei dati satellitari in R attraverso imageRy
library(imageRy)
library(terra)

#tutte le funzioni all'interno di imageRy iniziano con "im"
#lista di tutti i dati disponibili all'interno del pacchetto
im.list()

#importiamo i dati di noto interesse: matogrosso
#oggetto assegnazione funzione argomento
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Plotting the data
plot(mato)

#importo altre immagini per andar in ordine e visualizzare prima un esempio con le singole bande

b2 <- im.import("sentinel.dolomites.b2.tif")
# immagine satellitare del programma Sentinel composta da varie bande, con il valore 2 si intende banda blu

# andiamo a cambiare la scala di colori attraverso la funzione colorRampPalette
clg <- colorRampPalette(c("black", "grey", "white"))(3)
# uso c (concatenate) per raccogliere i colori
# 3 sono le gradazione che scelgo, in questa funzione questo argomento va messo fuori dalle parentesi
# do un nome così sarà più facile da riprendere

plot(b2, col=clg)

# provo ad aumentare le sfumature
clg100 <- colorRampPalette(c("black", "grey", "white"))(100)
plot(b2, col=clg100)

clch <- colorRampPalette(c("magenta", "cyan4", "cyan", "chartreuse"))(100)
plot(b2, col=clch)
# attenzione che la roccia in parte riflette la banda del blu, come l'acqua
# la vegetazione invece assorbe banda blu e rosso per la fotosintesi e riflette il verde

# continuo importando tutte le altre bande
b3 <- im.import("sentinel.dolomites.b3.tif")
# banda 3 arriva fino a 560nm di lunghezza d'onda
b4 <- im.import("sentinel.dolomites.b4.tif")
# banda 4 banda del rosso
b8 <- im.import("sentinel.dolomites.b8.tif")
# banda 8 banda del vicino infrarosso
plot(b8, col=clch)
# le immagini sono di maggiore dettaglio, in quanto è maggiore la differenza dell'energia assorbita/riflessa

# creare multiframe dove inserirò tutte le immagini attraverso funzione par(mf)
# ciò mi consentirà di formare un telazio 2x2 dove collocare le bande
# elementi array, di uno stesso vettore, allora devo concatenarli
par(mfrow=c(2, 2))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

# Esercizio: creare un multiframe di una riga e 4 colonne

# stack images <- mi serve per archiviare le immagini satellitari tutte insieme
# le andiamo a considerare come elementi di un array, ottenendo così una singola immagine satellitare composta dai singoli elementi
stacksent <- c(b2, b3, b4, b8)
dev.off() 
# mi serve per resettare, cancellare il device grafico precedente
plot(stacksent, col=clch)
# per poter selezionare solo un singolo elemento posso farlo con [], questo mi seleziona la colonna
# mi servono due parentesi [[]], in quanto stiamo lavorando all'interno di una matrice (due dimensioni)
plot(stacksent[[4]], col=clch)
