#############################################################
## Nick Haener, Doug, Ryan, James
## INFO 201 - Final Project
## Spring 2018
##
## data table definitions
## MD - Main data for all information regarding secondary education
## AC - Data frame depicting all academic data
## AT - Data frame representing all athletics data
#############################################################

################# SETUP ##############
# set working directory
# setwd("C:/Users/MyPC/Desktop/INFO201/InfoFinalProject/INFO-201-Final-Project")


# Load needed packages
library(shiny)
library(plotly)
library(dplyr)
library(shinyjs)

# library(choroplethr)
# library(choroplethrMaps)

# source the analysis file for graphs and such
# source("scripts/analysisNick.R")
OV <- read.csv("output/OV.csv")
AC1 <- read.csv("output/AC1.csv")
AC2 <- read.csv("output/AC2.csv")
AT1 <- read.csv("output/AT1.csv")
FB1 <- read.csv("output/FB1.csv")
#AT2 <- read.csv(output/AT2.csv)


######### Shiny Server Work #########

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  #############################################################
  # Output for Overview Tab
  
  # Toggles showing data table associated with current view on map
  observeEvent(input$Overview_data_show_table, {
    toggle("mainDataTable")
  })
  
  output$mainPlot <- renderPlotly({
    ov_data <- OV %>% select(school, paste0("Attendance.", input$main_select_year), paste0("Total.Athletic.Spending.", 
                                                                                           input$main_select_year))
    colnames(ov_data) = c('School', 'Attendance', 'Total.Athletic.Spending')
    
    plot_ly(ov_data, x = ~ov_data$Total.Athletic.Spending, y = ~Attendance, type = "scatter",
            color = ~Total.Athletic.Spending,
            size = ~Total.Athletic.Spending,
            text = ~paste("School: ", School, '<br>Attendance:', Attendance, '<br>Total Spending:', 
                          Total.Athletic.Spending)) %>%
      layout(title = paste(input$main_select_year," Data for Athletic Spending Vs. School Attendance"),
             xaxis = list(title = "Total Athletic Spending"),
             yaxis = list(title = "Attendance"),
             showlegend = F)
  })
  
  output$mainDataTable <- renderDataTable({
    dataTable <- OV %>% select(school, paste0("Attendance.", input$main_select_year), paste0("Total.Athletic.Spending.", 
                                                                                             input$main_select_year))
    colnames(dataTable) = c('School', 'Attendance', 'Total Athletic Spending')
    dataTable
  })

  
  #############################################################
  # Output for Academics tab 
  
  output$ac1Plot <- renderPlotly({
    ac_data <- AC1 %>% select(Data, paste0("Academic.Spending.per.FTE.Student.", input$academics_select_year), 
                              paste0("Total.Academic.Spending.", input$academics_select_year))
    colnames(ac_data) = c('School', 'Academic.Spending.per.FTE.Student', 'Total.Academic.Spending')
    
    plot_ly(ac_data, x = ~Total.Academic.Spending, y = ~Academic.Spending.per.FTE.Student, type = "scatter",
            color = ~Academic.Spending.per.FTE.Student,
            size = ~Academic.Spending.per.FTE.Student,
            text = ~paste("School: ", School, '<br>Academic spending per student:', 
                          Academic.Spending.per.FTE.Student, '<br>Total Spending:', Total.Academic.Spending)) %>%
      layout(title = paste(input$academics_select_year, " Total Spending Vs. Student Spending"),
             xaxis = list(title = "Student Academic Spending"),
             yaxis = list(title = "Total Academic Spending"),
             showlegend = F)
    
  })
  
  output$ac2Plot <- renderPlotly({
    ac_data <- AC2 %>% select(Data, paste0("Academic.Spending.per.FTE.Student.", input$academics_select_year), 
                              paste0("Attendance.", input$academics_select_year))
    colnames(ac_data) = c('School', 'Academic.Spending.per.FTE.Student', 'Attendance')
    
    plot_ly(data = ac_data, x = ~Academic.Spending.per.FTE.Student, y = ~Attendance, type = "scatter",
            color = ~Attendance,
            size = ~Attendance,
            text = ~paste("School: ", School, '<br>Attendance:', Attendance, '<br>Total Annual Spending:', Academic.Spending.per.FTE.Student)) %>%
      layout(title = paste(input$academics_select_year, " Student Academic Spending Vs. Student Attendance (Enrollment)"),
             xaxis = list(title = "Student Academic Spending"),
             yaxis = list(title = "Student Enrollment"),
             showlegend = F)
    
    
  })
  
  output$acTable1 <- renderDataTable({
    dataTable <- AC1 %>% select(Data, paste0("Academic.Spending.per.FTE.Student.", input$academics_select_year), paste0("Total.Academic.Spending.", input$academics_select_year))
    colnames(dataTable) = c('School', 'Student Academic Spending', 'Total Academic Spending')
    dataTable
    
  })
  
  output$acTable2 <- renderDataTable({
    dataTable <- AC2 %>% select(Data, paste0("Academic.Spending.per.FTE.Student.", input$academics_select_year), paste0("Attendance.", input$academics_select_year))
    colnames(dataTable) = c('School', 'Student Academic Spending', 'Student Enrollment (Attendance)')
    dataTable
    
  })
  
  observeEvent(input$Academics_data_show_table, {
    toggle("acTable1")
    toggle("acTable2")
  })
  
  #############################################################
  # Output for Athletics tab 
  
  output$athl1Plot <- renderPlotly({
    at_data <- AT1 %>% select(Data, paste0("Athletic.Spending.per.Athlete.", input$athletics_select_year), 
                              paste0("Total.Athletic.Spending.", input$athletics_select_year))
    colnames(at_data) = c('School', 'Athletic.Spending.per.Athlete', 'Total.Athletic.Spending')
    
    plot_ly(data = at_data, x = ~Athletic.Spending.per.Athlete, y = ~Total.Athletic.Spending, type = "scatter",
            color = ~Total.Athletic.Spending,
            size = ~Total.Athletic.Spending,
            text = ~paste("School: ", School, '<br>Athletic Spending Per Athlete: $', Athletic.Spending.per.Athlete, 
                          '<br>Total Annual Athletic Spending: $', Total.Athletic.Spending)) %>%
      layout(title = paste(input$athletics_select_year, " Athlete Athletic Spending Vs. Total Athletic Spending"),
             xaxis = list(title = "Athlete Athletic Spending"),
             yaxis = list(title = "Total (Annual) Athletic Spending"),
             showlegend = F)
    
  })
  
  output$athlPlot2 <- renderPlotly({
    fb_data <- FB1 %>% select(Data, paste0("Football.Players.", input$athletics_select_year))
    colnames(fb_data) = c('School', 'Num.FB.Players')
    
    plot_ly(fb_data, x = ~School, y = ~Num.FB.Players, type = 'bar',
            marker = list(color = 'rgb(158,202,225)',
                          line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
      layout(title = paste(input$athletics_select_year, " Number Football Players by  School"),
             xaxis = list(title = ""),
             yaxis = list(title = "Number of Football Players"),
             showlegend = F)
    
    
  })
  
  output$athlPlot3 <- renderPlotly({
    
    
  })
  
  output$athlTable1 <- renderDataTable({
    dataTable <- AT1 %>% select(Data, paste0("Athletic.Spending.per.Athlete.", input$athletics_select_year), 
                                paste0("Total.Athletic.Spending.", input$athletics_select_year))
    colnames(dataTable) = c('School', 'Athletic Spending per Athlete', 'Total Athletic Spending')
    dataTable
    
  })
  
  
  output$athlTable2 <- renderDataTable({
    dataTable <- FB1 %>% select(Data, paste0("Football.Players.", input$athletics_select_year))
    colnames(dataTable) = c('School', 'Num Football Players')
    dataTable
    
  })
  
  output$athlTable3 <- renderDataTable({
    
    
  })
  
  observeEvent(input$Athletics_data_show_table, {
    toggle("athlTable1")
    toggle("athlTable2")
    toggle("athlTable3")
  })
  
  #############################################################
  # Output for Documentation tab 
  
})
