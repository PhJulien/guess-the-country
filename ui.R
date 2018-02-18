library(shinythemes)



fluidPage(theme = shinytheme("cosmo"),
          
          
          titlePanel("Guess the country!"),
          
          sidebarLayout(
            
            sidebarPanel(
              h3("Your answer:"),
              selectizeInput("answer", 
                             choices = country_list, 
                             label="",
                             multiple=FALSE,
                             selected = NULL,
                             width="90%"
              ),
              actionButton("submit", "Submit!"),
              br(),
              htmlOutput("result")
            ),
            
            mainPanel(
              
              plotOutput("map")
              
            )
          )
          
)