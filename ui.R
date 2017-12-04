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
        width = 325,
        selectizeInput("brand_list", "Brand:", choices = list("a", "b", "c", "d"),
        multiple = TRUE,
        options = list(maxItems = 4),
        selected = list("a", "b", "c")
        ), 
        
        useShinyjs(),
        selectizeInput("display_type", "Display type:", choices = list("a", "b", "c", "d"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ),
        selectizeInput("os", "Overhead OS:", choices = list("a", "b", "c", "d"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ), 
        selectizeInput("sim", "Sim:", choices = list("a", "b", "c", "d"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ),
        selectizeInput("bluetooth", "Bluetooth", choices = list("a", "b", "c", "d"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        selectizeInput("usb", "USB", choices = list("a", "b", "c", "d"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        sliderInput("date", "Announced Date:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        sliderInput("cpu", "CPU:",
                    min = 0, max = 8,
                    value = 0),
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
         # this is now the main panel                         
        #actionButton("showSidebar", "Show sidebar"),
        #actionButton("hideSidebar", "Hide sidebar")
      )
    )
  )
)

server <-function(input, output) {
  observeEvent(input$showSidebar, {
    shinyjs::removeClass(selector = "body", class = "sidebar-collapse")
  })
  observeEvent(input$hideSidebar, {
    shinyjs::addClass(selector = "body", class = "sidebar-collapse")
  })
}

#shinyApp(ui, server)