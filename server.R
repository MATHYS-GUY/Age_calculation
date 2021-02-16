#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#'@param date1 : input date of birth , may not be later than the system date
#'@param the format is yyyy-mm-dd , acalendarpops up and helps the input
#'@return selected_date : derived from date of birth (date1
#'@return date_week : day of the week of the date of birth
#'@return days_lived : number of days between system date and date of birth
#'@return var_years_lived : number of whole years between system date and date of birth
#'@author Guy Mathys
#'@details This calculates the day of the week of the date of birth
#'@details the number of days and of full years between today and the date of birth
#'


suppressPackageStartupMessages(library(shiny))
suppressPackageStartupMessages(library(lubridate))
suppressPackageStartupMessages(library(date))
shinyServer(function(input, output) {
        

var_calc1 <- reactive ({var_days_lived <- Sys.Date() -input$date1 })
var_calc2 <- reactive ({var_years_lived <- var_calc1()  / 365})
var_calc3 <- reactive ({var_years_lived_full <- round(as.numeric(var_calc2()) -0.5, digits = 0)})
var_doc <- reactive ({ doc_detail <- paste(
 "<b>",
 "This app calculates the number of days and years since the date of birth and today.",
 "</b>", 
 "<br>","The input of the date of birth can be given in format yyyy-mm-dd.",
 "<br>","A calendar pops up when clicking on the input field. You can choose the date on this calender",
 "<br>","The results of the calculation are :",
 "<br>","- the date entered;",
 "<br>","- the day of the week of the date of birth;",
 "<br>","- the numbers of days elapsed since then;",
 "<br>","- the years elapsed since then.",
 "<br>","",
 "<br>","The day of birth cannot be in the future.",
 "<br>","To close the programm , please close the window",
 "<br>","To close this documentation , please choose no"
      ) }) 
 var_det <- reactive ({ det_detail <- paste(
   "<br><b>",
   "This is the server calculation.",
   "</b>",
   " <br>","var_days_lived <- Sys.Date() -input$date1 =>:", var_calc1(),
    "<br>","var_years_lived <- var_calc1()  / 365      =>" , var_calc2(),
    "<br>","var_years_lived_full <- round(as.numeric(var_calc2()) -0.5, digits = 0) =>", var_calc3()
  ) })    
  
output$doc <- renderUI({
 if (input$rb > 0){
   HTML(var_doc())   
 }  
})
output$selected_date <- renderText({ 
  paste("Your day of birth was ", input$date1)  })

output$date_week <-renderText({ 
  paste("Your day of birth was on a ", weekdays(as.Date(input$date1)))  }) 

output$days_lived <- renderText({
  paste (" you lived already",  Sys.Date() - input$date1 , " days" ) })
output$years_lived <- renderText({
     paste ("you lived already ",  var_calc3() , "years") })
# })
output$det <- renderUI({
   if (input$serv_calc > 0){
      HTML(var_det())   
       }  } )

 } )
