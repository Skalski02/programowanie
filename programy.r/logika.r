
library(tidyverse)

iris <- iris

dplyr::select(iris, dplyr::starts_with("Petal") | dplyr::contains("dth"))

#Gwiezdne wojny

swars <- dplyr::starwars

#wybór kolumn numerycznych za pomocą (anonimowej) funkcji

dplyr::select(swars, dplyr::where(\(kolumna) is.numeric(kolumna)))

#wybór kolumn tekstowych z r w nazwie

dplyr::select(swars, dplyr::where(\(kolumna) is.character(kolumna)) & dplyr::contains("r"))

#wybór kolumn numerycznych których średnia jest niższa niż 100

dplyr::select(swars, dplyr::where(\(x) is.numeric(x) & mean(x, na.rm=TRUE) < 100))

#wybór kolumn tekstowych zaczynających się od b 

dplyr::select(swars, dplyr::where(\(x) is.numeric(x) | is.character(x)) & dplyr::starts_with("h"))

# wybór kolumn, w których średnia jest wyższa niż 70 i niższa niż 90

skrra <- dplyr::select(swars, dplyr::where(\(x) is.numeric(x) & mean(x, na.rm=TRUE) >70 & mean(x, na.rm=TRUE) <90))

# filtrowanie wierszy
#dplyr::filter()

#jeden prosty warunek - wzrost = 182

dplyr::filter(swars, height == 182)

#wybór według jednego warunku knypki poniżej 70 cm

dplyr::filter(swars, height <= 70)

#wzrost poniżej 70 lub powyżej 220

dplyr::filter(swars, height < 70 | height > 220)

#wybór wzrost powyżej 200 i masa poniżej 100

dplyr::filter(swars, height >200 & mass < 100)
