#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinydashboard)
library(shinyjs)

# #Data setup
source("FormatData.R")
#phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

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
        
        #Brand(done)
        selectizeInput("brand_list", "Brand:", choices = phone_data$brand,
        multiple = TRUE,
        options = list(maxItems = 4)
        ), 
        
        useShinyjs(),
        #display_type(done)(subject to removal)
        selectizeInput("display_type", "Display type:", choices = phone_data$display_type,
                       multiple = TRUE,
                       options = list(maxItems = 4)
        ),
        
        #os(ok for now)
        selectizeInput("os", "OS:", choices = list("Apple", "Android", "Windows", "Other"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ), 
        
        #sim
        selectizeInput("sim", "Sim:", choices = list("Micro", "Nano", "Mini", "Single", "Dual", "Triple"),
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")
        ),
        
        #bluetooth
        selectizeInput("bluetooth", "Bluetooth", choices = phone_data$bluetooth,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        
        #USB
        selectizeInput("usb", "USB", choices = phone_data$USB,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        
        #Expandable memory up to
        selectizeInput("expandable_memory", "Minimum_Expandable_Memory", choices = phone_data$Memory_Card_GB,
                       multiple = TRUE,
                       options = list(maxItems = 4),
                       selected = list("a", "b", "c")),
        
        #Announce Date
        sliderInput("date", "Announced Date:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        
        #CPU GHZ(NEEDS FIX IN FORMAT MHZ TO GHZ)
        sliderInput("cpu", "CPU:",
                    min = min(phone_data$CPU_GHz, na.rm=T), 
                    max = max(phone_data$CPU_GHz, na.rm=T),
                    value = c(0, 8)),
        
        #Internal Memory(NEEDS FIX IN FORMAT)
        sliderInput("internalmem", "Internal Memory:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        
        #Ram(NEEDS FIX IN FORMAT)
        sliderInput("ram", "Ram:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500)),
        
        #Primary camera in MP
        sliderInput("primarymb", "Primary-MP:",
                    min = min(phone_data$Primary_Camera_MP, na.rm=T), 
                    max = max(phone_data$Primary_Camera_MP, na.rm=T),
                    value = c(min(phone_data$Primary_Camera_MP, na.rm=T), max(phone_data$Primary_Camera_MP, na.rm=T))),
        
        #Secondary camera in MP
        sliderInput("secondarymb", "Secondary-MP:",
                    min = min(phone_data$Secondry_Camera_MP, na.rm=T), 
                    max = max(phone_data$Secondry_Camera_MP, na.rm=T),
                    value = c(min(phone_data$Secondry_Camera_MP, na.rm=T), max(phone_data$Secondry_Camera_MP, na.rm=T))),
        
        #Approcimate Price in USD
        sliderInput("price", "Approx. Price:",
                    min = 1, max = 1000, # change to dates
                    value = c(200,500))
      
     ),
     
     dashboardBody(
        p("this is the main panel"),    
        selectizeInput("model_list", "model", choices = phone_data$model,
                       multiple = TRUE,
                       options = list(maxItems = 4)
        ),
        uiOutput("ui"),
        selectizeInput("spec_list", "Specs to compare by", choices = colnames(phone_data),
                       multiple = TRUE,
                       options = list(maxItems = 4)
        )
        #actionButton("showSidebar", "Show sidebar"),
        #actionButton("hideSidebar", "Hide sidebar")
      )
    )
  )
)


#shinyApp(ui, server)