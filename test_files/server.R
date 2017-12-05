library(shiny)

data_sets <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

shinyServer(function(input, output) {
  #----------------------------------
  output$choose_brand <- renderUI({
    selectizeInput("brand", "Brand:", choices = data_sets$brand, 
                multiple = TRUE,
                options = list(maxItems = 4))
  })
  #---------------------------------
  output$choose_os <- renderUI({
    
    #filter by brand
    data_sets <- data_sets[data_sets$brand == input$brand, ]
    
    selectizeInput("os", "OS:",
                   choices = data_sets$OS,
                   multiple = TRUE
    )
  })
  #----------------------------------
  output$choose_weight <- renderUI({
    data_sets <- data_sets[data_sets$brand == input$brand, ]
    data_sets <- data_sets[data_sets$OS %in% input$os, ]
    #filter by brand
    selectizeInput("weight", "Weight:",
                   choices = data_sets$weight_g,
                   multiple = TRUE
    )
  })
  #---------------------------------
  output$choose_CPU <- renderUI({
    data_sets <- data_sets[data_sets$brand == input$brand, ]
    data_sets <- data_sets[data_sets$OS %in% input$os, ]
    data_sets <- data_sets[data_sets$weight_g %in% input$weight, ]
    #filter by brand
    selectizeInput("cpu", "CPU:",
                   choices = data_sets$Battery_MPH,
                   multiple = TRUE
    )
  })
  #----------------------------------
  output$choose_model <- renderUI({
    data_sets <- data_sets[data_sets$brand == input$brand, ]
    data_sets <- data_sets[data_sets$OS %in% input$os, ]
    #data_sets <- data_sets[data_sets$OS ==, ]
    #data_sets <- data_sets %>% filter(data_sets$OS %>% input$os)
    # filter by model
    selectizeInput("model", "Model:",
                   choices  = data_sets$model,
                   multiple = TRUE,
                   options = list(maxItems = 4)
    ) 
  })
})