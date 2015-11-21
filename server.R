library(shiny)
data <- read.csv("Sales.csv")

shinyServer(function(input, output) {

  output$plot <- renderPlot({
    
    plotdata <- subset(data, (Country == input$Country & (Product == input$Product)))

    barplot(plotdata$Sales, names.arg = plotdata$Date, col = "green", main = input$Product, ylab = "Sales", xlab = "Month/Year" )

  })

})