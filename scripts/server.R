library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(stringr)
library(scales)

data <- read.csv("../data/college-majors/all-ages.csv")

function(input, output, session) {
  
  
  output$plot1 <- renderPlot({
    
    filterData <- data %>% filter(Major_category == input$Categories)
    dataSet <- filterData[, c("Major", input$Type)]

    plot1 <- ggplot(dataSet, aes(x=dataSet[,1], y=dataSet[,2])) + 
      geom_histogram(stat = "identity", fill = "Red") + labs(title = "", y = input$Type, x = input$Categories) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
    
    plot(plot1)
    
    
    ### break

    output$ui <- renderPrint({
      print(input$checkGroup)
      for(box in input$checkGroup) {
        checkboxData <- data %>% filter(Major_category == box)
        for(row in checkboxData) {
          subchoices = c(subchoices, row)
        }
      }

    })
    
  })
}


# width=0.1, position = position_dodge(width=10))