library(shiny)
library(shinyjs)

ui <- fluidPage(
  useShinyjs(),  # Initialize shinyjs
  
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
      .logo-container {
        position: absolute;
        top: 40px; /* Adjust this value to move the logo down */
        left: 40px; /* Adjust this value to move the logo right */
      }

      .logo-img {
        width: 50px; /* Adjust the width of your logo */
        height: auto; /* Maintain aspect ratio */
      }
      
    "))
  ),
  div(class = "container-fluid",
      div(id = "page1", style = "display:block;",
          tags$video(src = "videos\\Purple animated tech festival promo instagram post.mp4", type = "video/mp4", controls = TRUE),
          br(),
          actionButton("next_page", "Next Page", style = "margin-top: 20px;")
      ),
      div(id = "page2", style = "display:none;",
          div(class = "white-box",
              h2("Introduction"),
              p("There is a very interesting psychological background to learning content. Different skills and methods have been scientifically proven to be more beneficial to students when they are learning. In order to increase engagement and enhance the impact of the learning experience, cognitive psychologists Jim Stigler and Ji Son created an online textbook named CourseKata in order to improve statistics learning by examining students’ interactions with online textbooks. This virtual textbook offers the opportunity to look into the actions and choices of thousands of students as they learn statistics. After conducting a thorough analysis, we have come up with a number of suggestions for the CourseKata team surrounding some patterns of engagement and missing features."),
              actionButton("next_page2", "Next Page", style = "margin-top: 40px;"),
              actionButton("back_page2", "Back", style = "margin-top: 40px;")
          )
      ),
      div(id = "page3", style = "display:none;",
          div(class = "white-box",
              h2("Analysis"),
              p(""),
              actionButton("next_page3", "Next Page", style = "margin-top: 20px;"),
              actionButton("back_page1", "Back", style = "margin-top: 20px;")
          )
      ),
      div(id = "page4", style = "display:none;",
          div(class = "white-box",
              h2("Conclusion"),
              p(""),
              actionButton("back_page3", "Back", style = "margin-top: 20px;")
          )
      )
  ),
  div(class = "logo-container",
      img(src = "~/Desktop/datafest24/shinyApp/THE SDS Bois.png", class = "logo-img")
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
        $('#page3').show();
      });
      $('#back_page1').click(function() {
        $('#page3').hide();
        $('#page2').show();
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

shinyApp(ui, server = function(input, output) {})
