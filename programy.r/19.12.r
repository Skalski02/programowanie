library(tidyverse)

library(readxl) #excel
library(readr) #csv

#wczytywanie csv operowanie tab

dane <- readr::read_csv("dane/annual-enterprise-survey-2024-financial-year-provisional.csv")
daneexcel <- readxl::read_excel("dane/data_msu.xlsx",sheet = "elemental")

#sprawczenie nazw arkuszy
readxl::excel_sheets("dane/data_msu.xlsx")

#wczytaj wszystkie 3 arkusze, + ulatwienie zapisu
sciezka <- "dane/data_msu.xlsx"

dane1 <- readxl::read_excel(sciezka, sheet = 1)
dane2 <- readxl::read_excel(sciezka, sheet = 2)
dane3 <- readxl::read_excel(sciezka, sheet = 3)

#łączenie tabel

dane12 <- dplyr::left_join(dane1,dane2 , by = "sample_id")

dplyr::left_join(dane1,dane3, by = "sample_id")
#zmiana nazwy kolumn
dane5 <- dane1
dane5 <- dplyr::rename(dane5, wwww = sample_id)
# łączenie danych z innymi nazwami kolumn
dplyr::left_join(dane1,dane5)

dplyr::left_join(dane1,dane5, dplyr::join_by(sample_id == wwww))

dplyr::left_join(dane1,dane5, dplyr::join_by(sample_id == wwww), suffix = c("a", "malysz"))

#inne sposoby łączenia

dplyr::right_join(dane1,dane2, by = "sample_id")

dplyr::full_join(dane1,dane2, by = "sample_id")

dplyr::inner_join(dane1, dane2)

# rbind (połączy wszystko jedno pod drugim) colbind (musi być taka sama ilość wierszy)

dplyr::bind_rows(dane1, dane2, dane3)

dplyr::bind_cols(dane1,dane12)

#Tidyr usuwanie NA

tidyr::drop_na(dane)

tidyr::drop_na(dane3, sample_id)

