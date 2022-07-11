
pacman::p_load(tidyverse, tidyquant, 
               here, lubridate, 
               readxl, janitor, tidytable)

nl22 <- read_excel(here("data","2022.xlsx")) %>% 
  clean_names() %>%   
  filter(cve_municipio==19039) %>% 
  filter(subtipo_de_delito=="Homicidio doloso" |
           subtipo_de_delito=="Robo de vehículo automotor") %>% 
  group_by(subtipo_de_delito) %>% 
  summarise(across(enero:mayo, ~sum(.x,na.rm=T))) %>% 
  ungroup() %>% 
  rowwise() %>% 
  mutate(total = sum(c_across(enero:mayo))) %>% 
  ungroup() %>% 
  rename_with.(~paste(.x, "_2022"))

nl21 <- read_excel("2021.xlsx") %>% 
  clean_names() %>%   
  filter(cve_municipio==19039) %>% 
  filter(subtipo_de_delito=="Homicidio doloso" |
           subtipo_de_delito=="Robo de vehículo automotor") %>% 
  group_by(subtipo_de_delito) %>% 
  summarise(across(enero:mayo, ~sum(.x,na.rm=T))) %>% 
  ungroup() %>% 
  rowwise() %>% 
  mutate(total = sum(c_across(enero:mayo))) %>% 
  ungroup()%>% 
  rename_with.(~paste(.x, "_2021"))



