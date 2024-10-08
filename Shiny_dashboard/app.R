# Libraries
library(shiny)
library(plotly)

# UI
ui <- fluidPage(
    titlePanel("Shiny Plotly Dashboard"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("num", "Number of Points:", min = 1, max = 100, value = 50)
        ),
        mainPanel(
            plotlyOutput("scatterPlot")
        )
    )
)


# Server
server <- function(input, output) {
    output$scatterPlot <- renderPlotly({
        # Generate random data
        data <- data.frame(x = rnorm(input$num), y = rnorm(input$num))
        plot_ly(data, x = ~x, y = ~y, type = 'scatter', mode = 'markers')
    })
}

# ShinyApp
shinyApp(ui = ui, server = server)
