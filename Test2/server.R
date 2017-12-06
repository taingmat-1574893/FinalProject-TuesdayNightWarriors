#Assignment 8 - Server

library(shiny)
library(dplyr)
library(ggplot2)

source("FormatData.R")


#Shiny Server
server <- shinyServer(function(input, output) {
  
  
  output$specs <- renderPrint({
    input$SpecsInput
  })
  output$distPlot <- renderPlot({
    filtered <- TableOG %>%
      filter(model == input$ModelInput)
  xSpecs <- grid.table(smallTable)
    
  })
  
})

