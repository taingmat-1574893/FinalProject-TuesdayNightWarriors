library(shiny)
library(dplyr)
library(ggplot2)

source("FormatData copy.R")


sidebarLayout(
  position = "right",
  sidebarPanel(
    
    #Side Bar Panel
    
    selectizeInput("brand", "Brand:", choices = phone_data$brand,
                   multiple = TRUE,
                   options = list(maxItems = 4)
    ), 
    
  #Main Panel
  mainPanel(
    plotOutput("distPlot"),
    verbatimTextOutput(outputId = "calories")
  )
)
)
