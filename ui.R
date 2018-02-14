library(shinythemes)



fluidPage(theme = shinytheme("cosmo"),
          
          verticalLayout(
            titlePanel("Guess the country!"),
            plotOutput("map"),
            
            hr(),
            fluidRow(
              column(8,
                     h3("Your answer:"),
                     selectizeInput("answer", 
                                    choices = country_list, 
                                    label="",
                                    multiple=FALSE,
                                    selected = NULL,
                                    width="90%"
                     )
              ),
              column(4,
                     actionButton("submit", "Submit!"),
                     br(),
                     htmlOutput("result")
                     
              )
              
            )
            
            
          )
)