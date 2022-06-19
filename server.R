####################################
# Server                           #
####################################

  
server <- function(input, output,session) {
  
  
  # Read in the RF model
  model <- readRDS("studentmodel.rds")
  
  # Input Data
   datasetInput <- reactive({ 
   
      
    df <- data.frame(
            Name = c("G2","failures",'traveltime','age','studytime',
                     "Medu",'Walc','freetime','goout','health'),
            
            Value = as.character(c( input$Grade2,input$failures,
                                    input$traveltime,input$age,
                                    input$studytime,input$Medu,
                                    input$Walc,input$freetime,
                                    input$goout,input$health)),
            stringsAsFactors = FALSE)
          
          students <- 0
          df <- rbind(df, students)
          input <- transpose(df)
          
          
          
          write.table(input,"studentinput.csv", sep=",", quote = FALSE, row.names = FALSE, col.names = FALSE)
          
          test <- read.csv(paste("studentinput", ".csv", sep=""), header = TRUE)
          
          
          Output <- data.frame("Predicted_Grade_For_Next_Semester"=predict(model,test))
          print(Output)
          
   })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submit>0) { 
      isolate("Calculation complete.") 
    } else {
      return("Server is ready for calculation.")
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submit>0) { 
      isolate(datasetInput()) 
    } 
  })
            
    
            
    
}

