
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
 library(ggplot2)
 hdfc_stock$Date <- as.Date(hdfc_stock$Date,"%m/%d/%Y")
 fit <- glm(Close ~ Date,data = hdfc_stock)
 
 fit$pred1 <- reactive({
          
          fit_input <- input$Date1
          predict(fit,newdata=data.frame(Date=fit_input))
  })
  
 fit$pred2 <- reactive({
         
         fit_input <- input$Date2
         predict(fit,newdata=data.frame(Date=fit_input))
 })
  output$text1 <- renderText({
          fit$pred1()
  })
  
  output$plot1 <- renderPlot({
          ggplot(hdfc_stock,aes(Date,Close)) +  geom_line() + geom_smooth(method = "glm",formula = y ~ x)
  })
  
  output$text2 <- renderText({
          (fit$pred1() - fit$pred2()) * input$input1
  })
})

