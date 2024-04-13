library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      video {
        display: block;
        margin: 0 auto;
      }
    "))
  ),
  tags$video(src = "videos\\Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE, width = "100%", height = "750px")
)

server <- function(input, output, session) {
  addResourcePath(prefix = "videos", directoryPath = "C:\\Users\\rsaqu\\Downloads")
}

shinyApp(ui, server)


