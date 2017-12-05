library(dplyr)
library(stringi)

###########################GENERAL NOTES ABOUT DATA WRANGLING############################################
#use baseline r regx

#DATA <- read.csv("/Users/mikiaslema/Documents/INFO201/Projects/FinalProject/FinalProject-TuesdayNightWarriors/Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

#Format data
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE) %>%
  mutate(CPU = gsub('4x', "", CPU), CPU = gsub('2x', "", CPU), CPU = gsub('3x', "", CPU))

#Function which takes in a column of phone specs
#Returns the column only containing the first number of each string
firstNum <- function(column) {
  return(as.numeric(stri_extract_first_regex(column, "[0.0-9.0]+")))
} 

#Reformatting the data to make it quantifiable 
phone_data <- phone_data %>%  
  mutate("CPU_GHz"= firstNum(phone_data$CPU)) %>% 
  mutate("Memory_Card_GB"= firstNum(phone_data$memory_card)) %>% 
  mutate("Battery_MPH"= firstNum(phone_data$battery)) %>% 
  mutate("Primary_Camera_MP" = ifelse(firstNum(phone_data$primary_camera) > 50, NA, firstNum(phone_data$primary_camera))) %>%
  mutate("Secondary_Camera_MP" = ifelse(firstNum(phone_data$secondary_camera) > 20, NA, firstNum(phone_data$secondary_camera))) %>%
  mutate("Internal-Memory" = firstNum(phone_data$internal_memory)) %>%
  mutate("Ram_GB" = firstNum(phone_data$RAM)) %>%
  mutate("approx_price_USD" = approx_price_EUR*1.19) %>%
  mutate("Display_size" = firstNum(phone_data$display_size)) %>%
  mutate("Announced" = firstNum(phone_data$announced))
  
#All blanks and N/A values become NA
phone_data[phone_data==""]<-NA
phone_data[phone_data=="N/A"]<-NA