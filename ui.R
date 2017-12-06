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
     skin = "blue",
     
     dashboardHeader(
           titleWidth = 300,
           title = "Phone Finder"),
     dashboardSidebar(
           # side bar panel 
           useShinyjs(),
           width = 300,
           # widgets
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
       tags$style(type="text/css",
                  ".shiny-output-error { visibility: hidden; }",
                  ".shiny-output-error:before { visibility: hidden; }"
       ),
       # main panel
       uiOutput("compare_by"),
       uiOutput("choose_model"),
       plotOutput("plot1"),
       tableOutput("table")
      )
    )
  )
)
