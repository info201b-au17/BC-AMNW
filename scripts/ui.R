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
           tabPanel("Comparsion",
                    fluidPage(
                      titlePanel("Dynamically generated user interface components"),
                      fluidRow(
                        
                        column(3, wellPanel(
                          checkboxGroupInput("checkGroup", label = h3("Checkbox group"), 
                                             choices = MajorCategory)
                        )),
                        column(3, wellPanel(
                          checkboxGroupInput("subchoices", label = h3("Checkboxes"), 
                                             choices = "hi")
                        )),
                        
                        column(3, wellPanel(
                          # This outputs the dynamic UI component
                          uiOutput("ui")
                        ))
                      )
                    )
                    
           )
)
