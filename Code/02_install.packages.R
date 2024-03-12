# Installazione nuovi pacchetti in R

install.packages("terra")
# importante usare "", solitamente impostata di default il sito del CRAN

# dopo averlo installato il pacchetto deve esser richiamato attraverso la funzione library

# pacchetto imageRy pacchetto creato su misura per agevolare la didattica, presente all'interno di Github
# funzione "devtools" mi permette di usare la funzione per scaricare i pacchetti da Github
# install.github
# imageRy

# per indicare da dove arriva una funzione metto pacchetto di provenienza :: funzione
devtools::install.packages("devtools")
install.github("imageRy")
