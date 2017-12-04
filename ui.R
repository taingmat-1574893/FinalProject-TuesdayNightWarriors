#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(shinyjs)

# #Data setup
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

  
#Start of UI
shinyUI(fluidPage(

  # Application title
  titlePanel("TruePhone"),

  dashboardPage(
     skin = "purple",
     
     dashboardHeader(
       title = "Phone finder"),
     dashboardSidebar(
        useShinyjs(),
        width = 300,
        
        selectizeInput("brand_list", "Brand:", choices = phone_data$brand,
        multiple = TRUE,
        options = list(maxItems = 4)
        ), 
        
        useShinyjs(),
        selectizeInput("display_type", "Display type:", choices = phone_data$display_type,
                       multiple = TRUE,
                       options = list(maxItems = 4)
        ),
        selectizeInput("os", "Overhead OS:", choices = phone_data$OS,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ), 
        selectizeInput("sim", "Sim:", choices = phone_data$SIM,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ),
        selectizeInput("bluetooth", "Bluetooth", choices = phone_data$bluetooth,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        selectizeInput("usb", "USB", choices = phone_data$USB,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        sliderInput("date", "Announced Date:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("cpu", "CPU:",
                    min = 1, max = 1000,
                    value = c(0, 8)),
        sliderInput("internalmem", "Internal Memory:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("ram", "Ram:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("primarymb", "Primary-MP:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("secondarymb", "Secondary-MP:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("price", "Approx. Price:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500))
      
     ),
     
     dashboardBody(
        p("this is the main panel")                         
        #actionButton("showSidebar", "Show sidebar"),
        #actionButton("hideSidebar", "Hide sidebar")
      )
    )
  )
)


#shinyApp(ui, server)