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
library(shinyjs)

# library(choroplethr)
# library(choroplethrMaps)

# source the analysis file for graphs and such
source("scripts/analysisNick.R")
#data <- read.csv("output/ES_df.csv")


######### Shiny Server Work #########

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  #############################################################
  # Output for Overview Tab
  output$mainPlot <- renderPlotly({
    
    
    
  })
  
  output$mainDataTable <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Athletics tab 
  
  #reactive portions for user data manipulation
  
  
  output$athl1Plot <- renderPlotly({
    
    
    
  })
  
  output$athl2Plot <- renderPlotly({
    
    
    
  })
  
  output$athlDataTable <- renderDataTable({
    
    
  })
  
  #############################################################
  # Output for Academics tab 
  
  output$ac1Plot <- renderPlotly({
    
    
    
  })
  
  output$ac2Plot <- renderPlotly({
    
    
    
  })
  
  output$mainDataTable <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Documentation tab 
  
})
