#Assignment 8 - Server

library(shiny)
library(dplyr)
library(ggplot2)

source("FormatData copy.R")


#Shiny Server
server <- shinyServer(function(input, output) {
  
  
  output$specs <- renderDataTable({
    input$SpecsInput
  })
  output$distPlot <- renderDataTable({
    filtered <- TableOG %>%
      filter(model == input$ModelInput)

  })
  
})

