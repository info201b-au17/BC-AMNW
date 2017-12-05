library(shiny)
library(rsconnect)

pageWithSidebar(
  titlePanel("Manufacturer & Category"),
  sidebarPanel(
    
    selectInput("Categories", label = h3("Major Category:"),
                choices = MajorCategory),
    
    selectInput("Type", label = h3("Graph Type:"),
                choices = selectGraph)
  ),
  
  mainPanel(
    plotOutput("plot1")
  )
)


