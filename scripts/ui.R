library(shiny)
library(rsconnect)
source("common.R")

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
                        plotOutput("plot1", click = "plot_click"), verbatimTextOutput("info")
                      )
                    )
           ),
           tabPanel("Comparsion",
                    sidebarPanel(
                      selectInput("TypeTwo", label = h3("Graph Type:"),
                                  choices = selectGraph),
                      checkboxGroupInput("CategoriesTwo", label = h3("Major Category:"),
                                         choices = MajorCategory, selected = "Agriculture & Natural Resources")
                    ),
                    mainPanel(
                      plotOutput("plot2")
                    ),
                    fluidPage(
                      titlePanel("Choose your Majors"),
                      fluidRow(
                        column(3, wellPanel(
                          # This outputs the dynamic UI component
                          uiOutput("boxes")
                        ))
                      )
                    )
           )
)