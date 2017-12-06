library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(stringr)
library(scales)
source("common.R")
data <- read.csv("../data/college-majors/all-ages.csv")

function(input, output, session) {
  
  output$plot1 <- renderPlot({
    
    filterData <- data %>% filter(Major_category == input$Categories)
    dataSet <- filterData[, c("Major", input$Type)]

    plot1 <- ggplot(dataSet, aes(x=dataSet[,1], y=dataSet[,2])) + 
      geom_histogram(stat = "identity", fill = sample(rainbow(100), 1)) + labs(title = "", y = input$Type, x = input$Categories) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 15),
            axis.text.y = element_text(size = 15), plot.margin = unit(c(1,1,1,3), "cm"),
            axis.title.x = element_text(size = 20),
            axis.title.y = element_text(size = 20))
    
    plot(plot1)
  })
    

  output$plot2 <- renderPlot({
      
      plot(graphCategory(filterByMajorName(data, input$Majors), input$TypeTwo, input$TypeTwo))
  })
  
  
  output$boxes <- renderUI({column(3, wellPanel(
           checkboxGroupInput("Majors", label = h3("Majors"), 
           choices = multipleCategoryData(input$CategoriesTwo)$Major, selected = sample(multipleCategoryData(input$CategoriesTwo)$Major, 10, replace = TRUE))))})
}


# width=0.1, position = position_dodge(width=10))