#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Boston Marathon 2017 Review"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            #Input Selector for Sex
            selectInput(inputId = "Gender",
                        label = "Choose a gender:",
                        choices = c("male", "female", "both")),
            
        
            #Age group
            sliderInput(inputId = "ageGroup",
                        label = "Age group:",
                        min = 1,
                        max = 80,
                        value = c(10,30)),
            
            #Country
            uiOutput("countrySlider"),
            #Country
            uiOutput("stateSlider")
            
            
        ),
        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Plot & Statistics", tableOutput("view"),
                                 
                                 
                                 textOutput("finisher"),
                                 plotlyOutput("top10plot")#,
                                 #plotlyOutput("plotCountries"),
                                 #plotlyOutput("plotStates")
                                
                                 ),
                        tabPanel("Dataset", DT::dataTableOutput("table"))
            )
        )
    )
))
