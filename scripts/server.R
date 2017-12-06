library(shiny)
library(rsconnect)
library(dplyr)
library(ggplot2)
library(stringr)
library(scales)
source("common.R")
function(input, output, session) {
  
  output$plot1 <- renderPlot({
    
    filterData <- category.data(input$Categories)
    dataSet <- filterData[, c("Major", input$Type)]
    if(input$Type == "Median") {
      data.type <- "Average Pay"
    } else {
      data.type <- "Unemployment Rate"
    }
    plot1 <- ggplot(dataSet, aes(x=dataSet[,1], y=dataSet[,2])) + 

      geom_histogram(stat = "identity", fill = sample(rainbow(100), 1)) + labs(title = paste0(input$Categories, " Majors ", data.type), y = data.type, x = input$Categories) + 
      theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1, size = 15),
            axis.text.y = element_text(size = 15), plot.margin = unit(c(1,1,1,3), "cm"),
            axis.title.x = element_text(size = 20),
            axis.title.y = element_text(size = 20))
    plot(plot1)
  })
  output$info <- renderText({
    xy_str <- function(e) {
      data.set <- major.category(input$Categories)
      if(is.null(e)) return("Click Graph for Category Averages")
      paste0("\nAverage Pay = $", data.set[,2], 
             "\nAverage Unemployment Rate =", 
             data.set[,3]* 100, "%", "\n",
             "Averages For ALL Categories :\nAverage Pay = $", 
             agg.majors.pay.unrate$average.pay, "\nAverage Unemployment Rate =", 
             agg.majors.pay.unrate$average.unemployment.rate * 100, "%")
    }
    paste0(
      input$Categories, ": ", xy_str(input$plot_click)
    )
  })

  output$plot2 <- renderPlot({
      
      plot(graphCategory(filterByMajorName(data, input$Majors), input$TypeTwo, input$TypeTwo))
  })
  
  
  output$boxes <- renderUI({column(3, wellPanel(
           checkboxGroupInput("Majors", label = h3("Majors"), 
           choices = multipleCategoryData(input$CategoriesTwo)$Major, selected = sample(multipleCategoryData(input$CategoriesTwo)$Major, 10, replace = TRUE))))})
}
