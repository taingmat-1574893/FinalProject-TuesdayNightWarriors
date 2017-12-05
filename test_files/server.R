library(shiny)

#phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)
source("../FormatData.R")

shinyServer(function(input, output) {
  #----------------------------------
  output$choose_brand <- renderUI({
    selectizeInput("brand", "Brand:", choices = phone_data$brand, 
                multiple = TRUE,
                options = list(maxItems = 4))
  })
  #---------------------------------
  output$choose_os <- renderUI({
    
    #filter by brand
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    
    selectizeInput("os", "OS:",
                   choices = phone_data$OS,
                   multiple = TRUE
    )
  })
  #----------------------------------
  output$choose_weight <- renderUI({
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    phone_data <- phone_data[phone_data$OS %in% input$os, ]
    #filter by brand
    selectizeInput("weight", "Weight:",
                   choices = phone_data$weight_g,
                   multiple = TRUE
    )
  })
  #---------------------------------
  output$choose_CPU <- renderUI({
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    phone_data <- phone_data[phone_data$OS %in% input$os, ]
    phone_data <- phone_data[phone_data$weight_g %in% input$weight, ]
    #filter by brand
    selectizeInput("cpu", "CPU:",
                   choices = phone_data$CPU_GHz,
                   multiple = TRUE
    )
  })
  #----------------------------------
  output$choose_model <- renderUI({
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    phone_data <- phone_data[phone_data$OS %in% input$os, ]
    phone_data <- phone_data[phone_data$weight_g %in% input$weight, ]
    phone_data <- phone_data[phone_data$CPU_GHz %in% input$cpu, ]
    
    
    #phone_data <- phone_data[phone_data$OS ==, ]
    #phone_data <- phone_data %>% filter(phone_data$OS %>% input$os)
    # filter by model
    selectizeInput("model", "Model:",
                   choices  = phone_data$model,
                   multiple = TRUE,
                   options = list(maxItems = 4)
    ) 
  })
})