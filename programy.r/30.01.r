library(tidyverse)

pingwiny <- penguins |>
  tibble::rowid_to_column(var = "ID") |>
  tidyr::pivot_longer(
    cols = -c(ID, sex, species, island),
    names_to = "nazwa",
    values_to = "wartosc"
  )

pingwiny2 <- pingwiny |>
  tidyr::pivot_wider(
    id_cols = ID:sex,
    names_from = nazwa,
    values_from = wartosc
  )

pingwiny3 <- penguins

#pivot longer kolumn bill_ i zmiana typu z dbl na int

pingwiny4 <- pingwiny3 |>
  tibble::rowid_to_column(var = "ID") |>
  tidyr::pivot_longer(
    cols = c(bill_dep, bill_len),
    names_to = "nazwa",
    values_to = "wartosc",
    values_transform = as.integer
  )

#pivot tych 3 kolumn usunąć prefix, nazwy zmienić na liczby
pingwiny5 <- penguins |>
  dplyr::rename(col_1 = bill_len, col_2 = bill_dep, col_3 = flipper_len) |>
  tidyr::pivot_longer(
    cols = c(col_1, col_2, col_3),
    names_to = "nazwa",
    values_to = "wartosc",
    names_prefix = "col_",
    names_transform = as.integer
  )

pingwiny6 <- penguins |> 
  tidyr::fill(bill_len:body_mass, .direction = "up")

# uzupełnienie pustych wartości przy użyciu replace_na
pingwiny7 <- penguins |> 
  dplyr::mutate(sex = as.character(sex)) |> 
  tidyr::replace_na(replace = list(sex = as.factor("pingwin102m"), bill_dep = 992))

install.packages("zoo")

library(zoo)
#prosta interpolacja liniowa
na.approx(pingwiny7$bill_len, rule = 2)

pingwiny8 <- penguins |> 
  dplyr::mutate(bill_dep = na.approx(bill_dep))
