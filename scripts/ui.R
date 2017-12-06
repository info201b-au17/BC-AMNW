library(shiny)
library(rsconnect)
source("common.R")


navbarPage("Data on Majors!",
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
                    ),
                    
                    tags$hr(),
                    
                    includeCSS("styles.css"),

                    tags$h1("The Inner Workings"),
                    tags$p("In this graph, the user is allowed to explore the fields of study. The user is then able
                            to choose the unemployment rate of the majors in the field, or the median pay of each major within the field.
                            This is to allow the user to first get a grasp of what the rate of unemployment and median pay are as those are
                            as those two subjects are often what leads students to partake in a certain major."),
                    tags$h2("Directions"),
                    tags$p("1. Choose a Field of Study"),
                    tags$p("2. Choose a Graph Type (Unemployment vs Median Pay)")
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
                        column(3,
                          # This outputs the dynamic UI component
                          uiOutput("boxes")
                        )
                    ),
                    tags$hr(),
                    
                    includeCSS("styles.css"),
                    tags$h1("The Inner Workings"),
                    tags$p("In this graph, the user is allowed to explore the various majors associated to each field. The are 
                            directly able to choose which major they are interested in for a certain field and continously mount
                            or dismount the majors that are being looked at. This graph offers greater customization and even colors
                            which majors belong to which fields."),
                    tags$h2("Directions"),
                    tags$p("1. Choose which Fields of Study You Want to Look at"),
                    tags$p("2. Choose which Majors in those Fields that You Want to Compare Against")
           )
           
)