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
#AC <- read.csv("output/AC.csv")
#AT <- read.csv("output/AT.csv")


######### Shiny Server Work #########

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  #############################################################
  # Output for Overview Tab
  # ov_data <- reactive({
  #   to_OV <- select(OV, school, contains(as.character(input$year))) %>%
  #   colnames(to_OV) = c('School', 'Attendence', 'Total.Athletic.Spending')
  # })
  
  # Toggles showing data table associated with current view on map
  observeEvent(input$Overview_data_show_table, {
    toggle("Overview_data")
  })
  
  output$mainPlot <- renderPlotly({
    ov_data <- OV %>% select(OV, school, paste("Attendance.", input$main_select_year, sep = ""), paste("Total.Athletic.Spending.", input$main_select_year, sep = ""))
    colnames(ov_data) = c('School', 'Attendence', 'Total.Athletic.Spending')
    
    plot_ly(ov_data, x = ~Total.Athletic.Spending, y = ~Attendance, type = "scatter",
            color = ~Total.Athletic.Spending,
            size = ~Total.Athletic.Spending,
            text = ~paste("School: ", School, '<br>Attendance:', Attendance.2005, '<br>Total Spending:', Total.Athletic.Spending)) %>%
      layout(title = "2005 Data for Athletic Spending Vs. School Attendance",
             xaxis = list(title = "Total Athletic Spending"),
             yaxis = list(title = "Attendence"),
             showlegend = F)
  })
  
  output$mainDataTable <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Athletics tab 
  
  #reactive portions for user data manipulation
  # AT_data <- reactive({
  #   to_mainData <- select(OV, State, contains(paste0('OB_percent_', as.character(input$year)))) %>% 
  #     filter(State!="Alaska", State!="Puerto Rico")
  #   colnames(to_obmap) = c('State', 'percent')
  #   to_obmap$hover = with(to_obmap, paste0(to_obmap$State, ": ", round(to_obmap$percent, digits = 3), "%"))
  #   to_obmap <- left_join(to_obmap, state_codes, by="State")
  # })
  
  observeEvent(input$Athletics_data_show_table, {
    toggle("Athletics_data")
  })
  
  output$athl1Plot <- renderPlotly({
    
    
    
  })
  
  output$athl2Plot <- renderPlotly({
    
    
    
  })
  
  output$athlTable1 <- renderDataTable({
    
    
  })
  
  output$athlTable2 <- renderDataTable({
    
    
  })
  
  #############################################################
  # Output for Academics tab 
  # ac_data <- reactive({
  #   to_mainData <- select(OV, State, contains(paste0('OB_percent_', as.character(input$year)))) %>% 
  #     filter(State!="Alaska", State!="Puerto Rico")
  #   colnames(to_obmap) = c('State', 'percent')
  #   to_obmap$hover = with(to_obmap, paste0(to_obmap$State, ": ", round(to_obmap$percent, digits = 3), "%"))
  #   to_obmap <- left_join(to_obmap, state_codes, by="State")
  # })
  
  observeEvent(input$Academics_data_show_table, {
    toggle("Academics_data")
  })
  
  output$ac1Plot <- renderPlotly({
    
    
    
  })
  
  output$ac2Plot <- renderPlotly({
    
    
    
  })
  
  output$acTable1 <- renderDataTable({
    
    
  })
  
  output$acTable2 <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Documentation tab 
  
})
