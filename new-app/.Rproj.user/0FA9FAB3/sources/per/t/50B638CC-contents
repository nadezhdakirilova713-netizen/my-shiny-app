library(shiny)

ui <- fluidPage(
  titlePanel("Explore a dataset"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "dataset",
        "Choose a dataset:",
        choices = c("rock", "pressure", "cars", "I want to use my data!" = "mydata")
      ),
      conditionalPanel(condition = "input.dataset == 'mydata'", 
                       fileInput("file", "Upload a csv", accept = ".csv"),
                       radioButtons("sep", "Column sep", choices = c(',', ';'))),
      actionButton("load", "Load dataset"),
      hr(),
      uiOutput("x_ui"),   # NEW: empty slot, the server will put a selectInput here
      uiOutput("y_ui"),    # NEW
      conditionalPanel("input.load != 0",
                     actionButton('analyze', 'analysis')),
    
    ),
    mainPanel(
      plotOutput('myPlot'),
      verbatimTextOutput("mySummary")
    )
  )
)
