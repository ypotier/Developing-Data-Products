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



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    # Read CSV into R
    bm2017=here::here("marathon_results_2017.csv")
    dataset <- read.csv(bm2017, header=TRUE, sep=",")
    
    datasetInput <- reactive({
        switch(input$sex,
               "male" = male,
               "female" = female,
               "both" = both)
    })
    
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
    
    output$table <- renderTable({
        head(datasetInput())
    })

})
