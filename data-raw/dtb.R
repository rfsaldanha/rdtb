## code to prepare `dtb` dataset goes here

library(tidyverse)
library(readODS)
library(furrr)

plan(multisession, workers = 20)

prepare_dtb <- function(year){
  if(year == 2022){
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

    dtb <- left_join(uf_2022, rgi1_2022) %>%
      left_join(rgi2_2022) %>%
      left_join(meso_2022) %>%
      left_join(micro_2022, relationship = "many-to-many") %>%
      left_join(muni_2022, relationship = "many-to-many") %>%
      left_join(distr_2022, relationship = "many-to-many") %>%
      left_join(subdistr_2022, relationship = "many-to-many")
  } else if(year == 2021){
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

    dtb <- left_join(uf_2021, rgi1_2021) %>%
      left_join(rgi2_2021) %>%
      left_join(meso_2021) %>%
      left_join(micro_2021, relationship = "many-to-many") %>%
      left_join(muni_2021, relationship = "many-to-many") %>%
      left_join(distr_2021, relationship = "many-to-many") %>%
      left_join(subdistr_2021, relationship = "many-to-many")
  } else if(year == 2020){
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

    dtb <- left_join(uf_2020, rgi1_2020) %>%
      left_join(rgi2_2020) %>%
      left_join(meso_2020) %>%
      left_join(micro_2020, relationship = "many-to-many") %>%
      left_join(muni_2020, relationship = "many-to-many") %>%
      left_join(distr_2020, relationship = "many-to-many") %>%
      left_join(subdistr_2020, relationship = "many-to-many")
  } else if(year == 2019){
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

    dtb <- left_join(uf_2019, rgi1_2019) %>%
      left_join(rgi2_2019) %>%
      left_join(meso_2019) %>%
      left_join(micro_2019, relationship = "many-to-many") %>%
      left_join(muni_2019, relationship = "many-to-many") %>%
      left_join(distr_2019, relationship = "many-to-many") %>%
      left_join(subdistr_2019, relationship = "many-to-many")
  } else if(year == 2018){
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

    dtb <- left_join(uf_2018, meso_2018) %>%
      left_join(micro_2018, relationship = "many-to-many") %>%
      left_join(muni_2018, relationship = "many-to-many") %>%
      left_join(distr_2018, relationship = "many-to-many") %>%
      left_join(subdistr_2018, relationship = "many-to-many")
  } else if(year == 2017){
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

    dtb <- left_join(uf_2017, meso_2017) %>%
      left_join(micro_2017, relationship = "many-to-many") %>%
      left_join(muni_2017, relationship = "many-to-many") %>%
      left_join(distr_2017, relationship = "many-to-many") %>%
      left_join(subdistr_2017, relationship = "many-to-many")
  } else if(year == 2016){
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

    dtb <- left_join(uf_2016, meso_2016) %>%
      left_join(micro_2016, relationship = "many-to-many") %>%
      left_join(muni_2016, relationship = "many-to-many") %>%
      left_join(distr_2016, relationship = "many-to-many") %>%
      left_join(subdistr_2016, relationship = "many-to-many")
  } else if(year == 2015){
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

    dtb <- left_join(uf_2015, meso_2015) %>%
      left_join(micro_2015, relationship = "many-to-many") %>%
      left_join(muni_2015, relationship = "many-to-many") %>%
      left_join(distr_2015, relationship = "many-to-many") %>%
      left_join(subdistr_2015, relationship = "many-to-many")
  } else if(year == 2014){
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

    dtb <- left_join(uf_2014, meso_2014) %>%
      left_join(micro_2014, relationship = "many-to-many") %>%
      left_join(muni_2014, relationship = "many-to-many") %>%
      left_join(distr_2014, relationship = "many-to-many") %>%
      left_join(subdistr_2014, relationship = "many-to-many")
  } else if(year == 2013){
    dtb <- read_ods(
      path = "data-raw/dtb_2013/dtb_2013.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2013
      )
  } else if(year == 2012){
    dtb <- read_ods(
      path = "data-raw/dtb_2012/dtb_2012.ods",
      sheet = "municipality"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        dtb = 2012
      )
  } else if(year == 2011){
    dtb <- read_ods(
      path = "data-raw/dtb_2011/dtb_2011.ods",
      sheet = "municipality"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        dtb = 2011
      )
  } else if(year == 2010){
    dtb <- read_ods(
      path = "data-raw/dtb_2010/dtb_2010.ods",
      sheet = "municipality"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        dtb = 2010
      )
  } else if(year == 2009){
    dtb <- read_ods(
      path = "data-raw/dtb_2009/dtb_2009.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2009
      )
  } else if(year == 2008){
    dtb <- read_ods(
      path = "data-raw/dtb_2008/dtb_2008.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2008
      )
  } else if(year == 2007){
    dtb <- read_ods(
      path = "data-raw/dtb_2007/dtb_2007.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2007
      )
  } else if(year == 2006){
    dtb <- read_ods(
      path = "data-raw/dtb_2006/dtb_2006.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 2006)
  } else if(year == 2005){
    dtb <- read_ods(
      path = "data-raw/dtb_2005/dtb_2005.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2005
      )
  } else if(year == 2004){
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

    dtb <- left_join(muni_2004, distr_2004) %>%
      left_join(subdistr_2004) %>%
      mutate(dtb = 2004)
  } else if(year == 2003){
    dtb <- read_ods(
      path = "data-raw/dtb_2003/dtb_2003.ods",
      sheet = "all"
    ) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr)),
        dtb = 2003
      )
  } else if(year == 2000){
    mun_2000 <- read_ods(
      path = "data-raw/dtb_2000/dtb_2000.ods",
      sheet = "all"
    )

    uf_2000 <- mun_2000 %>%
      filter(level == 2) %>%
      select(code_uf, name_uf = name)

    meso_2000 <- mun_2000 %>%
      filter(level == 8) %>%
      select(code_uf, code_meso, name_meso = name) %>%
      mutate(code_meso = as.numeric(paste0(code_uf, str_pad(string = code_meso, side = "left", pad = 0, width = 2))))

    micro_2000 <- mun_2000 %>%
      filter(level == 9) %>%
      select(code_uf, code_meso, code_micro, name_micro = name) %>%
      mutate(
        code_meso = as.numeric(paste0(code_uf, str_pad(string = code_meso, side = "left", pad = 0, width = 2))),
        code_micro = as.numeric(paste0(code_uf, str_pad(string = code_micro, side = "left", pad = 0, width = 3))),
      ) %>%
      select(-code_uf)

    muni_2000 <- mun_2000 %>%
      filter(level == 5) %>%
      select(code_uf, code_micro, code_muni, name_muni = name) %>%
      mutate(
        code_micro = as.numeric(paste0(code_uf, str_pad(string = code_micro, side = "left", pad = 0, width = 3))),
        code_muni = as.numeric(paste0(code_uf, str_pad(string = code_muni, side = "left", pad = 0, width = 5)))
      ) %>%
      select(-code_uf)

    distr_2000 <- mun_2000 %>%
      filter(level == 6) %>%
      select(code_uf, code_muni, code_distr, name_distr = name) %>%
      mutate(
        code_muni = as.numeric(paste0(code_uf, str_pad(string = code_muni, side = "left", pad = 0, width = 5))),
        code_distr = as.numeric(paste0(code_muni, str_pad(string = code_distr, side = "left", pad = 0, width = 2)))
      ) %>%
      select(-code_uf)

    subdistr_2000 <- mun_2000 %>%
      filter(level == 6) %>%
      select(code_uf, code_muni, code_distr, code_subdistr, name_subdistr = name) %>%
      mutate(
        code_muni = as.numeric(paste0(code_uf, str_pad(string = code_muni, side = "left", pad = 0, width = 5))),
        code_distr = as.numeric(paste0(code_muni, str_pad(string = code_distr, side = "left", pad = 0, width = 2))),
        code_subdistr = as.numeric(paste0(code_distr, str_pad(string = code_subdistr, side = "left", pad = 0, width = 2)))
      ) %>%
      select(-code_uf, -code_muni)

    dtb <- left_join(uf_2000, meso_2000) %>%
      left_join(micro_2000) %>%
      left_join(muni_2000) %>%
      left_join(distr_2000) %>%
      left_join(subdistr_2000) %>%
      mutate(dtb = 2000) %>%
      relocate(dtb)
  } else if(year == 1994){
    mun_1994 <- read_fwf(
      file = "data-raw/dtb_1994/DTB94BR.DAT",
      col_positions = fwf_widths(
        c(2,2,3,4,1,2,2,64),
        c("code_uf", "code_meso","code_micro","code_muni",
          "dv","code_distr","code_subdistr","name")
      ),
      col_types = c("cccccccc")
    ) %>%
      na.omit() %>%
      mutate(level = case_when(
        code_meso == "00" & code_micro == "000" & code_muni == "0000" & code_distr == "00" & code_subdistr == "00" ~ 2,
        code_meso != "00" & code_micro == "000" & code_muni == "0000" & code_distr == "00" & code_subdistr == "00" ~ 8,
        code_meso != "00" & code_micro != "000" & code_muni == "0000" & code_distr == "00" & code_subdistr == "00" ~ 9,
        code_meso != "00" & code_micro != "000" & code_muni != "0000" & code_distr == "00" & code_subdistr == "00" ~ 5,
        code_meso != "00" & code_micro != "000" & code_muni != "0000" & code_distr != "00" & code_subdistr == "00" ~ 6,
        code_meso != "00" & code_micro != "000" & code_muni != "0000" & code_distr != "00" & code_subdistr != "00" ~ 7
      ))

    uf_1994 <- mun_1994 %>%
      filter(level == 2) %>%
      select(code_uf, name_uf = name) %>%
      mutate(code_uf = as.numeric(code_uf))

    meso_1994 <- mun_1994 %>%
      filter(level == 8) %>%
      select(code_uf, code_meso, name_meso = name) %>%
      mutate(
        code_uf = as.numeric(code_uf),
        code_meso = as.numeric(paste0(code_uf, code_meso))
      )

    micro_1994 <- mun_1994 %>%
      filter(level == 9) %>%
      select(code_uf, code_meso, code_micro, name_micro = name) %>%
      mutate(
        code_uf = as.numeric(code_uf),
        code_meso = as.numeric(paste0(code_uf, code_meso)),
        code_micro = as.numeric(paste0(code_uf, code_micro))
      ) %>%
      select(-code_uf)

    muni_1994 <- mun_1994 %>%
      filter(level == 5) %>%
      select(code_uf, code_micro, code_muni, dv, name_muni = name) %>%
      mutate(
        code_uf = as.numeric(code_uf),
        code_micro = as.numeric(paste0(code_uf, code_micro)),
        code_muni = as.numeric(paste0(code_uf, code_muni, dv))
      ) %>%
      select(-code_uf, -dv)

    distr_1994 <- mun_1994 %>%
      filter(level == 6) %>%
      select(code_uf, code_muni, dv, code_distr, name_distr = name) %>%
      mutate(
        code_uf = as.numeric(code_uf),
        code_muni = as.numeric(paste0(code_uf, code_muni, dv)),
        code_distr = as.numeric(paste0(code_muni, code_distr))
      ) %>%
      select(-code_uf, -dv)

    subdistr_1994 <- mun_1994 %>%
      filter(level == 6) %>%
      select(code_uf, code_muni, dv, code_distr, code_subdistr, name_distr = name) %>%
      mutate(
        code_uf = as.numeric(code_uf),
        code_muni = as.numeric(paste0(code_uf, code_muni, dv)),
        code_distr = as.numeric(paste0(code_muni, code_distr)),
        code_subdistr = as.numeric(paste0(code_distr, code_subdistr))
      ) %>%
      select(-code_uf, -dv, -code_muni)

    dtb <- left_join(uf_1994, meso_1994) %>%
      left_join(micro_1994) %>%
      left_join(muni_1994) %>%
      left_join(distr_1994) %>%
      left_join(subdistr_1994) %>%
      mutate(dtb = 1994) %>%
      relocate(dtb)
  } else if(year == 1980){
    dtb <- read_ods(
      path = "data-raw/dtb_1980/dtb_1980.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 1980) %>%
      relocate(dtb)
  } else if(year == 1970){
    dtb <- read_ods(
      path = "data-raw/dtb_1970/dtb_1970.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 1970) %>%
      relocate(dtb)
  } else if(year == 1960){
    dtb <- read_ods(
      path = "data-raw/dtb_1960/dtb_1960.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 1960) %>%
      relocate(dtb)
  } else if(year == 1950){
    dtb <- read_ods(
      path = "data-raw/dtb_1950/dtb_1950.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 1950) %>%
      relocate(dtb)
  } else if(year == 1940){
    dtb <- read_ods(
      path = "data-raw/dtb_1940/dtb_1940.ods",
      sheet = "all"
    ) %>%
      mutate(dtb = 1940) %>%
      relocate(dtb)
  }



  return(dtb)
}










dtb  <- future_map_dfr(
  c(1940, 1950, 1960, 1970, 1980, 1994, 2000, 2003:2022),
  prepare_dtb,
  .options = furrr_options(seed = 123),
  .progress = TRUE
) %>%
  select(dtb, code_uf, name_uf, code_rgi1, name_rgi1, code_rgi2, name_rgi2,
         code_meso, name_meso, code_micro, name_micro, code_muni, name_muni,
         code_distr, name_distr, code_subdistr, name_subdistr) %>%
  as_tibble()

usethis::use_data(dtb, overwrite = TRUE, compress = "xz")
