# Project Description:


For our final project we’ll be making an interactive set of charts which compare specifications between different models of smartphones. The dataset of smartphone specifications is scraped from the website GSMArena by the user Arwin Neil Baichoo, and can be found on Kaggle. A big constraint of our dataset is that it hasn’t been updated in 5 months, and with the rapid pace that technology grows at the data becomes less relevant.

Our target audience is people interested in purchasing a new phone. To make an educated purchase It’s valuable for consumers to have access to detailed comparisons between different models of smartphones. Our visualizations will help answer questions as to which phone is the cheapest, which is the most powerful, and which is the most efficient in it’s overall power compared to its approximate price.

# Technical Description:
The project will take the form of a shiny app as that’s the platform best suited for user interaction and user input. The dataset is already in a csv and will be passed into R using the read.csv() function.

In order to make the data into a more comparable format we’ll need to reformat most columns to contain either numbers or booleans if applicable. For example in the current csv internal ram is recorded as the string “16 GB”, but we’d prefer it to be stored as the number 16. Furthermore some columns allow for multiple values to be recorded in a single cell, the primary_camera column contains some values containing only a value in megapixels where as others also include information about flash and autofocus.

A major challenge that may come up is the need to create a ranking system for different specs, or allow users to select multiple specs that matter to them. We will likely need to take a more holistic approach to evaluating devices than just comparing individual prices.

# Issues:
Shiny Server(Matt)
Function that creates a ranking system for different specs(Matt)
Shiny UI(Kyra)
Reformat data table(Mickey)
Function that compares individual phones(Mickey)
Function that creates charts(Gideon)


Phone Data: https://www.kaggle.com/arwinneil/gsmarena-phone-dataset/version/1
GSM Arena: https://www.gsmarena.com/
