#Description: Used to put phone_data into a usable format for plotting and filtering
#Sourced in server.R and Plots.R so that they can have access to reformatted phone_data

#Neccesary Libraries
library(dplyr)
library(stringi)

#The data was atrocious so we had to use a mix of R and Excel to reformat it
#We reformatted data for two purposes: 
  #1: Making it quantifiable thus graphable 
  #2: Making it Filterable 

#-------------Reading in data-------------------------
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE) %>%
  mutate(CPU = gsub('4x', "", CPU), CPU = gsub('2x', "", CPU), CPU = gsub('3x', "", CPU))

#-------------firstNum Function--------------------------------
#Function which takes in a column of phone specs
#Returns the column only containing the first number of each string
firstNum <- function(column) {
  return(as.numeric(stri_extract_first_regex(column, "[0.0-9.0]+")))
} 

#-----Reformatting the data to make it quantifiable------------
#Makes it possible to graph
phone_data <- phone_data %>%  
  mutate("CPU_GHz"= firstNum(phone_data$CPU)) %>% 
  mutate("Memory_Card_GB"= firstNum(phone_data$memory_card)) %>%
  mutate("Battery_MPH"= firstNum(phone_data$battery)) %>% 
  mutate("Primary_Camera_MP" = ifelse(firstNum(phone_data$primary_camera) > 50, NA, firstNum(phone_data$primary_camera))) %>%
  mutate("Secondary_Camera_MP" = ifelse(firstNum(phone_data$secondary_camera) > 20, NA, firstNum(phone_data$secondary_camera))) %>%
  mutate("Internal_Memory" = firstNum(phone_data$internal_memory)) %>%
  mutate("Ram_GB" = firstNum(phone_data$RAM)) %>%
  mutate("approx_price_USD" = approx_price_EUR*1.19) %>%
  mutate("Display_size" = firstNum(phone_data$display_size)) %>%
  mutate("Announced" = firstNum(phone_data$announced))

#------All blanks and N/A values become NA--------------------
phone_data[phone_data==""]<-NA
phone_data[phone_data=="N/A"]<-NA
phone_data[is.na(phone_data$Memory_Card_GB)] <- 0