####Functies voor highcharts####

highchart_simple_one <- function(df, type, filter_var, filter_var_cat, x_as, y_as, min = 0, minTickInterval = 1){

    # x_as <- "tijd"
    # y_as <- y_as
     
    filter_var
  
    df_plot <- df %>% 
      subset(get(filter_var)==filter_var_cat)
    
    hc <- highchart()%>%
      hc_xAxis(minTickInterval = 1) %>%
      hc_yAxis(min = 0) %>%
      hc_add_series(df_plot, 
                    type = type , 
                    hcaes(x = tijd, y = waarde))
    
    hc
  
}


test <- highchart_simple_one(df, "line", "id", "3A", "tijd", "waarde")
