library(tidyverse)

#Operacje na kolumnach
#dplyr::mutate()

nieloty <- penguins

#podziel kolumne przez kolumne
#podejscie klasyczne
#bill_len podzielić przez bill_dep

penguins$bill_len/penguins$bill_dep

nieloty[ , 3]/nieloty[ , 4]

nieloty$dzielenie <- penguins$bill_len/penguins$bill_dep

#to samo tylko z dplyr::mutate()

nieloty <- dplyr::mutate(nieloty, dzielenie2 = bill_len / bill_dep)

#mutowanie ze wskazaniem pozycji
#nowa kolumna "dodawanie" dodaj flipper_len do body massoraz nowa kolumna logarytm "logarytm" - zlogarytmuj bill_dep

nieloty <- dplyr::mutate(nieloty, dodawanie = flipper_len + body_mass, logarytm = log(bill_dep))

#podejrzeć ramke
head(nieloty)

#dodaj kolumnę pierwiastek z kolumny body_mass po kolumnie species

nieloty <- dplyr::mutate(nieloty, pierwiastek1 = sqrt(body_mass), .after = species)

#mutowanie ramki poprzez wybór kolumn
#dplyr::across()

#mutowanie na podstaswie nazw
#zlogarytmuj wszystko pomiędzy bill_len i bill_dep i body mass

dplyr::mutate(nieloty, dplyr::across(c(bill_len:bill_dep, body_mass), \(x) log(x)))

#na podstawie cechy kolumny

dplyr::mutate(nieloty, dplyr::across(dplyr::where(\(x) is.numeric(x)), \(x) sqrt(x)))

#mutowanie z porzuceniem
#kolumna 'logarytm' napodstawie logarytmu z bill dep użyj argumentu .keep = "none"

dplyr::mutate(nieloty, logarytm = log(bill_dep), .keep = "none")

#zrób dokładnie to samo tylko 