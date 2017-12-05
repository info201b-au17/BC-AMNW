library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)

data <- read.csv("../data/college-majors/all-ages.csv")

function(input, output, session) {
  
  
  output$plot1 <- renderPlot({

    filterData <- data %>% filter(Major_category == input$Categories)
    dataSet <- filterData[, c("Major", input$Type)]

    plot1 <- ggplot(dataSet, aes(x=dataSet[,1], y=dataSet[,2])) + 
      geom_histogram(stat = "identity", fill = "Red") + labs(title = "", y = input$Type, x = input$Categories)

    plot(plot1)
  })
  
}