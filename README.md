SHINY APP LINK: https://taingmat.shinyapps.io/FinalProject-TuesdayNightWarriors/

# Purpose
Provide a way for users to compare phone specs visually to make an informed decision before purchasing a new device.

# Project Description:
For our final project we've made an interactive shiny app which allows users to compare specifications between different models of smartphones graphically. The app allows users to filter smartphones down to ones that meet there preferred specs. Then it provides graphs comparing specifications of up to 3 smartphones the user finds interesting in up to 3 different specs. Just in case the user would like to know more about these phones there is a more detailed table about the phone specs beneath the graphs.

Our target audience is people looking to compare phones, be it to replace their own or simply to understand what the market is offering. To make an educated purchase, it is important for consumers to have access to detailed comparisons between different models of smartphones. Hopefully, our App would allow for users to make the most informed decisions when choosing the phone that best suits them, based on specifications that matter the most to them.

# About the Data:
The dataset of smartphone specifications is scraped from the website GSMArena by the user Arwin Neil Baichoo, and can be found on Kaggle. A limitation our dataset faces is that it hasn't been updated in 5 months, and given the rapid pace at which technology changes, it is possible the data has long been outdated.

# Reformatting the Data:
The original dataset was atrocious, failing to follow consistent formatting within columns. Because of this issue with our data we were required to reformat much of our data manually through excel, or reformat it in R to make certain specs Filterable/Comparable. For example, the current column 'internal ram' is recorded as the string "16 GB"", but we'd prefer it to be stored as the number "16". In addition to that, some columns store multiple values in a single cell. For example, the 'primary_camera' column contains some values containing a single value in megapixels, while others include information about flash and autofocus capabilities.

A big part of this project was determining what information consumers are genuinely concerned with, and which ones are worth comparing by. For example we understood that it was worth being able to filter by CPU speed, but unnecessary to allow users to filter by display_type. As most users likely wouldn't understand the differences between the wide array of possible display types.


# Resources:
Phone Data: https://www.kaggle.com/arwinneil/gsmarena-phone-dataset/version/1
GSM Arena: https://www.gsmarena.com/
