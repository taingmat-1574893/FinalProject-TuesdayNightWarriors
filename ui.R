#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(shinyjs)

# #Data setup
source("FormatData.R")

#Start of UI
shinyUI(fluidPage(

  # Application title
  titlePanel("TruePhone"),
  
  dashboardPage(
     skin = "purple",
     dashboardHeader(
           title = "Phone Finder"),
     dashboardSidebar(
           useShinyjs(),
           width = 300,
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
     dashboardBody(
       uiOutput("compare_by"),
       uiOutput("choose_model")
      )
    )
  )
)


#shinyApp(ui, server)