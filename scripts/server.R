library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)

attach(data)

function(input, output, session) {
  
  output$plot1 <- renderPlot({
    
  new.data <- category.data(input$Categories)
    if(input$Type == "Average Pay") {
      type <- "Median"
    } else {
      type <- "Unemployment_rate"
    }
    
   # filterData <- data %>% filter(Major_category == input$Categories)
  #  dataSet <- filterData[, c("Major", "Total")]
    
    plot1 <- ggplot(new.data, aes(x=new.data[,2], y=new.data[,type])) + 
      geom_histogram(stat = "identity", fill = "Red") + labs(title = "", y = input$Type, x = "")
    
    plot(plot1)
  })
  
}