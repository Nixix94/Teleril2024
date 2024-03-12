# visuallizzazione dei dati satellitari in R attraverso imageRy
library(imageRy)
library(terra)

#tutte le funzioni all'interno di imageRy iniziano con "im"
#lista di tutti i dati disponibili all'interno del pacchetto
im.list()

#importiamo i dati di noto interesse: matogrosso
#oggetto assegnazione funzione argomento
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
