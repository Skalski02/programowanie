install.packages(c("tidyverse", "writexl"))
library(tidyverse)

kiwi <- readr::read_csv("https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2024-financial-year-provisional/Download-data/annual-enterprise-survey-2024-financial-year-provisional.csv")

str(kiwi)

#scieżka względna
kakapo <- readr::read_csv("dane/annual-enterprise-survey-2024-financial-year-provisional.csv")

#indeksowanie
kakapo[1]
#ten podobno lepszy
kakapo[, 1]

kakapo["Year"]
#wczytuje wszystko
kakapo[,]

#wybór pierwszej i 3 kolumny

kakapo[, c(1, 3)]

kakapo[3:40,]
#wybór jednej kolumny skutkuje wektorem
kakapo$Year

#wybór jednej kolumny i wartości numer 678

kakapo$Value[678]
kakapo[678, 9]

# zamiana kolumny value na wartości numeryczne

as.numeric(kakapo$Value)
# to nie działa as.numeric(kakapo[, "Value"])

as.numeric(kakapo$Value[748])
kakapo[748, 9]
#sprawdzanie prawda/fałsz
is.na(as.numeric(kakapo$Value))


pingwin <- kakapo

pingwin$Value <- as.numeric(pingwin$Value)

pingwin$Value

kakapo$Value
#nowa kolumna

pingwin$suma <- pingwin$Year + pingwin$Value
pingwin$suma

#nowa kolumna pingwin log z roku

pingwin$log <- log(pingwin$Year)
pingwin$log

#ramka 

czwarta_ramka <- pingwin[,1:10]
czwarta_ramka

