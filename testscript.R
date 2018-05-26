#install.packages("ggplot2")
#install.packages("dplyr")
#install.packages("knitr")
# install.packages("tidyr")
# install.packages("readxl")

library("ggplot2")
library("dplyr")
library(knitr)
library("tidyr")
library("readxl")



budget_data <- read_excel("data/Custom_Reporting_data.xls")
range(budget_data$Year)


# function to create the file name
filename <- function(year) {
  paste("data/effy", year, ".csv", sep ="")
}

# function to read the csv
import_data <- function(file) {
  attendence <- read.csv(file)
}

# function to filter the data
filtering <- function(name) {
  name <- name %>%
    filter(EFFYLEV == 2) %>%
    select(UNITID, EFYTOTLT)
}

pre_join <- function(file_name) {
  inner_join(budget_data, file_name)
}

budget_filter <- function(file, year) {
  
}
# creates the varible to read the csv file
file_2016 <- filename(2016)
file_2015 <- filename(2015)
file_2014 <- filename(2014)
file_2013 <- filename(2013)
file_2012 <- filename(2012)
file_2011 <- filename(2011)
file_2010 <- filename(2010)
file_2009 <- filename(2009)
file_2008 <- filename(2008)
file_2007 <- filename(2007)
file_2006 <- filename(2006)

# reads the csv
attendance_2016 <- import_data(file_2016)
attendance_2015 <- import_data(file_2015)
attendance_2014 <- import_data(file_2014)
attendance_2013 <- import_data(file_2013)
attendance_2012 <- import_data(file_2012)
attendance_2011 <- import_data(file_2011)
attendance_2010 <- import_data(file_2010)
attendance_2009 <- import_data(file_2009)
attendance_2008 <- import_data(file_2008)
attendance_2007 <- import_data(file_2007)
attendance_2006 <- import_data(file_2006)

# filters the csv
attendance_2016 <- filtering(attendance_2016)
attendance_2015 <- filtering(attendance_2015)
attendance_2014 <- filtering(attendance_2014)
attendance_2013 <- filtering(attendance_2013)
attendance_2012 <- filtering(attendance_2012)
attendance_2011 <- filtering(attendance_2011)
attendance_2010 <- filtering(attendance_2010)
attendance_2009 <- filtering(attendance_2009)
attendance_2008 <- filtering(attendance_2008)

# 2007 amd 2006 are difference since they use a different codding scheme
attendance_2007 <- attendance_2007 %>%
  filter(EFFYLEV == 2) %>%
  select(UNITID, FYRACE24)
attendance_2006 <- attendance_2006 %>%
  filter(EFFYLEV == 2) %>%
  select(UNITID, FYRACE24)

# attendance_2016 <- pre_join(attendance_2016)
# attendance_2015 <- pre_join(attendance_2015)
# attendance_2014 <- pre_join(attendance_2014)
# attendance_2013 <- pre_join(attendance_2013)
# attendance_2012 <- pre_join(attendance_2012)
# attendance_2011 <- pre_join(attendance_2011)
# attendance_2010 <- pre_join(attendance_2010)
# attendance_2009 <- pre_join(attendance_2009)
# attendance_2008 <- pre_join(attendance_2008)
# attendance_2007 <- pre_join(attendance_2007)
# attendance_2006 <- pre_join(attendance_2006)


