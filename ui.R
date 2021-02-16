library(shiny)
shinyUI(fluidPage(
    titlePanel("Calculation of age"),
    sidebarLayout(
        sidebarPanel(
            h3("Input"), 
            
            dateInput("date1", 
                      h4("Date of birth yyyy-mm-dd"), 
                      value = Sys.Date(),
                      max = Sys.Date() + 1),       
         ),
        mainPanel(
        
    radioButtons("rb", "Do you want to see the documentation ? ",
                          choiceNames = list(
                              HTML("<p style='color:green;'>No</p>"),
                              HTML("<p style='color:red;'>Yes</p>")
                             
                          ),
                          choiceValues = list(
                              "0", "1"
                          )),
         
         
    radioButtons("serv_calc", "Do you want to see the server calculation ? ",
                      choiceNames = list(
                          HTML("<p style='color:green;'>No</p>"),
                          HTML("<p style='color:red;'>Yes</p>")
                          
                      ),
                      choiceValues = list(
                          "0", "1"
                      )),
     htmlOutput("doc"),
     h3("result of calculations"),
             textOutput("selected_date"),
             textOutput("date_week"),
             textOutput("days_lived"),
             textOutput("years_lived"),
      htmlOutput("det")
      
      
  )))
)