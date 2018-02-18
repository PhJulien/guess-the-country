
function(input, output, session) {
  
  session$userData <- list("last_country" = "",
                           "nb_correct" = 0, 
                           "total" = 0,
                           "perc" = 0,
                           "streak" = c()
                           )
  
  print(session$userData)
  
  validate_answer <- eventReactive(input$submit, {
    
    #print(session$userData)
    session$userData$total <- session$userData$total + 1
    
    out = "<p></p>"
    
    if(input$answer == session$userData$last_country) {
      out = paste(out, "<strong>Well done!</strong> The answer was indeed: ", input$answer)
      session$userData$nb_correct <- session$userData$nb_correct + 1
      session$userData$streak <- c(session$userData$streak, "Yes")
    } else {
      out = paste(out, "<em>Too bad</em>. Answer was: <strong>", session$userData$last_country , "</strong>")
      session$userData$streak <- c(session$userData$streak, "No")
    }
    
    session$userData$perc = round(session$userData$nb_correct / session$userData$total * 100)
    out = paste(out, hr(),  "Your score: ", session$userData$nb_correct , "/", session$userData$total, " (", session$userData$perc, "%)", sep="")
    
    streak_out <- streak_to_icons[tail(session$userData$streak, 10)]
    # print(session$userData$streak)
    # print(streak_out)
    
    if (length(streak_out)) {
      out <- paste(out, "<br />Streak: ", paste(streak_out, collapse=""), sep="")
    }
    #print(out)
    
    HTML(out)
  }
  )
  
  plot_new_map <- eventReactive(input$submit, {
                                
       new_country <- sample(country_list2, 1)
       session$userData$last_country <- new_country
       print(new_country)
      map(region=new_country)
      
      }, ignoreNULL = FALSE
   ) 
    


  ### This is important to declare this one first as it needs to be executed first
  output$result <- renderUI({
    validate_answer()
  }
  )
  

  
  output$map <- renderPlot({
    
    plot_new_map()
    updateSelectizeInput(session, 
                         "answer", 
                         choices = country_list, 
                         selected = NULL
                         )
    
  })
  
}