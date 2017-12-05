#Neccesary Libraries
library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(scales)

source("FormatData.R")

#Data setup
phone_data <- read.csv("Data/phone_dataset.csv", quote = "", row.names = NULL, stringsAsFactors = FALSE)

#Start of Shiny Server 
shinyServer(function(input, output) {
  output$phone_data <- renderDataTable({
    phone_data %>%
      filter(input$os %in% OS)
  })
  
plot <- ggplot(phone_data, aes(x=phone_data$cloudMobile.S500, y=phone_data$Ram_GB)) + 
  scale_y_continuous(breaks=pretty_breaks(n=5)) +
  labs(x = "Model",y = "Stats",title = "Phone Stats")
