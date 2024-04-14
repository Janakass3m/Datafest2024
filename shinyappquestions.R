library(shiny)
library(shinyMatrix)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('https://fonts.googleapis.com/css2?family=League+Spartan&display=swap');

      body, html, .container, .container-fluid {
        width: 100%;
        height: 750px;
        margin: 0;
        padding: 0;
        position: relative; 
      }

      body {
        font-family: 'League Spartan', sans-serif; 
        font-size: 26px;
        background: linear-gradient(to bottom, #B8E2F2, #ede2f0, #ffffff); 
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
        width: 50%; 
        height: 80%; 
        box-sizing: border-box; 
        border: 2px solid black; 
      }

      .question {
        font-size: 13px; 
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
              actionButton("back_page2", "Back", style = "margin-top: 20px;")
          )
      ),
      div(id = "page3", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Sample Questions"),
              p(class = "question", "Multiple Choice Question: Where are we right now?"),
              radioButtons("location", label = NULL, choices = c("SMU", "Austin", "Houston", "New York"), inline = TRUE),
              actionButton("check_answer", "Check Answer", style = "margin-top: 20px;"),
              p(id = "answer_feedback", ""),
              hr(),
              h3(class = "question", "Short Answer Question:"),
              p(class = "question", "What is the capital of Texas?"),
              textInput("capital", label = NULL, placeholder = "Your answer..."),
              actionButton("check_capital", "Check Answer", style = "margin-top: 20px;"),
              p(id = "capital_feedback", ""),
              hr(),
              h3(class = "question", "Choice Matrix Question:"),
              fluidRow(
                column(6, 
                       tags$div(id = "row_13.5", style = "margin-bottom: 10px;",
                                h4("13.5"),
                                actionButton("13.5_value", label = "Value", style = "margin-right: 10px;"),
                                actionButton("13.5_variable", label = "Variable", style = "margin-right: 10px;"),
                                actionButton("13.5_neither", label = "Neither", style = "margin-right: 10px;")
                       )
                ),
                column(6, 
                       tags$div(id = "row_Texas", style = "margin-bottom: 10px;",
                                h4("Texas"),
                                actionButton("Texas_value", label = "Value", style = "margin-right: 10px;"),
                                actionButton("Texas_variable", label = "Variable", style = "margin-right: 10px;"),
                                actionButton("Texas_neither", label = "Neither", style = "margin-right: 10px;")
                       )
                )
              )
          )
      ),
      div(id = "page4", style = "display:none;",
          tags$img(src = "images/image.png", class = "custom-image"),
          div(class = "white-box",
              h2("Conclusion"),
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

      $('#check_answer').click(function() {
        var selectedOption = $('input[name=location]:checked').val();
        if (selectedOption === 'SMU') {
          $('#answer_feedback').text('Correct');
        } else {
          $('#answer_feedback').text('Incorrect');
        }
      });

      $('#check_capital').click(function() {
        var userAnswer = $('#capital').val().trim().toLowerCase();
        if (userAnswer === 'austin') {
          $('#capital_feedback').text('Correct');
        } else {
          $('#capital_feedback').text('Incorrect');
        }
      });

      $('#13.5_value').click(function() {
        $('#row_13\\.5 .btn').removeClass('btn-success btn-danger').addClass('btn-default');
        $(this).removeClass('btn-default').addClass('btn-success');
      });
      $('#13.5_variable, #13.5_neither').click(function() {
        $('#row_13\\.5 .btn').removeClass('btn-success btn-danger').addClass('btn-default');
        $(this).removeClass('btn-default').addClass('btn-danger');
      });

      $('#Texas_variable').click(function() {
        $('#row_Texas .btn').removeClass('btn-success btn-danger').addClass('btn-default');
        $(this).removeClass('btn-default').addClass('btn-success');
      });
      $('#Texas_value, #Texas_neither').click(function() {
        $('#row_Texas .btn').removeClass('btn-success btn-danger').addClass('btn-default');
        $(this).removeClass('btn-default').addClass('btn-danger');
      });
    });
  ")
)

shinyApp(ui, server = function(input, output) {})