#####################################
## Nick Haener, Doug, Ryan,
## INFO 201 - Final Project
## Spring 2018
#####################################

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
source("scripts/analysis.R")
#data <- read.csv("output/ES_df.csv")


######### Shiny Server Work #########

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  
  #############################################################
  # Output for Overview Tab
  output$mainPlot <- renderPlot({
    
    
    
  })
  
  output$mainDataTable <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Athletics tab 
  output$athl1Plot <- renderPlot({
    
    
    
  })
  
  output$athl2Plot <- renderPlot({
    
    
    
  })
  
  output$athlDataTable <- renderDataTable({
    
    
  })
  
  #############################################################
  # Output for Academics tab 
  
  output$ac1Plot <- renderPlot({
    
    
    
  })
  
  output$ac2Plot <- renderPlot({
    
    
    
  })
  
  output$mainDataTable <- renderDataTable({
    
    
  })
  
  
  
  #############################################################
  # Output for Documentation tab 
  
})
