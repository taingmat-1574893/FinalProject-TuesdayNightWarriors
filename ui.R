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
  titlePanel("TruePhone"),
  
  #Sidebar that contains both widgets on the left side 
  sidebarLayout(
    sidebarPanel(
      
      selectizeInput("brand_list", "Brand", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      selectizeInput("displaytype", "Display Type", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      selectizeInput("os", "Overhead OS", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      selectizeInput("sim", "Sim", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      selectizeInput("bluetooth", "Bluetooth", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      selectizeInput("usb", "USB", choices = list("a", "b", "c", "d"), 
                     multiple = TRUE, 
                     options = list(maxItems = 4), 
                     selected = list("a", "b", "c")),
      #
      sliderInput("date", "Announced Date:",
                  min = 1, max = 1000, # change to dates
                  value = c(200,500)),
      sliderInput("cpu", "CPU:",
                  min = 0, max = 8,
                  value = 0),
    
      #Allows user to select a trait to compare by 
       selectInput("trait", h3("choices"), 
                        choices = list("a", "b"), 
                        selected = "a")

    ),
  
    mainPanel(
    )
  )
))
