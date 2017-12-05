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
  
  headerPanel("test"),
  
  sidebarPanel(
    # selectizeInput("brand", "Brand:", choices = data_sets$brand, 
    #                multiple = TRUE,
    #                options = list(maxItems = 4)),
    # 
    # data_test <- data_sets %>% filter(brand == "brand"),
    # 
    # selectizeInput("displaytype", "Display Type:", choices = data_sets[data_sets$brand == "brand", "displaytype"], 
    #                multiple = TRUE,
    #                options = list(maxItems = 4)),
    
    
    uiOutput("choose_brand"),
    #data_sets <- data_sets[data_sets$brand == "brand", ],

    uiOutput("choose_os"),
    uiOutput("choose_weight"),
    uiOutput("choose_CPU"),
    uiOutput("choose_model")
  ),
  
  
  mainPanel(
    tableOutput("data_table")
  )
))