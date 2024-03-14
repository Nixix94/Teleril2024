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
clg <- colorRampPalette(c("black", "grey", "little grey"))(3)
# uso c (concatenate) per raccogliere i colori
# 3 sono le gradazione che scelgo, in questa funzione questo argomento va messo fuori dalle parentesi
# do un nome così sarà più facile da riprendere
