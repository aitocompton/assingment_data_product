library(shiny)
library(datasets)
library(ggplot2)


eu<-as.data.frame(EuStockMarkets)

shinyServer(
  function(input, output){
      output$newPlot <- renderPlot({
        index <- input$id1
        euIndex <- {unlist(eu[input$id1])}
        euPct <- diff(euIndex)/euIndex[-length(euIndex)]*100

        hist(euPct, col = "blue", 
            main = paste("The Daily Percentage Change of ",input$id1),
            freq = F, xlab = "Percentage", breaks=input$obs)
        })
        
    output$summary <- renderPrint({
      euMat <- cor(sapply(eu , function(x) diff(x)/x[-length(x)]))
      summary(euMat)
    })
    
    output$corr <- renderPlot({
       euMat <- cor(sapply(eu , function(x) diff(x)/x[-length(x)]))
       corrplot(euMat, method ="number")
    })
})
    
