library("tidyverse")

# dane iris

iris <- iris

# średnia z szerokości płatka

srednia <- mean(iris$Petal.Width)
mediana <- median(iris[,4])
mediana

odchylenie <- sd(iris[ ,"Petal.Width"])
odchylenie

#srednia z dlugości kielicha dla gatunku setosa

sredniaseposa <- mean(iris[1:50, "Sepal.Length"])

srednias <- mean(iris[c(1, 50, 68, 102, 19), 1])

sredniav <- mean(iris[iris$Species == "setosa", 1])


gozdzik <- iris

gozdzik$cy <- gozdzik$Petal.Width+gozdzik$Sepal.Width

#manipulacja ramkami danych paczka dplyr
# select tylko do wyboru kolumn
#filter do filtrowania wierszy
#mutate do zmieniania dziwnych rzeczy

#wybór kolumny species

dplyr::select(iris, Species)

#wybór 3 kolumn

dplyr::select(iris, 3:5)
dplyr::select(iris, Species, Petal.Length, Petal.Width)
#wybór negatywny
dplyr::select(iris, -Species)

#wybór automat

dplyr::select(iris, dplyr::contains("Petal"))

#wybór na podstawie dopasowania dowolny i negatywny

dplyr::select(iris, -dplyr::contains("Petal"))

# ends with atarts_with
dplyr::select(iris, dplyr::ends_with("Width"))

dplyr::select(iris, -dplyr::ends_with("th"))

#połączenie warunków

dplyr::select(iris, dplyr::ends_with("dth") & dplyr::starts_with("S"))
