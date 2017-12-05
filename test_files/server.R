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
  output$choose_displaytype <- renderUI({
    
    #filter by brand
    #data_sets <- data_sets[data_sets$brand == input$brand, ]
    
    selectizeInput("displaytype", "Display Type:",
                   choices = data_sets$display_type,
                   multiple = TRUE
    )
    
  })
  #----------------------------------
  output$choose_model <- renderUI({
    data_sets <- data_sets[data_sets$display_type == input$displaytype, ]
    # filter by model
    selectizeInput("model", "Model:",
                   choices  = data_sets$model,
                   multiple = TRUE,
                   options = list(maxItems = 4)
    ) 
  })
})