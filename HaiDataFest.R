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

      .graph-image {
        width: 47%; /* Adjust the width of each graph */
        margin-right: 3%; /* Adjust the margin between graphs */
        margin-bottom: 20px; /* Adjust the margin between rows */
        float: left;
      }

      .graph-row::after {
        content: '';
        display: table;
        clear: both;
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
      div(id = "table_of_contents", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image", style="position:absolute; top:20px; right:20px;"),
          div(class = "white-box",
              h2("Table of Contents", style = "font-size: 48px;"),
              p("Introduction.....", style = "font-size: 25px;"),
              p("A brief description of the textbook and introducing imporvements to the original CourseKata", style = "font-size: 15px;"),# Adjust font size as needed
              p("Graphs......", style = "font-size: 25px;"), 
              p("Graphs that explain our analysis and display relationships", style = "font-size: 15px;"),# Adjust font size as needed
              p("Sample Questions....", style = "font-size: 25px;"),
              p("Examples of the type questions that is recommended for the textbook", style = "font-size: 15px;"),
              p("Conclusion......", style = "font-size: 25px;"), 
              p("Concluding our findings", style = "font-size: 15px;"),
              actionButton("next_page0", "Next Page", style = "margin-top: 20px;"),
              actionButton("back_page0", "Back", style = "margin-top: 20px;")
          )
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
              div(class = "graph-row",
                  tags$img(src = "images/image1.jpeg", class = "graph-image"),
                  tags$img(src = "images/image3.jpeg", class = "graph-image")
              ),
              div(class = "graph-row",
                  tags$img(src = "images/image4.jpeg", class = "graph-image"),
                  tags$img(src = "images/graph1.png", class = "graph-image")
              ),
              actionButton("next_page3", "Next Page", style = "margin-top: 20px;"),
              actionButton("back_page2", "Back", style = "margin-top: 20px;")
          )
      ),
      div(id = "page3", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Sample Questions"),
              p(""),
              actionButton("next_page4", "Next Page", style = "margin-top: 20px;"),
              actionButton("back_graphs_page", "Back", style = "margin-top: 20px;")
          )
      ),
      div(id = "page4", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Conclusion"),
              p("From our analysis, we have concluded that a more diverse and variable type of questions in an interactive textbook would engage students more. As seen previously, students generally performed worse when they had a large number of the same number of questions (ex. MCQ) compared to when they had multiple different types of questions. These types of questions would hone in the student’s attention and help them practice different skills when it comes to understanding the content. Chapters in this interactive textbook such as 12, 10, and 7 were also seen to have the worst performance in the book. 
"),
              actionButton("back_page3", "Back", style = "margin-top: 20px;")
          )
      )
  ),
  tags$script("
    $(document).ready(function() {
      $('#next_page').click(function() {
        $('#page1').hide();
        $('#table_of_contents').show();
      });
      $('#back_page0').click(function() {
        $('#table_of_contents').hide();
        $('#page1').show();
      });

      $('#next_page0').click(function() {
        $('#table_of_contents').hide();
        $('#page2').show();
      });
      $('#back_page2').click(function() {
        $('#page2').hide();
        $('#table_of_contents').show();
      });

      $('#next_page2').click(function() {
        $('#page2').hide();
        $('#graphs_page').show();
      });
      $('#back_page2').click(function() {
        $('#page2').hide();
        $('#page1').show();
      });

      $('#next_page3').click(function() {
        $('#graphs_page').hide();
        $('#page3').show();
      });
      $('#back_page3').click(function() {
        $('#graphs_page').hide();
        $('#page2').show();
      });

      $('#next_page4').click(function() {
        $('#page3').hide();
        $('#page4').show();
      });
      $('#back_page4').click(function() {
        $('#page4').hide();
        $('#page3').show();
      });
    });
  ")
)

shinyApp(ui, server = function(input, output) {})


