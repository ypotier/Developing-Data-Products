#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(here)
library(plotly)
library(plyr)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Read CSV into R
    bm2017=here::here("marathon_results_2017.csv")
    dataset <- read.csv(bm2017, header=TRUE, sep=",")
    
    output$table <- DT::renderDataTable(DT::datatable({
        dataset
    }))
    
    countries <- sort(unique(dataset$Country))
    output$countrySlider <- renderUI({
        # Widget for selecting the variable among names of columns of the data set
        selectInput("select.variable", label = h4("Select the country:"),
                    choices = (countries))
        
    })
    
    states <- sort(unique(dataset$State))
    output$stateSlider <- renderUI({
        # Widget for selecting the variable among names of columns of the data set
        selectInput("select.variable", label = h4("Select the state:"),
                    choices = (states))
        
    })
    
    # General stats ()
    TotalFinisher = max(dataset$Overall)
    output$finisher <- renderText({
        paste("The number of finisher is ", TotalFinisher)
    })
    
    top10 <- head(dataset,10)
    output$top10plot <- renderPlotly({
        plot_ly(top10, x = ~Official.Time, y = ~Overall,text = ~Name, type = 'bar', orientation = 'h', showlegend = FALSE)  %>%
            layout(title = 'Top 10 Finishers', 
               xaxis = list(),
               yaxis = list(text = ~Name))
    })
    
    
    allCountries = count(dataset,'Country')
    
    output$plotCountries <- renderPlotly({
        plot_ly(allCountries, labels = ~Country, values = ~freq, type = 'pie')  %>%
            layout(title = 'Finishers by Country', 
                   xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                   yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    })
    
    datasetUSOnly <- dataset
    allStates = count(datasetUSOnly,'State')
    
    output$plotStates <- renderPlotly({
        plot_ly(allStates, labels = ~State, values = ~freq, type = 'pie')  %>%
            layout(title = 'Finishers by State', 
                   xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                   yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
    })

})
