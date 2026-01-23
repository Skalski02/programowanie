library(tidyverse)

library(readxl) #excel
library(readr) #csv

pingwiny <- penguins
# species, bill_dep, sex
#bill_dep zachowaj wszystkie wyższe od 20
#zachowaj męskie
#policz średnią z tego co zostało

pingwiny <- dplyr::select(pingwiny, species, bill_dep, sex)
pingwiny <- dplyr::filter(pingwiny, bill_dep > 20)
pingwiny <- dplyr::filter(pingwiny, sex == 'male')
pingwiny <- mean(pingwiny$bill_dep)

#_______________________________

pingwiny2 <- penguins |>
  dplyr::select(species, bill_dep, sex) |>
  dplyr::filter(bill_dep > 20) |>
  dplyr::filter(sex == 'male')

#________________________________

pingwiny3 <- penguins |>
  dplyr::select(species, bill_dep, sex) |>
  dplyr::filter(bill_dep > 20) |>
  dplyr::filter(sex == 'male') |>
  (\(x) mean(x$bill_dep))()

pingwiny4 <- penguins |>
  dplyr::select(species, bill_dep, sex, .data = _) |>
  dplyr::filter(bill_dep > 20) |>
  dplyr::filter(sex == 'male') |>
  (\(x) mean(x$bill_dep))()

#iris, wyrzucić wszystkie NA, funkcja z tidyr drop_na
#zostawic wszystko z gatunku setosa
#nowa kolumna nazwa, w tej kolumnie pomnożyć cokolwiek
#zachować tylko nową kolumnę
kwiaty <- iris |>
  tidyr::drop_na() |>
  dplyr::filter(Species == 'setosa') |>
  dplyr::mutate(nowakolumna = Petal.Length / Petal.Width) |>
  dplyr::select(nowakolumna)


#_____________________________________________
#Tidyr

#format ramek szeroki i długi

kwiaty <- iris |>
  tibble::rowid_to_column(var = "ID") |>
  tidyr::pivot_longer(
    cols = -c(ID, Species),
    names_to = "nazwa",
    values_to = "wartosc"
  )

ggplot2::ggplot(kwiaty, aes(ID, wartosc, color = nazwa, size = Species)) +
  geom_point()

ggplot2::ggplot(kwiaty, aes(ID, wartosc, color = nazwa)) +
  geom_point() +
  facet_wrap(vars(Species), scales = "free_x")
