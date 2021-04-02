#ui template

####packages inladen#####
library(shiny)
library(shinydashboard)
library(xlsx)
library(DT)
library(music)
library(highcharter)
library(dplyr)
library(reshape2)

#id_list <- unique(df$id)  


ui <- (fluidPage(
  dashboardPage(
    
    skin = c("blue"),
    
    dashboardHeader(title = "Signaleringsdashboard"),
    
    ####Dashboard sidebar####
    dashboardSidebar(
      sidebarMenu(
        menuItem("Rankings", tabName = "tab_1"),
        menuItem("Land", tabName = "tab_2")
                 )
                     ),
    
    ####Dashboardbody####
    dashboardBody(
      
      tabItems(
        ####tab 1####    
        tabItem(tabName = "tab_1",
                fluidRow(
                  column(6)
                  )
                )
                
        ,
        ####tab 2####
         tabItem(tabName = "tab_2",
                 fluidRow(),
                        column(4,uiOutput("select1") ),
                        column(4,uiOutput("select2") ),
                        column(4,uiOutput("select3") ),
                  
                         column(12, strong("Aantal events per maand"),
                                highchartOutput("plot_2_1"))
                  
                        ,
                         column(12, strong("Asielinstroom per maand"),
                                highchartOutput("plot_2_2"))
                                
                         
                )

             
####Sluitende hasthag TabItems, DashboardBody, DashboardPage, Fluidpage####    
)))))

#shinyApp(ui, server)
