#####################################
## Nick Haener
## INFO 201 - Final Project
## Spring 2018
##
## Nick's analysis file for data processing, 
## testing and grapgical display testing
#####################################

################# SETUP ##############
# set working directory
# setwd("C:/Users/MyPC/Desktop/INFO201/InfoFinalProject/INFO-201-Final-Project")

# Load needed packages
library(plotly)
library(dplyr)

# source the data wrangling file for access to data frames
source("scripts/data-wrangling.R")

#read in data sets
CD <- read.csv("output/combined_data.csv")

#clean innaccuracies in the data frame
# removing unnecessary columns added when joining df's
# ***COMMENT OUT IF UNECESSARY*** (CNTRL + SHIFT + C = COMMENT LARGE HIGHLIGHTED CODE CHUNK)
CD <- CD[-1]
CD <- CD[-CD$Year.x]

##################### FUNCTIONS #############################################

#############################################################################
############################## DATA ANALYSIS ################################
#############################################################################


######## OVERVIEW ##########
#overview dataframe for cool things..... lol
O_df <- CD



### Analysis



# Write my data frames to CSV for application use



## Plotting

#




######## ACADEMICS ##########
#academics data frame for data manipulation
AC <- academic_spending_data


### Analysis




# Write my data frames to CSV for application use


## Plotting

#ac1Plot <-
#ac2Plot <-


######## ATHLETICS ##########
# athletics data frame for data manipulation
AT <- 

### Analysis




# Write my data frames to CSV for application use


## Plotting

#athl1Plot <-
#athl2Plot <-
