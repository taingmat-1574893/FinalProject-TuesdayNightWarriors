#Description: Contains functions neccesary to create graphs, as well as create tables
#Sourced in server file to create plots given a user input.

#Neccesary Libraries
library(dplyr)
library(ggplot2)

#Setup
source("FormatData.R")
#Needed to create the table that comes after the plots
TableOG <- read.csv("Data/phone_dataset - original.csv",quote = "", row.names = NULL, stringsAsFactors = FALSE)

#-------multiplot Function---------
#Needed to plot multiple plots in the Shiny App
#Function taken because for some reason it doesn't exist in the ggplot2 package
#Found at https://stackoverflow.com/questions/24387376/r-weird-error-could-not-find-function-multiplot
multiplot <- function(..., plotlist = NULL, file, cols = 1, layout = NULL) {
  require(grid)
  plots <- c(list(...), plotlist)
  numPlots = length(plots)
  if (is.null(layout)) {
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  if (numPlots == 1) {
    print(plots[[1]])
  } else {
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    for (i in 1:numPlots) {
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}

#-----------------GraphIT Function-----------------
#Takes in a list of phones and a list of specs
#Returns a multiplot containing a graph of each of the inputted phone specs, applied to the inputted models
#X = Phone Spec
#Y = Phone Model
GraphIT <- function(PhoneModelList,ListofSpecs) {
  phoneDF <- phone_data %>% filter(model %in% PhoneModelList)
#Creates 1st graph based on 1st spec 
  if(length(ListofSpecs) >= 1){
    x <- ggplot(phoneDF,aes(x=model,y= eval(parse(text=ListofSpecs[1])))) +
        geom_bar(stat="identity", aes(fill = model)) + 
      coord_flip() +
      labs(x = "Model", y = ListofSpecs[1]) 
  }
  #Creates 2nd graph based on 2nd spec
  if(length((ListofSpecs) >= 2)){
    y <- ggplot(phoneDF,aes(x = model,y = eval(parse(text = ListofSpecs[2])))) +
      geom_bar(stat = "identity", aes(fill = model)) + 
      coord_flip() +
      labs(x = "Model", y = ListofSpecs[2]) 
  }
  #Creates 3rd graph based on 3rd spec
  if (length((ListofSpecs) >= 3)){
    z <- ggplot(phoneDF,aes(x=model,y= eval(parse(text = ListofSpecs[3])))) +
      geom_bar(stat = "identity", aes(fill = model)) + 
      coord_flip() +
      labs(x = "Model", y = ListofSpecs[3]) 
   }
  #if statements used to return only the number of charts made
  if (length(ListofSpecs) == 1){
    return (multiplot(x))
  }
  if (length(ListofSpecs) == 2){
    return (multiplot(x,y))
  }
  if (length(ListofSpecs) == 3){
    return (multiplot(x,y,z))
  }
}

#---------------PlotTable Function-------------------
# Takes in a list of phone models 
# Creates a table of information of selected models of phones
# Rows are information about the phones
# Columns are phone models
PlotTable <- function (PhoneModelList) {
  xSpecs <- TableOG %>% filter(model %in% PhoneModelList) 
  rownames(xSpecs) <- xSpecs$model
  xSpecs <- t(xSpecs %>% select(-model))
  return(xSpecs)
  
}














