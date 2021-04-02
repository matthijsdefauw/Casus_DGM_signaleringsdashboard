#server template

####(voorbeeld) data ophalen####

source("C:\\Users\\Matth\\OneDrive\\Documenten\\Traineeship\\JenVdatalab\\DGM sprint 4\\scripts\\df.R")
  
####functies ophalen####

server <- function(input, output, session) { 

#####Dynamische input selectie 1####
output$select1 <- renderUI({selectInput("select1",
                                        "Kies land",
                                        unique(df$citizen),
                                        selected = 1)})

output$select2 <- renderUI({selectInput("select2",
                                        "Kies event",
                                        eventlist,
                                        multiple = TRUE)})

output$select3 <- renderUI({selectInput("select3",
                                        "Kies som of lijn per Event",
                                        c("Som", "Event"),
                                        selected = "Som")})

####Grafiek 1_1####

  #Ranking landen met meeste migranten in afgelopen x periode

  #Ranking landen met hoogste numbers in x periode


####Grafiek 2_1####  
  
  #plot maken met tijd * waarde events)
   output$plot_2_1 <- renderHighchart({
     
   df_plot <- df %>%
              subset(citizen==input$select1 & attribute %in%c(input$select2)) 
    
    # df_plot <- df %>%
    #            subset(citizen=="Albania" & attribute %in% c("Host a visit",
    #                                                        "Accuse of crime, corruption")) 
   
   if(input$select3 == "Som"){
     
     df_plot <- df_plot %>%
                group_by(citizen, yearmonth) %>%
                mutate(number = sum(number)) %>%
                select(-attribute) %>%
                distinct()
    
    highchart()%>%
      hc_xAxis(minTickInterval = 1, categories = df_plot$yearmonth) %>%
      hc_yAxis(min = 0) %>%
      hc_add_series(data = df_plot$number, 
                    type = "spline",
                    showInLegend = FALSE)

    }
   
   else if(input$select3 == "Event"){
     
     hchart(df_plot, "spline", hcaes(x = as.character(yearmonth), y = number, group = attribute)) %>%
         hc_xAxis(title = list(enabled = FALSE)) %>%
         hc_yAxis(title = list(enabled = FALSE))
            
   }
   
   
   })

####Grafiek 2_2####  

#plot maken met tijd * waarde migrants)
output$plot_2_2 <- renderHighchart({
  df_plot <- df %>%
    subset(citizen==input$select1 & attribute == "migrants")

  highchart()%>%
    hc_xAxis(minTickInterval = 1, categories = df_plot$yearmonth) %>%
    hc_yAxis(min = 0) %>%
    hc_add_series(data = df_plot$number, 
                  type = "spline",
                  showInLegend = FALSE)

})





  
}

