library(shiny)

ui <- fluidPage(
  fluidRow(
    column(6,selectInput(inputId = "mySelection",            # name used by the server
                              label = h3("Select box"),           # what the user reads
                              choices = c('rock', 'iris', 'pressure'),
                              selected = 1),
           actionButton("go","do smth")),
    column(6, sliderInput('n', h3('My first slider'),
                               min = 1, max = 10, value = 2),
           actionButton('plotHist', "Plot the histogram"),
           numericInput("pchN", "Choose a point", value=21,
                        min = 0, max = 25),
           selectInput(inputId = 'graphSel', label = h3(Select a graph)) )
  ),
  fluidRow(
    column(4, tableOutput("myTable")),
    column(4, plotOutput("myPlot")),
    column(4, plotOutput("myHist"))
    )
  )
    
