library(dplyr)
source("FormatData.R")


PhoneModelList = list(
   "iPhone 7 Plus",
   "iPhone 7",
   "iPhone SE"
  )

ListofSpecs = list(
    "RAM" = 'Ram_GB',
    "Battery" = 'Battery_MPH',
    "CPU" = 'CPU_GHz',
    "Internal Memory" = 'Internal Memory'
  
  )


phoneDF <- phone_data %>% filter(model %in% PhoneModelList)
if(length(ListofSpecs) >= 1){
  
  x <- ggplot(phoneDF,x= ,y= ) +
    geom_col(aes_string("model", as.character(ListofSpecs[1]), fill = "model"))
    }
if(length((ListofSpecs) >= 2)){
  y <- ggplot(phoneDF) +
    geom_col(aes_string("model", as.character(ListofSpecs[2]), fill = "model"))
  }
 if (length((ListofSpecs) >= 3)){
   z <- ggplot(phoneDF) +
     geom_col(aes_string("model", as.character(ListofSpecs[3]), fill = "model"))
}
  




TPhoneModelList = c(
  "iPhone 7 Plus",
  "iPhone 7",
  "iPhone SE"
)

TListofSpecs = c(
    'RAM',
    'battery',
    'CPU')
  # "RAM" = 'Ram_GB',
  # "Battery" = 'Battery_MPH',
  # "CPU" = 'CPU_GHz',
  # "Internal Memory" = 'Internal Memory',
  # "Primary Camera" = 'Primary_Camera_MP',
  # "Secondary Camera" = 'Secondary_Camera_MP',
  # "Memory Card" = "Memory_Card_GB"



TableOG <- read.csv("Data copy/phone_dataset - original.csv",quote = "", row.names = NULL, stringsAsFactors = FALSE)


PlotTable <- function (TableOG) {
    
    xSpecs <- TableOG %>% filter(model %in% TPhoneModelList) %>% select_(.dots = TListofSpecs)
    rownames(xSpecs) <- TPhoneModelList

  return(xSpecs)
  
}













