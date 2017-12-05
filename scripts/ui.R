library(shiny)
library(rsconnect)

navbarPage("Major Category VS Stuff!",
           tabPanel("Plot",
                    sidebarLayout(
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
           ),
           tabPanel("Summary",
                    verbatimTextOutput("summary")
           )
)
