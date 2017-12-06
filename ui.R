#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(shinyjs)

#------Start of UI, makes it look pretty-----------
shinyUI(fluidPage(
  theme = "sweet.css", 
  titlePanel("TruePhone"),
  dashboardPage(
     skin = "black",
     dashboardHeader(
           titleWidth = 300,
           title = "Phone Finder"),
     
#-----------------side bar panel -----------------
     dashboardSidebar(
           useShinyjs(),
           width = 300,
           
          #------Displays Widgets for user filtering-----
           uiOutput("choose_brand"),
           uiOutput("choose_os"),
          
          #-------Slider Bars----------------------
           uiOutput("choose_CPU"),
           uiOutput("choose_ram"),
           uiOutput("choose_mem"),
           uiOutput("choose_primary"),
           uiOutput("choose_secondary"),
           uiOutput("choose_intmem"),
           
          #-----------Checkboxes--------------------
           h3("Required Features:"),
           uiOutput("choose_features")
     ),
     
#-----------------main panel -----------------
     dashboardBody(
       #Prevents errors from showing up
       #Plotting issues typically occur when users have not yet selected models
       tags$style(type="text/css",
                  ".shiny-output-error { visibility: hidden; }",
                  ".shiny-output-error:before { visibility: hidden; }"
       ),
       # Information displayed in the main panel
       p("How to Use TruePhone:"),
       p("1. Pick the specifications that matter to you in a phone along the left side bar (Note: Do not feel obliged to fill out all the options.)"),
       p("2. Enter the Specifications you wish to compare the phones by in the Compare By search box. You may enter up to 3 specifications."),
       p("3. Enter the Models of the phones you wish to compare the above mentioned specifications by in the Model search box. You may enter up to 3 model types."),
       uiOutput("compare_by"),
       uiOutput("choose_model"),
       h1("Phone Comparison Graphs:"),
       plotOutput("plot1"),
       h1("More Detailed Information:"),
       tableOutput("table")
      )
    )
  )
)
