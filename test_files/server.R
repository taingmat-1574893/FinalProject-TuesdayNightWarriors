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
                min = min(phone_data$CPU_GHz, na.rm=T), 
                max = max(phone_data$CPU_GHz, na.rm=T),
                value = min(phone_data$CPU_GHz, na.rm=T))
  })
  #----------------------------------
  output$choose_ram <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("ram", "Minimum RAM (GB):",
                min = min(phone_data$Ram_GB, na.rm = T), 
                max = max(phone_data$Ram_GB, na.rm = T), 
                value = min(phone_data$Ram_GB, na.rm = T)
                )
  })
  #----------------------------------
  output$choose_mem <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    selectInput("expandable_memory", "Minimum Expandable Memory",
                 choices = phone_data$Memory_Card_GB,
                 selected = 0
                )

  })
  #---------------------------------
  output$choose_primary <- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("primary_cam", "Minimun Primary Camera",
                min = 0, 
                max = max(phone_data$Primary_Camera_MP, na.rm=T),
                value = 0
    )
  })
  #----------------------------------
  output$choose_secondary<- renderUI({
    
    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("secondary_cam", "Minimun Secondary Camera",
                min = min(phone_data$Secondary_Camera_MP, na.rm=T), 
                max = max(phone_data$Secondary_Camera_MP, na.rm=T),
                value = min(phone_data$Secondary_Camera_MP, na.rm=T)
    )
  })
  #-----------------------------------
  output$choose_intmem<- renderUI({

    #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
    sliderInput("internalmem", "Internal Memory:",
                min = min(phone_data$Internal_Memory, na.rm=T),
                max = max(phone_data$Internal_Memory, na.rm=T),
                value = 1
                            
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
  output$choose_model <- renderUI({
    if(length(input$brand) != 0) {
      phone_data <- phone_data[phone_data$brand == input$brand, ]
    }
    if(length(input$os) != 0) {
      phone_data <- phone_data[phone_data$OS %in% input$os, ]
    }
    phone_data <- phone_data[phone_data$CPU_GHz >= input$cpu, ]
    phone_data <- phone_data[phone_data$Ram_GB >= input$ram, ]
    phone_data <- phone_data[phone_data$Primary_Camera_MP >= input$primary_cam, ]
    phone_data <- phone_data[phone_data$Secondary_Camera_MP >= input$secondary_cam, ]
    
    #if (input$bluetooth == TRUE) {
    #  phone_data <- phone_data[phone_data$bluetooth == "Yes",]
    #}
    
   # phone_data <- phone_data[phone_data$ == "Yes",]
    #phone_data <- phone_data[phone_data$bluetooth == "Yes",]
    
    
    # filter by model
    selectizeInput("model", "Model:",
                   choices  = phone_data$model,
                   multiple = TRUE
                   #options = list(maxItems = 3)
    ) 
  })
  #------------------------------------
 
})