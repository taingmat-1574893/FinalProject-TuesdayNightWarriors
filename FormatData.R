library(dplyr)
library(stringi)

#Format data

#DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

DATA <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

ModifiedData <- DATA[, -which(names(DATA) %in% c("status", "weight_oz"))]

PrimaryJustMP <- stri_extract_first_regex(ModifiedData$primary_camera, "[0.0-9.0]+")

SecondaryJustMP <- stri_extract_first_regex(ModifiedData$secondary_camera, "[0.0-9.0]+")

CpuGHz <- stri_extract_first_regex(ModifiedData$CPU, "[0.0-9.0]+")

MemoryCard <- stri_extract_first_regex(ModifiedData$memory_card, "[0.0-9.0]+")

BatteryMPH <- stri_extract_first_regex(ModifiedData$battery, "[0.0-9.0]+") 

MoreModifiedData <- ModifiedData %>%  mutate("Primary Camera MP"= PrimaryJustMP) %>% mutate ("Secondry Camera MP" = SecondaryJustMP) %>% mutate("CPU GHz"=CpuGHz) %>% mutate("Memory Card GB"=MemoryCard) %>% mutate("Battery MPH"=BatteryMPH)




