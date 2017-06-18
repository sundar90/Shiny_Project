
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("HDFC Bank Share Price Predictor(in INR Currency)"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      dateInput('Date1',
                value = Sys.Date(),
                  "Forecast Date(Date for which you want the estimated stock Price):",
                  min = NULL,
                  max = NULL,
                 startview = "month", weekstart = 0,
                language = "en", width = NULL),
      dateInput('Date2',
                value = Sys.Date(),
                "Date of Purchase:",
                min = NULL,
                max = Sys.Date(),
                startview = "month", weekstart = 0,
                language = "en", width = NULL),
      numericInput('input1',"No of Stocks",value=100)
    ),
    

    # Show a plot of the generated distribution
    mainPanel(
      h3("Historic Performance Graph:"),
      plotOutput('plot1'),
      h3("Estimated Stock Price for Forecast Date:"),
      textOutput('text1'),
      h3("Estimated Profit as on Forecast Date(for the no of stocks entered and Purchase Date):"),
      textOutput("text2")
    )
  )
))
