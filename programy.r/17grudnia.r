library(tidyverse)

#Dane
ptaki <- penguins

#podsumowanie
#dplyr::summarise

median(ptaki$species)

dplyr::filter(ptaki, species == "Chinstrap")

mean(ptaki[ptaki$species == "Chinstrap", "bill_len" ], na.rm = TRUE )



mean(ptaki[ptaki$island == "Torgersen" & ptaki$sex == "female", "body_mass" ], na.rm = TRUE )

#z sumarrise

dplyr::summarise(ptaki, bill_len_mean = mean(bill_len, na.rm = TRUE), .by = species)


#średnia długośc dzioba w podziale na gatunki i wyspy (ogarnij co robi to c)

dplyr::summarise(ptaki, bill_len_mean = mean(bill_len, na.rm = TRUE), .by = c(species, island))

# Bez grupowania średnia dla wszystkich
dplyr::summarise(ptaki, bill_len_mean = mean(bill_len, na.rm = TRUE))

# count
dplyr::summarise(ptaki, liczba = dplyr::n(), unikalne_wyspy = dplyr::n_distinct(island), .by = species)

#policz średnią długość płetwy (flipper_len), medianę i kwantyl 0,5 dla 


dplyr::summarise(ptaki, flipper_len_mean = mean(flipper_len, na.rm = TRUE),
flipper_len_median = median(flipper_len, na.rm = TRUE),
flipper_len_quan = quantile(flipper_len, 0.5, na.rm=TRUE), .by = sex)


#policz srednia bill_len, bill_dep, flipper lean, w podziale na rok

dplyr::mutate(nieloty, dplyr::across(c(bill_len:bill_dep, body_mass), \(x) log(x)))
#stara składnia
dplyr::summarise(ptaki, dplyr::across(c(bill_len:flipper_len), mean, na.rm = TRUE), .by = year)
#nowa składnia
dplyr::summarise(ptaki, dplyr::across(c(bill_len:flipper_len), \(x) mean(x, na.rm = TRUE)), .by = year)

#policz średnią i medianę dla kilku kolumn

dplyr::summarise(ptaki,
dplyr::across(starts_with("bill"), list(
  srednia = \(x) mean(x, na.rm = TRUE),
mediana = \(x) median(x, na.rm = TRUE))))
