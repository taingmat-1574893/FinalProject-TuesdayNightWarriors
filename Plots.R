library(dplyr)
library(ggplot2)
source("FormatData.R")


# PhoneModelList = list(
#    "iPhone 7 Plus",
#    "iPhone 7",
#    "iPhone SE"
#   )
# 
# ListofSpecs = list(
#     "RAM" = 'Ram_GB',
#     "Battery" = 'Battery_MPH',
#     "CPU" = 'CPU_GHz',
#     "Internal Memory" = 'Internal Memory'
#   
#   )
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  require(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

GraphIT <- function(PhoneModelList,ListofSpecs) {
  
  phoneDF <- phone_data %>% filter(model %in% PhoneModelList)
  
if(length(ListofSpecs) >= 1){
  
  x <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[1])))) +
      geom_bar(stat="identity",aes(fill= model)) + 
    coord_flip() +
    labs(x = "Please work!!!", y = ListofSpecs[1]) 
    }
if(length((ListofSpecs) >= 2)){
  y <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[2])))) +
    geom_bar(stat="identity",aes(fill= model)) + 
    coord_flip() +
    labs(x = "I'm updated", y = ListofSpecs[2]) 
  }
 if (length((ListofSpecs) >= 3)){
   z <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[3])))) +
     geom_bar(stat="identity",aes(fill= model)) + 
     coord_flip() +
     labs(x = "Please work!!!", y = ListofSpecs[3]) 
 }
  if (length(ListofSpecs) == 1){
  return (multiplot(x))
  }
  if (length(ListofSpecs) == 2){
    return (multiplot(x,y))
  }
  if (length(ListofSpecs) == 3){
    return (multiplot(x,y,z))
  }
  #return(multiplot(x, y, z))
}



# TPhoneModelList = c(
#   "iPhone 7 Plus",
#   "iPhone 7",
#   "iPhone SE"
# )
# 
# TListofSpecs = c(
#     'RAM',
#     'battery',
#     'CPU')

TableOG <- read.csv("Data/phone_dataset - original.csv",quote = "", row.names = NULL, stringsAsFactors = FALSE)

PlotTable <- function (PhoneModelList) {
  xSpecs <- TableOG %>% filter(model %in% PhoneModelList) 
  rownames(xSpecs) <- xSpecs$model
  xSpecs <- t(xSpecs %>% select(-model))
  return(xSpecs)
  
}














