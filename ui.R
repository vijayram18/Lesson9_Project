library(shiny)
data <- read.csv("Sales.csv")
country_list <- levels(data$Country)
product_list <-levels(data$Product)

shinyUI(fluidPage(
  
  titlePanel("Sales Trends"),  # End of titlePanel
  
  sidebarPanel(
    
    h4("This application shows you Product Sales Trend from Jan 2014"),
    p("Select your country from the drop down list and select Products in the radion buttons below."), 
    p("The plot will show your country sales over time."),

    
    # Dropdown List with Country
    selectInput(inputId = "Country",  
                label = "Select Country:",  
                choices = country_list,  
                selected = country_list[1]),
    
 
    
    # Radio Buttons to select product
    radioButtons(inputId = "Product", label = "Select Products",
                 choices = product_list, 
                 selected = product_list[1])
    
    
  ), # End of sidebarPanel
  
  mainPanel(
  

    # Plot Headcount trend
    
    plotOutput(outputId = "plot", height = "300px")
  
  ) # End of mainPanel
  
))