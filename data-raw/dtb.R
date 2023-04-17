## code to prepare `dtb` dataset goes here

library(tidyverse)
library(readODS)


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


# DTB 2016 ----------------------------------------------------------------

mun_2016 <- read_ods(
  path = "data-raw/dtb_2016/dtb_2016.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2016 <- mun_2016 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2016) %>%
  relocate(dtb)

meso_2016 <- mun_2016 %>%
  select(code_uf, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2016) %>%
  relocate(dtb)

micro_2016 <- mun_2016 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2016) %>%
  relocate(dtb)

muni_2016 <- mun_2016 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2016) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2016 <- read_ods(
  path = "data-raw/dtb_2016/dtb_2016.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2016) %>%
  relocate(dtb)

subdistr_2016 <- read_ods(
  path = "data-raw/dtb_2016/dtb_2016.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2016) %>%
  relocate(dtb)

dtb_2016 <- left_join(uf_2016, meso_2016) %>%
  left_join(micro_2016, relationship = "many-to-many") %>%
  left_join(muni_2016, relationship = "many-to-many") %>%
  left_join(distr_2016, relationship = "many-to-many") %>%
  left_join(subdistr_2016, relationship = "many-to-many")



# DTB 2015 ----------------------------------------------------------------

mun_2015 <- read_ods(
  path = "data-raw/dtb_2015/dtb_2015.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2015 <- mun_2015 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2015) %>%
  relocate(dtb)

meso_2015 <- mun_2015 %>%
  select(code_uf, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2015) %>%
  relocate(dtb)

micro_2015 <- mun_2015 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2015) %>%
  relocate(dtb)

muni_2015 <- mun_2015 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2015) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2015 <- read_ods(
  path = "data-raw/dtb_2015/dtb_2015.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2015) %>%
  relocate(dtb)

subdistr_2015 <- read_ods(
  path = "data-raw/dtb_2015/dtb_2015.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2015) %>%
  relocate(dtb)

dtb_2015 <- left_join(uf_2015, meso_2015) %>%
  left_join(micro_2015, relationship = "many-to-many") %>%
  left_join(muni_2015, relationship = "many-to-many") %>%
  left_join(distr_2015, relationship = "many-to-many") %>%
  left_join(subdistr_2015, relationship = "many-to-many")


# DTB 2014 ----------------------------------------------------------------

mun_2014 <- read_ods(
  path = "data-raw/dtb_2014/dtb_2014.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )

uf_2014 <- mun_2014 %>%
  select(code_uf, name_uf) %>%
  distinct() %>%
  mutate(dtb = 2014) %>%
  relocate(dtb)

meso_2014 <- mun_2014 %>%
  select(code_uf, code_meso, name_meso) %>%
  distinct() %>%
  mutate(dtb = 2014) %>%
  relocate(dtb)

micro_2014 <- mun_2014 %>%
  select(code_meso, code_micro, name_micro) %>%
  distinct() %>%
  mutate(dtb = 2014) %>%
  relocate(dtb)

muni_2014 <- mun_2014 %>%
  select(code_micro, code_full_muni, name_muni) %>%
  distinct() %>%
  mutate(dtb = 2014) %>%
  relocate(dtb) %>%
  rename(code_muni = code_full_muni)

distr_2014 <- read_ods(
  path = "data-raw/dtb_2014/dtb_2014.ods",
  sheet = "district"
) %>%
  mutate(dtb = 2014) %>%
  relocate(dtb)

subdistr_2014 <- read_ods(
  path = "data-raw/dtb_2014/dtb_2014.ods",
  sheet = "subdistrict"
) %>%
  mutate(dtb = 2014) %>%
  relocate(dtb)

dtb_2014 <- left_join(uf_2014, meso_2014) %>%
  left_join(micro_2014, relationship = "many-to-many") %>%
  left_join(muni_2014, relationship = "many-to-many") %>%
  left_join(distr_2014, relationship = "many-to-many") %>%
  left_join(subdistr_2014, relationship = "many-to-many")


# DTB 2013 ----------------------------------------------------------------

dtb_2013 <- read_ods(
  path = "data-raw/dtb_2013/dtb_2013.ods",
  sheet = "all"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni)),
    code_distr = as.numeric(paste0(code_muni, code_distr)),
    code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
  )


# DTB 2012 ----------------------------------------------------------------

dtb_2012 <- read_ods(
  path = "data-raw/dtb_2012/dtb_2012.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni))
  )


# DTB 2011 ----------------------------------------------------------------

dtb_2011 <- read_ods(
  path = "data-raw/dtb_2011/dtb_2011.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni))
  )


# DTB 2010 ----------------------------------------------------------------

dtb_2010 <- read_ods(
  path = "data-raw/dtb_2010/dtb_2010.ods",
  sheet = "municipality"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro))
  )


# DTB 2009 ----------------------------------------------------------------

dtb_2009 <- read_ods(
  path = "data-raw/dtb_2009/dtb_2009.ods",
  sheet = "all"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_distr = as.numeric(paste0(code_muni, code_distr)),
    code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
  )



# DTB 2008 ----------------------------------------------------------------

dtb_2008 <- read_ods(
  path = "data-raw/dtb_2008/dtb_2008.ods",
  sheet = "all"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni)),
    code_distr = as.numeric(paste0(code_muni, code_distr)),
    code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
  )


# DTB 2007 ----------------------------------------------------------------

dtb_2007 <- read_ods(
  path = "data-raw/dtb_2007/dtb_2007.ods",
  sheet = "all"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni)),
    code_distr = as.numeric(paste0(code_muni, code_distr)),
    code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
  )


# DTB 2006 ----------------------------------------------------------------

dtb_2006 <- read_ods(
  path = "data-raw/dtb_2006/dtb_2006.ods",
  sheet = "all"
)

# DTB 2005 ----------------------------------------------------------------

dtb_2005 <- read_ods(
  path = "data-raw/dtb_2005/dtb_2005.ods",
  sheet = "all"
) %>%
  mutate(
    code_meso = as.numeric(paste0(code_uf, code_meso)),
    code_micro = as.numeric(paste0(code_uf, code_micro)),
    code_muni = as.numeric(paste0(code_uf, code_muni)),
    code_distr = as.numeric(paste0(code_muni, code_distr)),
    code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
  )


# DTB 2004 ----------------------------------------------------------------

mun_2004 <- read_ods(
  path = "data-raw/dtb_2004/dtb_2004.ods",
  sheet = "all"
)

dtb_2004 <- mun_2004 %>%
  mutate(code = case_when(
    level == "0002" ~ code_uf,
    level == "0008" ~ as.numeric(paste0(code_uf, substr(code_muni, 0, 2))),
    level == "0009" ~ as.numeric(paste0(code_uf, substr(code_muni, 0, 3))),
    level == "0005" ~ as.numeric(paste0(code_uf, code_muni)),
    level == "0006" ~ as.numeric(paste0(code_uf, code_muni, code_distr)),
    level == "0007" ~ as.numeric(paste0(code_uf, code_muni, code_distr, code_subdistr))
  ))

for(rw in 1:nrow(dtb_2004)){
  if(dtb_2004[rw, "level"] == "0002"){
    name_uf <- dtb_2004[rw, "name"]
  }

  if(dtb_2004[rw, "level"] == "0008"){
    code_meso <- as.numeric(paste0(dtb_2004[rw, "code_uf"], substr(dtb_2004[rw, "code_muni"], 0, 2)))
    name_meso <- dtb_2004[rw, "name"]
  }

  if(dtb_2004[rw, "level"] == "0009"){
    code_micro <- as.numeric(paste0(dtb_2004[rw, "code_uf"], substr(dtb_2004[rw, "code_muni"], 0, 3)))
    name_micro <- dtb_2004[rw, "name"]
  }

  if(dtb_2004[rw, "level"] %in% c("0005", "0006", "0007")){
    dtb_2004[rw, "name_uf"] <- name_uf
    dtb_2004[rw, "code_meso"] <- code_meso
    dtb_2004[rw, "name_meso"] <- name_meso
    dtb_2004[rw, "code_micro"] <- code_micro
    dtb_2004[rw, "name_micro"] <- name_micro
  }

}

dtb_2004 <- dtb_2004 %>%
  filter(!(level %in% c("0002", "0008", "0009"))) %>%
  select(level, code_uf, name_uf, code_meso, name_meso, code_micro, name_micro, code, name)

muni_2004 <- dtb_2004 %>%
  filter(level == "0005") %>%
  rename(code_muni = code, name_muni = name) %>%
  select(-level)

distr_2004 <- dtb_2004 %>%
  filter(level == "0006") %>%
  select(code_distr = code, name_distr = name) %>%
  mutate(code_muni = as.numeric(substr(code_distr, 0, 7)))

subdistr_2004 <- dtb_2004 %>%
  filter(level == "0007") %>%
  select(code_subdistr = code, name_subdistr = name) %>%
  mutate(code_distr = as.numeric(substr(code_subdistr, 0, 9)))

dtb_2004 <- left_join(muni_2004, distr_2004) %>%
  left_join(subdistr_2004) %>%
  mutate(dtb = 2004)







# Bind and export ---------------------------------------------------------

dtb <- bind_rows(dtb_2022, dtb_2021, dtb_2020, dtb_2019, dtb_2018,
                 dtb_2017, dtb_2016, dtb_2015, dtb_2014, dtb_2013,
                 dtb_2012, dtb_2011, dtb_2010, dtb_2009, dtb_2008,
                 dtb_2007, dtb_2006, dtb_2005, dtb_2004)

usethis::use_data(dtb, overwrite = TRUE, compress = "xz")
