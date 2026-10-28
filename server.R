library(shiny)

server <- function(input, output, session) {
  data = eventReactive(input$go, {
    switch(input$mySelection,
                          'rock' = rock,
                          'iris'=iris,
                          'pressure'=pressure)
  })
  dataPlot = eventReactive(input$plotHist, {
    df = data()
  })
  output$myTable = renderTable({
    df = data()
    df
  })
  output$myPlot = renderPlot({
    df = data()
    
    if (input$graphSel=="boxplot") {
      boxplot(df[,1], df[,2], names = c(names(df)[1]))
    else
      df[,1], df[,2], pch = input$pchN)
    }
    
    plot(df[,1], df[,2], pch = input$pchN)
    
  })
  output$myHist = renderPlot({
    df = dataPlot()
    hist(df[,1])
  })
 
}