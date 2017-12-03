library(dplyr)

#Format data
DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

ModifiedData<- DATA[, -which(names(DATA) %in% c("status", "weight_oz"))]