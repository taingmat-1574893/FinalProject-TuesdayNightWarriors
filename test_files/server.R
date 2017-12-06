library(shiny)

source("../FormatData.R")

shinyServer(function(input, output) {
  #----------------------------------
  # Widget that allows a user to choose the phone brand
  output$choose_brand <- renderUI({
    selectizeInput("brand", "Brand:", choices = phone_data$brand, 
                multiple = TRUE,
                options = list(maxItems = 4))
  })
  #---------------------------------
  # Widget that allows a user to choose the OS
  output$choose_os <- renderUI({
    #filter by brand
    phone_data <- phone_data[phone_data$brand == input$brand, ]
    selectizeInput("os", "OS:",
                   choices = phone_data$OS,
                   multiple = TRUE
    )
  })
  #--------------------------------
  # Sliders
  # Widget that allows a user to choose the CPU
  output$choose_CPU <- renderUI({
        sliderInput("cpu", "Minimun CPU:",
                min = 0,
                max = 3,
                value = 0
    )
  })
  #----------------------------------
  # Widget that allows a user to choose the minimun ram
  output$choose_ram <- renderUI({
        sliderInput("ram", "Minimum RAM (GB):",
                min = 0, 
                max = max(phone_data$Ram_GB, na.rm = T), 
                value = 0
                )
  })
  #---------------------------------
  # Widget that allows a user to choose the minimun primary camera
  output$choose_primary <- renderUI({
        sliderInput("primary_cam", "Minimun Primary Camera",
                min = 0, 
                max = 20,
                value = 0
    )
  })
  #----------------------------------
  # Widget that allows a user to choose the minimun secondary camera
  output$choose_secondary<- renderUI({
        sliderInput("secondary_cam", "Minimun Secondary Camera",
                min = 0,
                max = 20,
                value = 0
    )
  })
  #-----------------------------------
  # Widget that allows a user to choose the internal memory
  output$choose_intmem<- renderUI({
    sliderInput("internalmem", "Internal Memory:",
                min = 0,
                max = 128,
                value = 0
    )
  })
  #-----------------------------------
  # boolean checks
  # A group of check boxes that allows a user choose the 
  output$choose_features <- renderUI({
    tagList(
      checkboxInput("bluetooth", "Bluetooth:", value = FALSE),
      checkboxInput("gps", "GPS:", value = FALSE),
      checkboxInput("nfc", "NFC:", value = FALSE),
      checkboxInput("audiojack", "Audio_jack:", value = FALSE),
      checkboxInput("loudspeaker", "Loud speaker:", value = FALSE)
      )
  })
  #----------------------------------
  output$compare_by <- renderUI({
    selectizeInput("specs", "Compare By:",
                   choices  = c("RAM" = "Ram_GB", 
                                "Expandable_Memory" = "Memory_Card_GB", 
                                "Internal Memory" = "Internal_Memory",
                                "Display_Size" = "Display_size", 
                                "Primary_Camera" = "Primary_Camera_MP", 
                                "Secondary_Camera" = "Secondary_Camera_MP", 
                                "Battery" = "Battery_MPH",
                                "CPU" = "CPU_GHz", 
                                "Approx_Price" = "approx_price_USD"),
                   multiple = TRUE,
                   options = list(maxItems = 3)
    ) 
  })
  
  output$choose_model <- renderUI({
    if(length(input$brand) != 0) {
      phone_data <- phone_data[phone_data$brand == input$brand, ]
    }
    if(length(input$os) != 0) {
      phone_data <- phone_data[phone_data$OS %in% input$os, ]
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
    # if(input$expandable_memory != 0) {
    #   phone_data <- phone_data[phone_data$Memory_Card_GB >= input$expandable_memory, ]
    # }
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
    #filter to where compareable specs exist
    for(i in input$specs) {  
      phone_data <- phone_data %>% 
        filter(!is.na(eval(parse(text = i))))
    }
    
    for(i in list_example) {  
      if(!is.na(i)){
        a <- a + 1
      }
    }
    # filter by model
    selectizeInput("model", "Model:",
                   choices  = phone_data$model,
                   multiple = TRUE,
                   options = list(maxItems = 3)
    ) 
  })
  #------------------------------------
 
})