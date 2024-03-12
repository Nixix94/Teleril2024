# Installazione nuovi pacchetti in R

install.packages("terra")
# importante usare "", solitamente impostata di default il sito del CRAN
library(terra)
# dopo averlo installato il pacchetto deve esser richiamato attraverso la funzione library

# pacchetto imageRy pacchetto creato su misura per agevolare la didattica, presente all'interno di Github
# funzione "devtools" mi permette di usare la funzione per scaricare i pacchetti da Github
# install_github
# imageRy

# per indicare da dove arriva una funzione metto pacchetto di provenienza :: funzione
install.packages("devtools")
devtools::install_github("ducciorocchini/imageRy")
library(imageRy)
# i pachetti che si usano all'interno del codice vanno messi tutti in alto!!!
