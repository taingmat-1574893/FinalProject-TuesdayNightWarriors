#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data_sets <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
shinyUI(pageWithSidebar(
  
  headerPanel(""),
  
  sidebarPanel(
    uiOutput("choose_brand"),
    data_sets <- data_sets[data_sets$brand == "brand", ],
    
    uiOutput("choose_displaytype"),
    
    uiOutput("choose_model"),
    br(),
    a(href = "https://gist.github.com/4211337", "Source code")
  ),
  
  
  mainPanel(
    tableOutput("data_table")
  )
))