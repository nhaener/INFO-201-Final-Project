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



######## OVERVIEW #################################################
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
# Overview plot - Tot Athl Spending vs. Attendance
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

######## ACADEMICS ############################################
# academics - spending per student vs total academic spending, total academic spending vs attendence
#academics data frame for data manipulation
AC_spending <- academic_spending_data
AC_tot <- total_academic

# Academic Spending Per student
ACSPS <- academic_spending_per_student



### Analysis
# make and manipulate new dataframe for testing and later use in server (plot 1)
#AC_spend_2005 <- AC_spending %>% select(1:2, contains("2005"))
AC_spend_per <- AC_spending %>% select(1:2,contains("per.FTE"), contains("Total."))
new_AC_spend_per <- na.omit(AC_spend_per)

# make and manipulate new dataframe for testing and later use in server (plot 2)
AC_spend_att <- AC_spending %>% select(1:2,contains("Attendance"), contains("per.FTE"))
AC2_test_2005 <- AC_spend_att %>% select(1:2, contains("2005"))
new_Ac2_2005 <- na.omit(AC2_test_2005)
new_AC_spend_att <- na.omit(AC_spend_att)

# plot 3 data analysis
AC_SP_Pl3 <- AC_spending %>% select(1:2, contains("per.FTE"))
AC_SP_Pl3_clean <- na.omit(AC_SP_Pl3)
## Plotting

# the AC1 plot is going to show the relationship between ......
#ac1Plot <-
plot_ly(data = new_AC_spend_per, x = ~Total.Academic.Spending.2005, y = ~Academic.Spending.per.FTE.Student.2005, type = "scatter",
        color = ~Academic.Spending.per.FTE.Student.2005,
        size = ~Academic.Spending.per.FTE.Student.2005,
        text = ~paste("School: ", Data, '<br>Academic spending per student:', Academic.Spending.per.FTE.Student.2005, '<br>Total Annual Spending:', Total.Academic.Spending.2005)) %>%
  layout(title = "2005 Data for Total Academic Spending Vs. Student Annual Academic Spending",
         xaxis = list(title = "Total Academic Spending"),
         yaxis = list(title = "Student Academic Spending"),
         showlegend = F)

# the AC2 plot is going to show the relationship between ......
plot_ly(data = new_Ac2_2005, x = ~Academic.Spending.per.FTE.Student.2005, y = ~Attendance.2005, type = "scatter",
        color = ~Attendance.2005,
        size = ~Attendance.2005,
        text = ~paste("School: ", Data, '<br>Attendance:', Attendance.2005, '<br>Total Annual Spending: ', Academic.Spending.per.FTE.Student.2005)) %>%
  layout(title = "2005 Data for Student Academic Spending Vs. Student Attendance (Enrollment)",
         xaxis = list(title = "Student Academic Spending"),
         yaxis = list(title = "Student Enrollment"),
         showlegend = F)


#ac2Plot <-
plot_ly(AC_SP_Pl3_clean, x = ~Data, y = ~Academic.Spending.per.FTE.Student.2005, type = 'bar',
        marker = list(color = 'rgb(158,202,225)',
                      line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
  add_trace(x = ~Data, y = ~Academic.Spending.per.FTE.Student.2005, type = 'scatter', mode = 'lines',
        line = list(color = '#45171D')) %>%
  layout(title = "Yearly Tuition Cost by School",
         xaxis = list(title = ""),
         yaxis = list(title = "Cost of tuition (in $)",side = 'left', showgrid = FALSE, zeroline = FALSE),
         y2 = list(side = 'right', overlaying = "yaxis", title = title, showgrid = FALSE, zeroline = FALSE),
         showlegend = F)

# write data frames to csv as needed for later use
write.csv(new_AC_spend_per, file = "output/AC1.csv")
write.csv(new_AC_spend_att, file = "output/AC2.csv")
write.csv(AC_SP_Pl3_clean, file = "output/AC3.csv")

######## ATHLETICS #########################################
# Athletics - athletic spending per athlete vs total athletic spending, num football players vs school

# athletics data frame for data manipulation
AT_spending <- athletic_spending_data

### Analysis
# pl1
#
AT_TotSpend_PlSpend <- AT_spending %>% select(1:2,contains("Total.Athletic"), contains("per.Athlete"))
AT_year_test_2005 <- AT_TotSpend_PlSpend %>% select(1:2, contains("2005"))
AT_test_clean <- na.omit(AT_year_test_2005)
new_AT1 <- na.omit(AT_TotSpend_PlSpend)

# pl2
#
football_div <- CD %>% select(Data, UNITID, NCAA.Subdivision, contains("Football.Players"))
football_div <- na.omit(football_div)
divisions <- as.data.frame(unique(CD$NCAA.Subdivision))
colnames(divisions) <- "division"
football_test_2005 <- football_div %>% select(Data, UNITID, contains("2005"))





## Plotting

# the Athl1 plot is going to show the relationship between ......
#athl1Plot <-
plot_ly(data = AT_test_clean, x = ~Athletic.Spending.per.Athlete.2005, y = ~Total.Athletic.Spending.2005, type = "scatter",
        color = ~Total.Athletic.Spending.2005,
        size = ~Total.Athletic.Spending.2005,
        text = ~paste("School: ", Data, '<br>Athletic Spending Per Athlete: $', Athletic.Spending.per.Athlete.2005, '<br>Total Annual Athletic Spending: $', Total.Athletic.Spending.2005)) %>%
  layout(title = "2005 Data for Athlete Athletic Spending Vs. Total Athletic Spending",
         xaxis = list(title = "Athlete Athletic Spending"),
         yaxis = list(title = "Total (Annual) Athletic Spending"),
         showlegend = F)


# the Athl2 plot is going to show the relationship between ......
#athl2Plot <-


x <- c("Fotball Championship Subdivision")


plot_ly(football_test_2005, x = ~Data, y = ~Football.Players.2005, type = 'bar',
        marker = list(color = 'rgb(158,202,225)',
                      line = list(color = 'rgb(8,48,107)', width = 1.5))) %>%
  layout(title = "Number Football Players by  School",
         xaxis = list(title = ""),
         yaxis = list(title = "Number of Football Players"),
         showlegend = F)

#athl3Plot <-

write.csv(new_AT1, file = "output/AT1.csv")
write.csv(football_div, file = "output/FB1.csv")
write.csv(new_AT2, file = "output/AT2")
