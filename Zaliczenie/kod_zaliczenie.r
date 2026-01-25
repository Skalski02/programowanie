library(tidyverse)

#Wczytałem bibliotekę tidyverse w celu użycia funkcji z pakietu dplyr

temperatura <- readxl::read_xlsx("dane/DaneTemp.xlsx", sheet = 1)
opad <- readxl::read_xlsx("dane/DaneTemp.xlsx", sheet = 2)

# Analizowane dane pobrałem ze strony Gus, przedstawiają one
# średnią temperaturę miesięczną i miesięczną sumę opadu dla wielolecia 2010-2022
# Planuje obliczyć sumę opadu sniegu dla poszczególnych miast. Założyłem, że średnia
# temperatura utrzymywała się przez cały miesiąc, a 1mm opadu odpowiada około 7mm śniegu.
# Efekt końcowy powinien zawierać tabelę z sumą opadu śniegu dla danego wielolecia w cm.

daneklim <- left_join(opad, temperatura, by = "Okres") |>
  rename(miesiac = Okres)

sniegkielce <- dplyr::select(daneklim, miesiac, OpadKiel, TempKiel) |>
  dplyr::filter(OpadKiel > 0 & TempKiel <= 0) |>
  dplyr::mutate(sniegcmK = OpadKiel * 0.7)

sniegrzeszow <- dplyr::select(daneklim, miesiac, OpadRzes, TempRzes) |>
  dplyr::filter(OpadRzes > 0 & TempRzes <= 0) |>
  dplyr::mutate(sniegcmR = OpadRzes * 0.7)

sniegszczecin <- dplyr::select(daneklim, miesiac, OpadSzcz, TempSzcz) |>
  dplyr::filter(OpadSzcz > 0 & TempSzcz <= 0) |>
  dplyr::mutate(sniegcmS = OpadSzcz * 0.7)


Snieg <- dplyr::full_join(sniegkielce, sniegszczecin, by = NULL) |>
  dplyr::full_join(sniegrzeszow, by = NULL)

Snieg2 <- Snieg |>
  tidyr::pivot_longer(
    cols = c(sniegcmK, sniegcmR, sniegcmS),
    names_to = "nazwa",
    values_to = "wartosc_cm"
  )

ggplot2::ggplot(Snieg2, aes(miesiac, wartosc_cm, color = nazwa, )) +
  geom_point()

Snieg <- dplyr::summarise(
  Snieg,
  dplyr::across(starts_with("snieg"), list(suma = \(x) sum(x, na.rm = TRUE)))
) |>
  dplyr::rename(
    Kielce_suma_opadu_cm = sniegcmK_suma,
    Szczecin_suma_opadu_cm = sniegcmS_suma,
    Rzeszow_suma_opadu_cm = sniegcmR_suma
  )
