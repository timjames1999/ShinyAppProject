library(shiny)

# Define the server logic
function(input, output) {
  # Create a reactive data frame to store the data for the plot
  data <- reactive({
    num_points <- input$numPoints
    if (input$plotType == "Scatterplot") {
      data <- data.frame(x = rnorm(num_points), y = rnorm(num_points))
    } else {
      data <- data.frame(category = LETTERS[1:num_points], value = runif(num_points))
    }
    data
  })
  
  # Render the plot based on user input
  output$outputPlot <- renderPlot({
    if (input$plotType == "Scatterplot") {
      plot(data()$x, data()$y, main = "Scatterplot", xlab = "X-axis", ylab = "Y-axis")
    } else {
      barplot(data()$value, names.arg = data()$category, main = "Barplot")
    }
  })
  
  # Add an observer to update the plot when the button is clicked
  observeEvent(input$updatePlot, {
    output$outputPlot <- renderPlot({
      if (input$plotType == "Scatterplot") {
        plot(data()$x, data()$y, main = "Scatterplot", xlab = "X-axis", ylab = "Y-axis")
      } else {
        barplot(data()$value, names.arg = data()$category, main = "Barplot")
      }
    })
  })
}