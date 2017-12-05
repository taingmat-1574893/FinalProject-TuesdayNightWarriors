library(shiny)
source("../FormatData.R")

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  headerPanel("test"),
  
  sidebarPanel(
    uiOutput("choose_brand"),
    uiOutput("choose_os"),
    uiOutput("choose_CPU"),
    uiOutput("choose_ram"),
    uiOutput("choose_mem"),
    uiOutput("choose_primary"),
    uiOutput("choose_secondary"),
    uiOutput("choose_intmem"),
    uiOutput("choose_features")
  ),
  
  
  mainPanel(
    uiOutput("choose_model"),
    
    tableOutput("data_table")
  )
))