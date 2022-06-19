
####################################
# User interface                   #
####################################

ui <- fluidPage(
  theme = shinytheme("cerulean"),
  navbarPage("Will he score?",
             tabPanel("Home",
                      sidebarLayout(
                        sidebarPanel(
                          titlePanel("Please fill the information of the students"),
                          
                          sliderInput(
                            inputId = "age",
                            label = "1. Choose the student's age",
                            value = 15, 
                            min = 15,
                            max = 22
                          ),
                          
                          radioButtons(
                            inputId = "Medu",
                            label=HTML("2. Choose the student's Mother's Education <br/> (0 - None, 1 - Primary Education (4th grade), 2 - 5th to 9th grade, 3 - secondary education, 4 - higher education)"),
                            choices = c(0,1,2,3,4)
                          ),
                          
                          radioButtons(
                            inputId = "traveltime",
                            label=HTML("3. Choose the student's home to school travel time <br/> (1 - <15 min., 2 - 15 to 30 min., 3 - 30 min. to 1 hour, or 4 - >1 hour)"),
                            choices = c(1,2,3,4)
                          ),
                          
                          sliderInput(
                            inputId = "studytime",
                            label="4. Choose the student's weekly study time per hours",
                            value = 1, 
                            min = 1,
                            max = 10
                          ),
                          sliderInput(
                            inputId = "failures",
                            label = '5. Choose the number of past class failures',
                            value = 0, 
                            min = 0,
                            max = 10
                          ),
                          
                          radioButtons(
                            inputId = "freetime",
                            label="6. Choose the student's free time after school (From 1 - Very Low to 5 - Very High)", 
                            choices = c(1,2,3,4,5)
                          ),
                          radioButtons(
                            inputId = "goout",
                            label="7. Choose whether student normally go out with friends (From 1 - Very Low to 5 - Very High)",
                            choices = c(1,2,3,4,5)
                          ),
                          
                          radioButtons(
                            inputId = "Walc",
                            label="8. Choose the student's weekend alcohol consumption (From 1 - Very Low to 5 - Very High)",
                            choices = c(1,2,3,4,5)
                          ),
                          radioButtons(
                            inputId = "health",
                            label="9. Choose the student's health condition ( From 1 - Very Low to 5 - Very Good)",
                            choices = c(1,2,3,4,5)
                          ),
                          numericInput(
                            inputId = "Grade2",
                            label = "10. Please fill in the student's grade for last semester (from 0 to 20)",
                            min = 0,
                            max = 20,
                            value = 1
                          ),
                          
                          actionButton(inputId = "submit", label = "Submit", class = "btn-primary")
                        ),
                        mainPanel(
                          tags$label(h3('Status/Output')), # Status/Output Text Box
                          verbatimTextOutput('contents'),
                          tableOutput('tabledata'))
                      )
                      
             ),
             tabPanel("About",tags$label(h3("Product Name"),h4("Will he score? - Prediction of student performance in secondary education", style = "color:black"),
             h3("Introduction"),h4("Education is a key factor for achieving a long-term economic progress. Past studies has shown that student achievement is highly influenced by past evaluations, however recent studies has also shown that there are also other relevant features such as health condition, mother's education and alcohol consumption. Hence, we built this product which is a student prediction tool that improves the quality of education and enhances school resource management.", style = "color:black"),
             h3("Instruction"),h4("There will be 10 questions asking for the student's information. Please fill in the information of the student for each question. After fill in, please press the submit button, the result will be shown at the right side.", style = "color:black"),
             h3("Contact"),h4("Any inquiries on the use of the application and comments on the design and functionalities of the application should be sent to Group Data Miner.", style = "color:black"),
             h3("Data Source"),h4("P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7.", style = "color:black")))
  )
)










