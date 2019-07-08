#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Boston Marathon 2017 Review"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            "Multiple sliders and choices",
            selectInput(inputId = "MarathonData",
                        label = "Choose a dataset:",
                        choices = c("Male", "Female")),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("Plot & Statistics", plotOutput("plot")),
                        tabPanel("Data Table", tableOutput("table"))
            )
        )
    )
))
