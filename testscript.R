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
colnames(budget_data)[colnames(budget_data)=="IPEDS ID"] <- "UNITID"


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

pre_join <- function(budget, school_data) {
  left_join(budget, school_data, by="UNITID")
}

budget_filter <- function(years) {
  budget_year <- budget_data %>%
    filter(Year == years)
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

bud2015 <- budget_filter(2015)
bud2014 <- budget_filter(2014)
bud2013 <- budget_filter(2013)
bud2012 <- budget_filter(2012)
bud2011 <- budget_filter(2011)
bud2010 <- budget_filter(2010)
bud2009 <- budget_filter(2009)
bud2008 <- budget_filter(2008)
bud2007 <- budget_filter(2007)
bud2006 <- budget_filter(2006)
bud2005 <- budget_filter(2005)


attendance_2016 <- pre_join(bud2015, attendance_2016)
attendance_2015 <- pre_join(bud2014, attendance_2015)
attendance_2014 <- pre_join(bud2013, attendance_2014)
attendance_2013 <- pre_join(bud2012, attendance_2013)
attendance_2012 <- pre_join(bud2011, attendance_2012)
attendance_2011 <- pre_join(bud2010, attendance_2011)
attendance_2010 <- pre_join(bud2009, attendance_2010)
attendance_2009 <- pre_join(bud2008, attendance_2009)
attendance_2008 <- pre_join(bud2007, attendance_2008)
attendance_2007 <- pre_join(bud2006, attendance_2007)
attendance_2006 <- pre_join(bud2005, attendance_2006)


names(attendance_2016)[15] <- "Attendance 2016"
names(attendance_2015)[15] <- "Attendance 2015"
names(attendance_2014)[15] <- "Attendance 2014"
names(attendance_2013)[15] <- "Attendance 2013"
names(attendance_2012)[15] <- "Attendance 2012"
names(attendance_2011)[15] <- "Attendance 2011"
names(attendance_2010)[15] <- "Attendance 2010"
names(attendance_2009)[15] <- "Attendance 2009"
names(attendance_2008)[15] <- "Attendance 2008"
names(attendance_2007)[15] <- "Attendance 2007"
names(attendance_2006)[15] <- "Attendance 2006"


rbind(attendance_2016, attendance_2015)



write.csv(attendance_2016, "data/2015-2016 data.csv")








