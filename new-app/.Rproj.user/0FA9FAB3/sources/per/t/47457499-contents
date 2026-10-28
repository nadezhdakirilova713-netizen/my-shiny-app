library(shiny)

server <- function(input, output, session) {
  
  # 1. LOAD THE DATASET
  dataInput <- eventReactive(input$load, {
    switch(input$dataset,    #switch() shenevr we change the data
           rock = rock,
           pressure = pressure,
           cars = cars,
           mydata = {
             req(input$file)
             read.csv(input$file$datapath,
                      sep = input$sep)
           })
  })
  
  # 2. VARIABLE NAMES (NEW)
  vars <- reactive({
    names(dataInput())
  })
  
  # 3. DYNAMIC UI (NEW): the choices depend on the loaded data
  output$x_ui <- renderUI({
    selectInput("x", "X variable:",
                choices = vars(),
                selected = vars()[1])
  })
  
  output$y_ui <- renderUI({
    selectInput("y", "Y variable:",
                choices = vars(), #vars is a vector
                selected = vars()[min(2, length(vars()))])
  })
  
  newData = eventReactive(input$analyze, {
    df = dataInput()
      df = df[,c(input$x, input$y)]
    
  })
  
  output$myPlot <- renderPlot({
    df = newData() #my dataset s koloni
    x = df[,input$x]
    y = df[,input$y]
    if (is.character(x) | is.factor(x)) {
       boxplot(y~x,
         xlab=input$x, ylab=input$y,
         col = rainbow(lenght(unique(x))))
    } else {
      plot(y~x,
           xlab=input$x, ylab=input$y, 
           col=rainbow(nrow(df)))}
  })
  
  output$mySummary = renderPrint({
    df = dataInput()
    summary(df)
  })
}
