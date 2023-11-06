
library(shiny)

# Define the user interface
fluidPage(
  titlePanel("Plot Manipulation Shiny App"),
  sidebarLayout(
    sidebarPanel(
      # Input widget: Select input with options
      selectInput("plotType", "Select a Plot Type:", 
                  choices = c("Scatterplot", "Barplot")),
      sliderInput("numPoints", "Number of Data Points:", min = 10, max = 100, value = 50),
      actionButton("updatePlot", "Update Plot")
    ),
    mainPanel(
      # Output: Plot
      plotOutput("outputPlot")
    )
  )
)