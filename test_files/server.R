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
  #--------------------------------
  # Sliders
  output$choose_CPU <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("cpu", "Minimun CPU:",
                min = 0,
                max = 3,
                value = 0
    )
  })
  #----------------------------------
  output$choose_ram <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("ram", "Minimum RAM (GB):",
                min = 0, 
                max = max(phone_data$Ram_GB, na.rm = T), 
                value = 0
                )
  })
  #----------------------------------
  # output$choose_mem <- renderUI({
  #   
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    # selectInput("expandable_memory", "Minimum Expandable Memory",
    #              choices = phone_data$Memory_Card_GB,
    #              selected = 0
    #             )
  #   sliderInput("expandable_memory", "Minimum Expandable Memory",
  #               min = 0, 
  #               max = 128,
  #               value = 0
  #   )
  # })
  #---------------------------------
  output$choose_primary <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("primary_cam", "Minimun Primary Camera",
                min = 0, 
                max = 20,
                value = 0
    )
  })
  #----------------------------------
  output$choose_secondary<- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("secondary_cam", "Minimun Secondary Camera",
                min = 0,
                max = 20,
                value = 0
    )
  })
  #-----------------------------------
  output$choose_intmem<- renderUI({

    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("internalmem", "Internal Memory:",
                min = 0,
                max = 128,
                value = 0
                            
    )
  })
  #-----------------------------------
  # boolean checksss
  
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