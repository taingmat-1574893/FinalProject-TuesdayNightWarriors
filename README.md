# Project Description:

SHINY APP LINK: https://taingmat.shinyapps.io/FinalProject-TuesdayNightWarriors/


For our final project we'll be making an interactive set of charts which compare specifications between different models of smartphones. The dataset of smartphone specifications is scraped from the website GSMArena by the user Arwin Neil Baichoo, and can be found on Kaggle. A limitation our dataset faces is that it hasn't been updated in 5 months, and given the rapid pace at which technology changes, it is possible the data has long been outdated.

Our target audience people looking to compare phones, be it to replace their own or simply to understand what the market is offering. To make an educated purchase, it is important for consumers to have access to detailed comparisons between different models of smartphones. Hopefully, our App would allow for users to make the most informed decisions when choosing the phone that best suits them, based on specifications that matter the most to them.

# Technical Description:
The project will take the form of a shiny app, given its suitability as a platform for user interaction and user input. The dataset is already in a .csv format, and will be passed into R using the read.csv() function.

To allow for a more comparable format, we'll need to reformat data set's columns to contain either numbers or booleans if applicable. For example, the current column 'internal ram' is recorded as the string "16 GB"", but we'd prefer it to be stored as the number "16". In addition to that, some columns store multiple values in a single cell. For example, the 'primary_camera' column contains some values containing a single value in megapixels, while others include information about flash and autofocus capabilities.

A possible challenge we might face along the way, would be the prioritising and formatting of the various specifications users can compare the phones by. To overcome this, it would be necessary to understand the context of the phone market (for example: the latest specifications marketed by Phone manufacturers, and how well these specifications are received by the consumer base). In addition to that, we would have to understand what the primary determining factors are, when it comes to choosing phones. 


# Issues:
Shiny Server(Matt)
Function that creates a ranking system for different specs(Matt)
Shiny UI(Kyra)
Reformat data table(Mickey)
Function that compares individual phones(Mickey)
Function that creates charts(Gideon)


Phone Data: https://www.kaggle.com/arwinneil/gsmarena-phone-dataset/version/1
GSM Arena: https://www.gsmarena.com/
