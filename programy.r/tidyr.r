library(tidyverse)
library(readxl) 

dane <- readxl::read_excel("dane/data_msu.xlsx", sheet = 2)
#usuwanie NA 

tidyr::drop