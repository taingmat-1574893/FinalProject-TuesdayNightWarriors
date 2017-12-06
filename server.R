#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(shinyjs)

#Setup, sources required functions, and creates phone_data
source("FormatData.R")
source("Plots.R")

#-----------------------Start of Shiny Server-----------------------
shinyServer(function(input, output) {
  # Widget that allows a user to choose the phone brand
  output$choose_brand <- renderUI({
    selectizeInput("brand", "Brand:", choices = phone_data$brand, 
                   multiple = TRUE,
                   options = list(maxItems = 4))
  })
  
  # Widget that allows a user to choose the OS
  output$choose_os <- renderUI({
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    selectizeInput("os", "OS:",
                   choices = phone_data$OS,
                   multiple = TRUE
    )
  })
  
  #----------------------Sliders-----------------------------------------------
  # Widget that allows a user to choose the minimum CPU speed in GHz
  output$choose_CPU <- renderUI({
    sliderInput("cpu", "Minimum CPU(GHz):", min = 0, max = 3, value = 0)
  })
  
  # Widget that allows a user to choose the minimum ram in GB
  output$choose_ram <- renderUI({
    sliderInput("ram", "Minimum RAM (GB):", min = 0, max = 4, value = 0)
  })
  
  # Widget that allows a user to choose the minimum primary camera in MP
  output$choose_primary <- renderUI({
    sliderInput("primary_cam", "Minimum Primary Camera(MP):", min = 0, max = 20, value = 0)
  })
  
  # Widget that allows a user to choose the minimum secondary camera in MP
  output$choose_secondary<- renderUI({
    sliderInput("secondary_cam", "Minimum Secondary Camera(MP):", min = 0, max = 20, value = 0)
  })
  
  # Widget that allows a user to choose the minimum internal memory in GB
  output$choose_intmem<- renderUI({
    sliderInput("internalmem", "Minimum Internal Memory(GB):", min = 0, max = 128, value = 0)
  })
  
  #----------------------Checkboxes-----------------------------------------------
  # A group of check boxes that allows a user choose required features
  output$choose_features <- renderUI({
    tagList(
      checkboxInput("bluetooth", "Bluetooth", value = FALSE),
      checkboxInput("gps", "GPS", value = FALSE),
      checkboxInput("nfc", "NFC", value = FALSE),
      checkboxInput("audiojack", "Audio jack", value = FALSE),
      checkboxInput("loudspeaker", "Loud speaker", value = FALSE)
    )
  })
  
  #------------------------Spec Selector--------------------------------------------
  # Widget that allows a user to choose the specs they want to compare by
  output$compare_by <- renderUI({
    selectizeInput("specs", "Compare By:",
                   choices  = c("RAM(GB)" = "Ram_GB", 
                                "CPU(GHz)" = "CPU_GHz", 
                                "Internal Memory(GB)" = "Internal_Memory",
                                "Display Size(Inches)" = "Display_size", 
                                "Primary Camera(MP)" = "Primary_Camera_MP", 
                                "Secondary Camera(MP)" = "Secondary_Camera_MP", 
                                "Battery(mHz)" = "Battery_MPH",
                                "Approx Price(USD)" = "approx_price_USD",
                                "Maximum Expandable Memory(GB)" = "Memory_Card_GB"), 
                   multiple = TRUE,
                   options = list(maxItems = 3),
                   width = "100%"
    ) 
  })
  
#-------------------------Model Selector----------------------------------------------------
  output$choose_model <- renderUI({
    #-------Filtering down data to match user inputs---------------------------------------------
    #If statements are neccesary to prevent filtering until the user actually puts in an input.
    #This way it doesn't attempt to filter by empty lists or abnormally small numbers
    #---------------Filter by brand and os---------
    if(length(input$brand) != 0) {
      phone_data <- phone_data[phone_data$brand == input$brand, ]
    }
    if(length(input$os) != 0) {
      phone_data <- phone_data[phone_data$OS %in% input$os, ]
    #----------Filters by Sliders------------------
    }
    if(input$cpu != 0) {
      phone_data <- phone_data[phone_data$CPU_GHz >= input$cpu, ]
    }
    if(input$ram != 0) {
      phone_data <- phone_data[phone_data$Ram_GB >= input$ram, ]
    }
    if(input$primary_cam != 0) {
      phone_data <- phone_data[phone_data$Primary_Camera_MP >= input$primary_cam, ]
    }
    if(input$secondary_cam != 0) {
      phone_data <- phone_data[phone_data$Secondary_Camera_MP >= input$secondary_cam, ]
    }
    #----------Filters by checkboxes--------------
    if (input$bluetooth == TRUE) {
      phone_data <- phone_data[phone_data$bluetooth == "Yes",]
    }
    if (input$gps == TRUE) {
      phone_data <- phone_data[phone_data$GPS == "Yes",]
    }
    if (input$nfc == TRUE) {
      phone_data <- phone_data[phone_data$NFC == "Yes",]
    }
    if (input$audiojack == TRUE) {
      phone_data <- phone_data[phone_data$audio_jack == "Yes",]
    }
    if (input$loudspeaker == TRUE) {
      phone_data <- phone_data[phone_data$loud_speaker == "Yes",]
    }
    #--------Filter to where comparable specs exist-------------------
    #Makes it so users can't try to plot phones with Unknown data
    for(i in input$specs) {  
      phone_data <- phone_data %>% 
        filter(!is.na(eval(parse(text = i))))
    }
    
    #Users select phone models to compare by here
    #Available models are filtered by the users preferences
    selectizeInput("model", "Model:",
                   choices  = phone_data$model,
                   multiple = TRUE,
                   options = list(maxItems = 3),
                   width = "100%"
    )
  })
  
  #Creates plots of requested specs for requested models
  output$plot1 <- renderPlot({
      GraphIT(input$model, input$specs)
    })
  
  #Creates table of all information relevant to the requested phone models
  output$table = renderTable(rownames = TRUE, {
    PlotTable(input$model) 
  })
  
})
  
  


  


