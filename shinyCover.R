library(shiny)

ui <- fluidPage(
  tags$head(
    # adjusts page to browser window
    tags$style(HTML("
      #page-turn {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
      }
      #page {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-image: url('page.png'); /* Replace 'page.png' with your page image */
        background-size: cover;
        transition: transform 1s ease-in-out;
      }
      .turning {
        transform: rotateY(-180deg);
      }
    "))
  ),
  div(id = "page-turn",
      tags$video(src = "videos\\Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE, width = "100%", height = "100%"),
      div(id = "page")
  )
)

server <- function(input, output, session) {
  addResourcePath(prefix = "videos", directoryPath = "C:/Users/rsaqu/Downloads")
}

shinyApp(ui, server)


