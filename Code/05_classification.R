# quantificare perdita: attraverso classificazione, machine learning riconosce 2 classi e fa confronto
# creare training site <- siti di prova per insegnare all'algoritmo come riconoscele le classi
# individuare cluster (insieme di oggetti, classi) di pixel presi in modo casuale
# nel caso di un pixel non sia presente nei cluster, l'algoritmo andrà a calcolare la media dei punti nel cluster e poi la distanza a questo punto
# k-means
# immagine originale - cluster - immagine classificata
# posso calcolare pixel classe 1 e 2

# quantifying land cover change

# intsall.packages("ggplot2")
# intsall.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

im.list()
# libro suggerito: nella quarta dimensione
# https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
# additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1

# importing images
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
# funzione im.classify() <- classificazione non supervisionata dove tra gli argomenti ci serve il nome dell'immagine e il numero di cluster che vogliamo
sunC <- im.classify(sun, num_clusters=3)
# a seconda di dove l'algoritmo inizia a prendere i pixel si possono ottenere risultati leggermente diversi se si lancia la funzione più volte

# Matogrosso imagine
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
# mato classification
m1992c <- im.classify(m1992, num.clusters=2)
# cluster1=human
# cluster2=forest
m2006c <- im.classify(m2006, num.clusters=2)
# cluster1=forest
# cluster2=human

# vogliamo calcolare il numero di pixel (frequenza) delle due classi per poi calcolare le percentuali delle varie classi
# Calcolare la frequenza 1992
f1992 <- freq(m1992c)
# proporzione sarà la frequenza in rapporto al totale
# ncell calcola il totale dei pixel dell'immagine
# totale pixel immagine
tot1992 <- ncell(m1992c)
# Proporzione clusters
prop1992 = f1992 / tot1992
# Percentuale clusters
perc1992 = prop1992*100
perc1992
# Repeat for 2006
f2006 <- freq(m2006c)
tot2006 <- ncell(m2006c)
prop2006 = f2006 / tot2006
perc2006 = prop2006*100
perc2006

# Costruire dataset e creazione grafici
# funzione "data.frame" crea un dataframe 
class <- c("human, forest")
y1992 <- c(87,17)
y2006 <- c(55,45)

tabout <- data.frame(class, y1992, y2006)
tabout

# plotting the output with ggplot2
ggplot(tabout, aes(x=class, y=p1992, color=class)) + geom_bar(stat="identity", fill="white")
ggplot(tabout, aes(x=class, y=p2006, color=class)) + geom_bar(stat="identity", fill="white")
# geom_bar possiamo estrarre valori statistici, in questo caso usiamo identity perchè il valore ce lo abbiamo già, mentre fill per decidere il colore

# patchwork
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")
p1 + p2
# assegnare ai grafici un oggetto e poi li somma
# Attenzione alla scala delle coordinate dei due grafici per una corretta comunicazione dei risultati

# varying axis and using lines - for correcting scale
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p1 + p2

# ylim è una funzione vera e propria, per assegrare scale scelte sulla coordinata y
# importante abbiano lo stasso range di scala
