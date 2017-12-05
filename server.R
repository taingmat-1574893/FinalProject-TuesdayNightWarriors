#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

#Data setup
source("FormatData.R")

#Start of Shiny Server 
shinyServer(function(input, output) {
    output$phone_data <- renderDataTable({
      phone_data %>%
      filter(input$os %in% OS)
    })
  #Creates plot dependent on user input
    output$comparisonPlot <- renderPlotly({
      ggplot(phone_data)
    })
  })


