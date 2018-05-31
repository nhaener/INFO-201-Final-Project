library("ggplot2")
library("dplyr")
library(knitr)
library("tidyr")
library(base)


# reads in csv files
data_05_to_06 <- read.csv("data/2005-2006 data.csv", stringsAsFactors = FALSE)
data_06_to_07 <- read.csv("data/2006-2007 data.csv", stringsAsFactors = FALSE)
data_07_to_08 <- read.csv("data/2007-2008 data.csv", stringsAsFactors = FALSE)
data_08_to_09 <- read.csv("data/2008-2009 data.csv", stringsAsFactors = FALSE)
data_09_to_10 <- read.csv("data/2009-2010 data.csv", stringsAsFactors = FALSE)
data_10_to_11 <- read.csv("data/2010-2011 data.csv", stringsAsFactors = FALSE)
data_11_to_12 <- read.csv("data/2011-2012 data.csv", stringsAsFactors = FALSE)
data_12_to_13 <- read.csv("data/2012-2013 data.csv", stringsAsFactors = FALSE)
data_13_to_14 <- read.csv("data/2013-2014 data.csv", stringsAsFactors = FALSE)
data_14_to_15 <- read.csv("data/2014-2015 data.csv", stringsAsFactors = FALSE)
data_15_to_16 <- read.csv("data/2015-2016 data.csv", stringsAsFactors = FALSE)


# function to add year to columns
add_column_years <- function(df) {
  year <- df[1, 4]
  colnames(df)[16] <- "Attendance"
  colnames(df)[7:16] <- paste0(colnames(df)[7:16], ".", year)
  return(df)
}

# calls add_column_years function
data2005 <- add_column_years(data_05_to_06)
data2006 <- add_column_years(data_06_to_07)
data2007 <- add_column_years(data_07_to_08)
data2008 <- add_column_years(data_08_to_09)
data2009 <- add_column_years(data_09_to_10)
data2010 <- add_column_years(data_10_to_11)
data2011 <- add_column_years(data_11_to_12)
data2012 <- add_column_years(data_12_to_13)
data2013 <- add_column_years(data_13_to_14)
data2014 <- add_column_years(data_14_to_15)
data2015 <- add_column_years(data_15_to_16)



col_names <- c('X'='X', 'Data' = 'Data', 'UNITID'='UNITID', 
           'NCAA.Subdivision'='NCAA.Subdivision',
           'FBS.Conference'='FBS.Conference')

# nested left_join to combine all the data sets by college
combined_data <- left_join(data2005, data2006, by = col_names) %>% 
  left_join(., data2007, by = col_names) %>% 
  left_join(., data2008, by = col_names) %>%
  left_join(., data2009, by = col_names) %>%
  left_join(., data2010, by = col_names) %>%
  left_join(., data2011, by = col_names) %>%
  left_join(., data2012, by = col_names) %>%
  left_join(., data2013, by = col_names) %>%
  left_join(., data2014, by = col_names) %>%
  left_join(., data2015, by = col_names)

View(combined_data)

#######################################
########## Athletic Spending ##########
#######################################

# dataframe for athletic spending and attendance data
athletic_spending_data <- combined_data %>% 
  select(Data, UNITID, contains("NCAA.Subdivision"), contains("FBS.Conference"), contains("Unduplicated.Athletes"), 
         contains("Total.Athletic.Spending"), contains("Athletic.Spending.per.Athlete"),
         contains("Total.Football.Spending"), contains("Football.Spending.per.Football.Player"), contains("Attendance"))


# dataframe for total athletic spending
total_athletic <- athletic_spending_data %>% 
  select(Data, UNITID, starts_with("Total.Athletic.Spending"))


# dataframe for athletic spending per student
athletic_spending_per_athlete <- athletic_spending_data %>% 
  select(Data, UNITID, starts_with("Athletic.Spending.per.Athlete"))


#######################################
########## Academic Spending ##########
#######################################

# dataframe for academic spending and attendance data
academic_spending_data <- combined_data %>% 
  select(Data, UNITID, contains("FTE.Students."), contains("Total.Academic.Spending"), contains("Academic.Spending.per.FTE"), contains("Attendance")) 

# dataframe for total academic spending
total_academic <- academic_spending_data %>% 
  select(Data, UNITID, starts_with("Total.Academic.Spending")) 

# dataframe for academic spending per student
academic_spending_per_student <- academic_spending_data %>% 
  select(Data, UNITID, starts_with("Academic.Spending.per.FTE")) 


#########################################################
############ FUNCTIONS for getting max/mins##############
#########################################################


# function that takes in any year from 2005 to 2015 as a string and returns a dataframe showing 
# the college with the highest total academic spending of that year, and the college with the lowest of that year.
get_max_min_total_academic <- function(year) {
  max_min <- total_academic %>% 
    select(Data, total_spending = ends_with(year)) %>% 
     filter(total_spending == max(total_spending, na.rm = TRUE) | total_spending == min(total_spending, na.rm = TRUE)) %>% 
     select(Data, total_spending) %>% 
    arrange(desc(total_spending))
  total <- paste0("Total Spending in ", year)
  names(max_min) <- c("College", total)
  return(max_min)
}

# test total academic spending function 
max_min_total_test <- get_max_min_total_academic("2015")
View(max_min_total_test)


# function that takes in year as a string and returns dataframe showing the college with the 
# highest academic spending per student of that year, as well as the college with the lowest
get_max_min_per_student_academic <- function(year) {
  max_min <- academic_spending_per_student %>% 
    select(Data, spending_per_student = ends_with(year)) %>% 
    filter(spending_per_student == max(spending_per_student, na.rm = TRUE) | 
             spending_per_student == min(spending_per_student, na.rm = TRUE)) %>% 
    select(Data, spending_per_student) %>% 
    arrange(desc(spending_per_student))
  colname <- paste0("Academic Spending for FTE (Full Time Equivalent) Students in ", year)
  names(max_min) <- c("College", colname)
  return(max_min)
}

max_min_per_student_test <- get_max_min_per_student_academic("2015")
View(max_min_per_student_test)


# write combined data to csv
write.csv(combined_data, file = "output/combined_data.csv")









