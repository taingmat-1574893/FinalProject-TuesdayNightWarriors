#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

#Data setup
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

#Start of Shiny Server 
shinyServer(function(input, output) {
    
  #Creates plot dependent on user input
    output$comparisonPlot <- renderPlotly({
    })
    
  })


