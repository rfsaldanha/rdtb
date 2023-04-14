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
  mutate(dtb = 2021) %>%
  relocate(dtb)

subdistr_2021 <- read_ods(
  path = "data-raw/dtb_2021/dtb_2021.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2021) %>%
  relocate(dtb)

dtb_2021 <- left_join(uf_2021, rgi1_2021) %>%
  left_join(rgi2_2021) %>%
  left_join(meso_2021) %>%
  left_join(micro_2021, relationship = "many-to-many") %>%
  left_join(muni_2021, relationship = "many-to-many") %>%
  left_join(distr_2021, relationship = "many-to-many") %>%
  left_join(subdistr_2021, relationship = "many-to-many")


# DTB 2020 ----------------------------------------------------------------

mun_2020 <- read_ods(
  path = "data-raw/dtb_2020/dtb_2020.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2020 <- mun_2020 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

rgi1_2020 <- mun_2020 %>%
  select(code_uf, code_rgi1, name_rgi1) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

rgi2_2020 <- mun_2020 %>%
  select(code_rgi1, code_rgi2, name_rgi2) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

meso_2020 <- mun_2020 %>%
  select(code_rgi2, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

micro_2020 <- mun_2020 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

muni_2020 <- mun_2020 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2020) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2020 <- read_ods(
  path = "data-raw/dtb_2020/dtb_2020.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

subdistr_2020 <- read_ods(
  path = "data-raw/dtb_2020/dtb_2020.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2020) %>%
  relocate(dtb)

dtb_2020 <- left_join(uf_2020, rgi1_2020) %>%
  left_join(rgi2_2020) %>%
  left_join(meso_2020) %>%
  left_join(micro_2020, relationship = "many-to-many") %>%
  left_join(muni_2020, relationship = "many-to-many") %>%
  left_join(distr_2020, relationship = "many-to-many") %>%
  left_join(subdistr_2020, relationship = "many-to-many")


# DTB 2019 ----------------------------------------------------------------

mun_2019 <- read_ods(
  path = "data-raw/dtb_2019/dtb_2019.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2019 <- mun_2019 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

rgi1_2019 <- mun_2019 %>%
  select(code_uf, code_rgi1, name_rgi1) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

rgi2_2019 <- mun_2019 %>%
  select(code_rgi1, code_rgi2, name_rgi2) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

meso_2019 <- mun_2019 %>%
  select(code_rgi2, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

micro_2019 <- mun_2019 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

muni_2019 <- mun_2019 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2019) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2019 <- read_ods(
  path = "data-raw/dtb_2019/dtb_2019.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

subdistr_2019 <- read_ods(
  path = "data-raw/dtb_2019/dtb_2019.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2019) %>%
  relocate(dtb)

dtb_2019 <- left_join(uf_2019, rgi1_2019) %>%
  left_join(rgi2_2019) %>%
  left_join(meso_2019) %>%
  left_join(micro_2019, relationship = "many-to-many") %>%
  left_join(muni_2019, relationship = "many-to-many") %>%
  left_join(distr_2019, relationship = "many-to-many") %>%
  left_join(subdistr_2019, relationship = "many-to-many")



# DTB 2018 ----------------------------------------------------------------

mun_2018 <- read_ods(
  path = "data-raw/dtb_2018/dtb_2018.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2018 <- mun_2018 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2018) %>%
  relocate(dtb)

meso_2018 <- mun_2018 %>%
  select(code_uf, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2018) %>%
  relocate(dtb)

micro_2018 <- mun_2018 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2018) %>%
  relocate(dtb)

muni_2018 <- mun_2018 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2018) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2018 <- read_ods(
  path = "data-raw/dtb_2018/dtb_2018.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2018) %>%
  relocate(dtb)

subdistr_2018 <- read_ods(
  path = "data-raw/dtb_2018/dtb_2018.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2018) %>%
  relocate(dtb)

dtb_2018 <- left_join(uf_2018, meso_2018) %>%
  left_join(micro_2018, relationship = "many-to-many") %>%
  left_join(muni_2018, relationship = "many-to-many") %>%
  left_join(distr_2018, relationship = "many-to-many") %>%
  left_join(subdistr_2018, relationship = "many-to-many")


# DTB 2017 ----------------------------------------------------------------

mun_2017 <- read_ods(
  path = "data-raw/dtb_2017/dtb_2017.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2017 <- mun_2017 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2017) %>%
  relocate(dtb)

meso_2017 <- mun_2017 %>%
  select(code_uf, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2017) %>%
  relocate(dtb)

micro_2017 <- mun_2017 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2017) %>%
  relocate(dtb)

muni_2017 <- mun_2017 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2017) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2017 <- read_ods(
  path = "data-raw/dtb_2017/dtb_2017.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2017) %>%
  relocate(dtb)

subdistr_2017 <- read_ods(
  path = "data-raw/dtb_2017/dtb_2017.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2017) %>%
  relocate(dtb)

dtb_2017 <- left_join(uf_2017, meso_2017) %>%
  left_join(micro_2017, relationship = "many-to-many") %>%
  left_join(muni_2017, relationship = "many-to-many") %>%
  left_join(distr_2017, relationship = "many-to-many") %>%
  left_join(subdistr_2017, relationship = "many-to-many")


# Bind and export ---------------------------------------------------------

dtb <- bind_rows(dtb_2022, dtb_2021, dtb_2020, dtb_2019, dtb_2018,
                 dtb_2017)

usethis::use_data(dtb, overwrite = TRUE, compress = "xz")
