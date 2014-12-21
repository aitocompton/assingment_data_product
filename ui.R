library(shiny)
library(corrplot)


shinyUI(pageWithSidebar(
  headerPanel("Euro Stock"),
  sidebarPanel(
    
#     checkboxInput("corMat","Correlation Matrix: ",value=T),
    selectInput("id1","Index:",c("DAX","SMI","CAC","FTSE")),
#     checkboxInput("hist","Histogram: "),
    sliderInput("obs", "Number of observations:",  
                min = 1, max = 70, value = 20)
#     checkboxInput("plot","Plot: make simple plot")
    #textOutput("inputValue")
#     h5("Correlation Matrix"),
#     verbatimTextOutput("inputValue"),
      
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("newPlot")), 
      tabPanel("Summary", verbatimTextOutput("summary")),
      tabPanel("Correlation", plotOutput("corr"))
    )
  )
))