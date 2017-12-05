library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)

function(input, output, session) {
  
  data <- read.csv("./data/college-majors/all-ages.csv", header = TRUE)
  
  output$plot1 <- renderPlot({
    
    filterData <- data %>% filter(Major_category == input$Categories)
    dataSet <- filterData[, c("Major", "Total")]
    
    plot1 <- ggplot(filterData, aes(x=filterData[,1], y=filterData[,2])) + 
      geom_histogram(stat = "identity", fill = "Red") + labs(title = "", y = Total, x = input$manufacturers)
    
    plot(plot1)
  })
  
}