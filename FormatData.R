library(dplyr)
library(stringi)

#Format data

#DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

DATA <- read.csv("/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

ModifiedData <- DATA[, -which(names(DATA) %in% c("status", "weight_oz"))]

JustMP <- stri_extract_first_regex(ModifiedData$primary_camera, "[0-9]+")

MoreModifiedData <- ModifiedData %>%  mutate("Primary Camera MP"=JustMP)