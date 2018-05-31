##############################################################################
## Nick Haener
## INFO 201 - Final Project
## Spring 2018
##
## Nick's analysis file for data processing, 
## testing and grapgical display testing
##############################################################################

################# SETUP ##############
# set working directory
# setwd("C:/Users/MyPC/Desktop/INFO201/InfoFinalProject/INFO-201-Final-Project")

# Load needed packages
library(plotly)
library(dplyr)
library(tidyr)

# source the data wrangling file for access to data frames
source("scripts/data-wrangling.R")

#read in data sets
CD <- read.csv("output/combined_data.csv")

##################### FUNCTIONS #############################################

#############################################################################
############################## DATA ANALYSIS ################################
#############################################################################
#clean innaccuracies in the data frame
# removing unnecessary columns added when joining df's
# ***COMMENT OUT IF UNECESSARY*** (CNTRL + SHIFT + C = COMMENT LARGE HIGHLIGHTED CODE CHUNK)

# CD <- CD[-CD$X.1]
# CD <- CD[-CD$X]
# CD <- CD[-CD$Year.x]
my_colsCD <- colnames(CD)



######## OVERVIEW ##########
#overview dataframe for cool things..... lol
AT_df <- CD %>% select(Data, UNITID, contains("Attendance"))
At_S_df <- CD %>% select(Data, UNITID, contains("Total.Athletic"))
colnames(AT_df)[1] <- "school"
colnames(At_S_df)[1] <- "school"

### Analysis
ATT_ATS <- left_join(AT_df, At_S_df, by = c("school", "UNITID"))
new_ATT_ATS <- na.omit(ATT_ATS)
test <- ATT_ATS %>% select(school, contains("2005"))
#flat_ATT_ATS <- flatten(new_ATT_ATS)


# create a year df for analysis and plotting purposes
ATT_ATS_2005 <- select(ATT_ATS, 1:2, contains("2005"))
new_ATT_ATS_2005 <- na.omit(ATT_ATS_2005)





## Plotting

plot_ly(data = new_ATT_ATS_2005, x = ~Total.Athletic.Spending.2005, y = ~Attendance.2005, type = "scatter",
        color = ~Total.Athletic.Spending.2005,
        size = ~Total.Athletic.Spending.2005,
        text = ~paste("School: ", school, '<br>Attendance:', Attendance.2005, '<br>Total Spending:', Total.Athletic.Spending.2005)) %>%
  layout(title = "2005 Data for Athletic Spending Vs. School Attendance",
         xaxis = list(title = "Total Athletic Spending"),
         yaxis = list(title = "Attendence"),
         showlegend = F)

# The main plot of the overview page ios going to show the relationship between 
# athletic spending and rates of attendence


# Write my data frames to CSV for application use
write.csv(new_ATT_ATS, file = "output/OV.csv")

######## ACADEMICS ##########
#academics data frame for data manipulation
AC_spending <- academic_spending_data
AC_tot <- total_academic

# Academic Spending Per student
ACSPS <- academic_spending_per_student

### Analysis




# Write my data frames to CSV for application use


## Plotting

# the AC1 plot is going to show the relationship between ......
#ac1Plot <-

# the AC2 plot is going to show the relationship between ......
#ac2Plot <-


######## ATHLETICS ##########
# athletics data frame for data manipulation
AT_spending <- athletic_spending_data

### Analysis




# Write my data frames to CSV for application use


## Plotting

# the Athl1 plot is going to show the relationship between ......
#athl1Plot <-


# the Athl2 plot is going to show the relationship between ......
#athl2Plot <-
