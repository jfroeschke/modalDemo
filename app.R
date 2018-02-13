library(shiny)
library(shinyalert)

ui <- fluidPage(
  useShinyalert(),  # Set up shinyalert
  actionButton("preview", "Preview"),
  textOutput("out")
)

server <- function(input, output, session) {
  observeEvent(input$preview, {
    # Show a modal when the button is pressed
    shinyalert("Oops!", "Something went wrong.", type = "error")
  })
  
  shinyalert(
    "Enter your name", type = "input",
    callbackR = function(x) { message("Hello ", x) },
    callbackJS = "function(x) { alert('Hello ' + x); }"
  )
  
  output$out <- renderText(input$shinyalert)
}

shinyApp(ui, server)
