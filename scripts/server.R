library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)

data <- read.csv("../data/college-majors/all-ages.csv")

function(input, output, session) {
  
  output$plot1 <- renderPlot({
  
  new.data <- data(input$Categories)
    if(input$Type == "Average Pay") {
      type <- "Median"
    } else {
      type <- "Unemployment_rate"
    }
  
   # filterData <- data %>% filter(Major_category == input$Categories)
  #  dataSet <- filterData[, c("Major", "Total")]
    
    plot1 <- ggplot(new.data, aes(x=new.data[,2], y=new.data[,type])) + 
      geom_histogram(stat = "identity", fill = "Red") + labs(title = input$Categories, y = input$Type, x = "")
    
    plot(plot1)
  })
  
}