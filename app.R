library(shiny)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=League+Spartan&display=swap');

      body, html, .container, .container-fluid {
        width: 100%;
        height: 750px;
        margin: 0;
        padding: 0;
        position: relative; /* Set position relative for positioning the white box */
      }

      body {
        font-family: 'League Spartan', sans-serif; /* Use the custom font */
        font-size: 26px; /* Adjust the font size as needed */
        background: linear-gradient(to bottom, #B8E2F2, #ede2f0, #ffffff); /* Gradient background */
      }

      video {
        display: block;
        margin: 0 auto;
        width: 100%;
        max-height: 750px;
      }

      .custom-image {
        position: absolute;
        top: 20px;
        right: 20px;
        width: 100px;
        height: auto;
      }

      .white-box {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        /* Set width and height for the white box */
        width: 50%; /* Adjust width as needed */
        height: 80%; /* Adjust height as needed */
        box-sizing: border-box; /* Include padding in the box size */
        border: 2px solid black; /* Border */
      }
      
      .question-box {
        margin-top: 20px;
      }
      
            
    "))
  ),
  div(class = "container-fluid",
      div(id = "page1", style = "display:block;",
          tags$img(src = "images/image.png", class = "custom-image"),
          tags$video(src = "videos/Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE),
          br(),
          actionButton("next_page", "Next Page", style = "margin-top: 20px;")
      ),
      div(id = "page2", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Introduction"),
              p("There is a very interesting psychological background to learning content. Different skills and methods have been scientifically proven to be more beneficial to students when they are learning. In order to increase engagement and enhance the impact of the learning experience, cognitive psychologists Jim Stigler and Ji Son created an online textbook named CourseKata in order to improve statistics learning by examining students’ interactions with online textbooks. This virtual textbook offers the opportunity to look into the actions and choices of thousands of students as they learn statistics. After conducting a thorough analysis, we have come up with a number of suggestions for the CourseKata team surrounding some patterns of engagement and missing features."),
              actionButton("next_page2", "Next Page", style = "margin-top: 40px;"),
              actionButton("back_page2", "Back", style = "margin-top: 40px;")
          )
      ),
      div(id = "graphs_page", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Graphs"),
              p("Content of the Graphs page."),
              actionButton("next_graphs_page", "Next Page", style = "margin-top: 20px;"),
              actionButton("back_graphs_page", "Back", style = "margin-top: 20px;")
          )
      ),
      div(id = "page3", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Sample Questions"),
              p(""),
              actionButton("next_page3", "Next Page", style = "margin-top: 20px; margin-bottom: 20px;"),
              actionButton("back_page1", "Back", style = "margin-top: 20px;margin-bottom: 20px;"),
              p("Match the left items with the corresponding right items:"),
              div(class = "question-box",
                  selectInput("left_items_page3", label = "Left Items:",
                              choices = c("A", "B", "C", "D"),
                              multiple = TRUE),
                  selectInput("right_items_page3", label = "Right Items:",
                              choices = c("1", "2", "3", "4"),
                              multiple = TRUE)
              ),
              actionButton("check_answers_page3", "Check Answers", style = "margin-top: 20px;"),
          )
      ),
      div(id = "page4", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Conclusion"),
              p(""),
              actionButton("back_page3", "Back", style = "margin-top: 20px;")
          )
      )
  ),
  tags$script("
    $(document).ready(function() {
      $('#next_page').click(function() {
        $('#page1').hide();
        $('#page2').show();
      });
      $('#back_page2').click(function() {
        $('#page2').hide();
        $('#page1').show();
      });

      $('#next_page2').click(function() {
        $('#page2').hide();
        $('#graphs_page').show();
      });
      $('#back_graphs_page').click(function() {
        $('#graphs_page').hide();
        $('#page2').show();
      });

      $('#next_graphs_page').click(function() {
        $('#graphs_page').hide();
        $('#page3').show();
      });
      $('#back_page1').click(function() {
        $('#page3').hide();
        $('#graphs_page').show();
      });

      $('#next_page3').click(function() {
        $('#page3').hide();
        $('#page4').show();
      });

      $('#back_page3').click(function() {
        $('#page4').hide();
        $('#page3').show();
      });
    });
  ")
)

server <- function(input, output) {
  observeEvent(input$check_answers_page3, {
    left_selected <- input$left_items_page3
    right_selected <- input$right_items_page3
    
    # Define the correct matching pairs for page 3
    correct_pairs_page3 <- list(A = "1", B = "2", C = "3", D = "4")
    
    # Check if all selections on page 3 are correct
    if (identical(sort(left_selected), names(correct_pairs_page3)) &&
        identical(sort(right_selected), unlist(correct_pairs_page3))) {
      # Display modal dialog for correct answers on page 3
      showModal(modalDialog(
        title = "Results",
        "Correct! All matches on Page 3 are right."
      ))
    } else {
      # Display modal dialog for incorrect answers on page 3
      showModal(modalDialog(
        title = "Results",
        "Incorrect! Some matches on Page 3 are wrong. Please try again."
      ))
    }
  })
}



shinyApp(ui, server = function(input, output) {})

