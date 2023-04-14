## code to prepare `dtb` dataset goes here

library(readODS)
library(dplyr)

# DTB 2022 ----------------------------------------------------------------

mun_2022 <- read_ods(
  path = "data-raw/dtb_2022/dtb_2022.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2022 <- mun_2022 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

rgi1_2022 <- mun_2022 %>%
  select(code_uf, code_rgi1, name_rgi1) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

rgi2_2022 <- mun_2022 %>%
  select(code_rgi1, code_rgi2, name_rgi2) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

meso_2022 <- mun_2022 %>%
  select(code_rgi2, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

micro_2022 <- mun_2022 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

muni_2022 <- mun_2022 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2022) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2022 <- read_ods(
  path = "data-raw/dtb_2022/dtb_2022.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

subdistr_2022 <- read_ods(
  path = "data-raw/dtb_2022/dtb_2022.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

dtb_2022 <- left_join(uf_2022, rgi1_2022) %>%
  left_join(rgi2_2022) %>%
  left_join(meso_2022) %>%
  left_join(micro_2022, relationship = "many-to-many") %>%
  left_join(muni_2022, relationship = "many-to-many") %>%
  left_join(distr_2022, relationship = "many-to-many") %>%
  left_join(subdistr_2022, relationship = "many-to-many")


# DTB 2021 ----------------------------------------------------------------

mun_2021 <- read_ods(
  path = "data-raw/dtb_2021/dtb_2021.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2021 <- mun_2021 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

rgi1_2021 <- mun_2021 %>%
  select(code_uf, code_rgi1, name_rgi1) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

rgi2_2021 <- mun_2021 %>%
  select(code_rgi1, code_rgi2, name_rgi2) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

meso_2021 <- mun_2021 %>%
  select(code_rgi2, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

micro_2021 <- mun_2021 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

muni_2021 <- mun_2021 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2021) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2021 <- read_ods(
  path = "data-raw/dtb_2021/dtb_2021.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

subdistr_2021 <- read_ods(
  path = "data-raw/dtb_2021/dtb_2021.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2022) %>%
  relocate(dtb)

dtb_2021 <- left_join(uf_2021, rgi1_2021) %>%
  left_join(rgi2_2021) %>%
  left_join(meso_2021) %>%
  left_join(micro_2021, relationship = "many-to-many") %>%
  left_join(muni_2021, relationship = "many-to-many") %>%
  left_join(distr_2021, relationship = "many-to-many") %>%
  left_join(subdistr_2021, relationship = "many-to-many")


# Bind and export ---------------------------------------------------------

dtb <- bind_rows(dtb_2022, dtb_2021)

usethis::use_data(dtb, overwrite = TRUE, compress = "xz")
