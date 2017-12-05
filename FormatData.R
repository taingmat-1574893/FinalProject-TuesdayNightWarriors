library(dplyr)
library(stringi)

#Format data

#DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

GreaterThan50NA <- function(number) {
  if(number > 50) {
    return(NA)
  }
  else {
    return(number)
  }
}

DATA <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

#use baseline r regx 
ModifiedData <- DATA[, -which(names(DATA) %in% c("status", "weight_oz"))] %>% 
  mutate(CPU = gsub('4x', "", CPU), CPU = gsub('2x', "", CPU), CPU = gsub('3x', "", CPU))
  
PrimaryJustMP <- as.numeric(stri_extract_first_regex(ModifiedData$primary_camera, "[0.0-9.0]+"))
SecondaryJustMP <- as.numeric(stri_extract_first_regex(ModifiedData$secondary_camera, "[0.0-9.0]+"))
CpuGHz <- as.numeric(stri_extract_first_regex(ModifiedData$CPU, "[0.0-9.0]+"))
MemoryCard <- as.numeric(stri_extract_first_regex(ModifiedData$memory_card, "[0.0-9.0]+"))
BatteryMPH <- as.numeric(stri_extract_first_regex(ModifiedData$battery, "[0.0-9.0]+"))
internalMem <- as.numeric(stri_extract_last_regex(ModifiedData$internal_memory, "[0.0-9.0]+"))
#Ram <- as.numeric(stri_extract_first_regex(ModifiedData$RAM, "[0.0-9.0]+"))
#Applying
phone_data <- ModifiedData  %>%  
  mutate("CPU_GHz"=CpuGHz) %>% 
  mutate("Memory_Card_GB"=MemoryCard) %>% 
  mutate("Battery_MPH"=BatteryMPH) %>% 
  mutate("Primary_Camera_MP" = ifelse(PrimaryJustMP > 50, NA, PrimaryJustMP)) %>%
  mutate("Secondary_Camera_MP" = ifelse(SecondaryJustMP > 20, NA, SecondaryJustMP)) %>%
  mutate("Internal-Memory" = internalMem) %>%
  mutate("Ram_GB" = Ram) 
phone_data[phone_data==""]<-NA
phone_data[phone_data=="N/A"]<-NA