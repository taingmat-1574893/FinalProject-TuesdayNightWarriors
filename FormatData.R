library(dplyr)
library(stringi)

#Format data

#DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

DATA <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

ModifiedData <- DATA[, -which(names(DATA) %in% c("status", "weight_oz"))]

PrimaryJustMP <- as.numeric(stri_extract_first_regex(ModifiedData$primary_camera, "[0.0-9.0]+"))

SecondaryJustMP <- as.numeric(stri_extract_first_regex(ModifiedData$secondary_camera, "[0.0-9.0]+"))

CpuGHz <- as.numeric(stri_extract_first_regex(ModifiedData$CPU, "[0.0-9.0]+"))

MemoryCard <- as.numeric(stri_extract_first_regex(ModifiedData$memory_card, "[0.0-9.0]+"))

BatteryMPH <- as.numeric(stri_extract_first_regex(ModifiedData$battery, "[0.0-9.0]+"))

phone_data <- ModifiedData %>%  
  mutate("Primary_Camera_MP"= PrimaryJustMP) %>% 
  mutate ("Secondry_Camera_MP" = SecondaryJustMP) %>% 
  mutate("CPU_GHz"=CpuGHz) %>% 
  mutate("Memory_Card_GB"=MemoryCard) %>% 
  mutate("Battery_MPH"=BatteryMPH)




