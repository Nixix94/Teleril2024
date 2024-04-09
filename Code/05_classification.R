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























