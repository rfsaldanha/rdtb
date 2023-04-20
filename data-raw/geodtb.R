## code to prepare `geodtb` dataset goes here

# Load DTB
load(file = "data/dtb.rda")

library(geobr)

# Municipality 2000
geo_mun2000 <- read_municipality(year = 2000) %>%
  distinct(code_muni, .keep_all = TRUE) %>%
  mutate(source = "geo")

dtb_mun2000 <- dtb %>%
  filter(dtb == 2000) %>%
  select(code_muni, name_muni) %>%
  distinct() %>%
  mutate(source = "dtb")

res <- left_join(geo_mun2000, dtb_mun2000, by = "code_muni") %>%
  filter(is.na(source.y))

# Municipality 2001
geo_mun2001 <- read_municipality(year = 2001) %>%
  distinct(code_muni, .keep_all = TRUE) %>%
  mutate(source = "geo")























usethis::use_data(geodtb, overwrite = TRUE)
