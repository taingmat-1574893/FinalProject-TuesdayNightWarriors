#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)

#Data setup
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

# Start of UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Cereal Brand Comparer"),
  
  #Sidebar that contains both widgets on the left side 
  sidebarLayout(
    sidebarPanel(
      
      selectizeInput("brand_list", h3("Type"), choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
    
      #Allows user to select a trait to compare by 
       selectInput("trait", h3("choices"), 
                        choices = list("a", "b"), 
                        selected = "a")

    ),
  
    mainPanel(
    )
  )
))
