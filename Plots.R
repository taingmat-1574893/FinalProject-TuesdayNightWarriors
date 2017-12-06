library(dplyr)
library(ggplot2)
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


GraphIT <- function(PhoneModelList,ListofSpecs) {
  
  phoneDF <- phone_data %>% filter(model %in% PhoneModelList)
  
if(length(ListofSpecs) >= 1){
  
  x <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[1])))) +
      geom_bar(stat="identity",aes(fill= model)) + 
    coord_flip()
    }
if(length((ListofSpecs) >= 2)){
  y <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[2])))) +
    geom_bar(stat="identity",aes(fill= model))
  }
 if (length((ListofSpecs) >= 3)){
   z <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[3])))) +
     geom_bar(stat="identity",aes(fill= model))
}
  return (list(x,y,z))
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

TableOG <- read.csv("Data copy/phone_dataset - original.csv",quote = "", row.names = NULL, stringsAsFactors = FALSE)


PlotTable <- function (TableOG) {
    
    xSpecs <- TableOG %>% filter(model %in% TPhoneModelList) %>% select_(.dots = TListofSpecs)
    rownames(xSpecs) <- TPhoneModelList

  return(xSpecs)
  
}













