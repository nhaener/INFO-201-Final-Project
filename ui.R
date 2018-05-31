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


# source the analysis file for graphs and such
source("scripts/analysis.R")
data <- read.csv("output/ES_df.csv")


#######################################
shinyUI(fluidPage(theme = "bootstrap.css", #sets theme for web app
                  useShinyjs(), # Set up toggle ability
                  navbarPage("USA Secondary Education",
                             #############################################################
                             ## UI for Overview page
                             tabPanel("Overview",
                                      sidebarLayout(
                                        sidebarPanel( "View Settings:", width = 3,
                                                      # Slider to select what year to show data for data table
                                                      # Has animation that goes through years
                                                      sliderInput("main_select_year",
                                                                  2000, 2016, 1, sep = "",
                                                                  label = "Select year", 
                                                                  animate = animationOptions(interval = 4000)),
                                                      # Dropdown box to select national or state to view  
                                                      selectInput("main_select_state",
                                                                  choices = c("National", choices()),
                                                                  label = "Select focus (by State or national)"),
                                                      radioButtons("radio_select", label = h3("Data Shown"),
                                                                   choices = list("select1" = 1, 
                                                                                  "select2" = 2, 
                                                                                  "select3" = 3), 
                                                                   selected = 1
                                                                   
                                                      )
                                        ),
                                        mainPanel(
                                          # Renders the data table
                                          dataTableOutput("dataTable")
                                        )
                                      )
                             ),
                             #############################################################
                             ## UI Academics
                             tabPanel("Academics",
                                      sidebarLayout(
                                        sidebarPanel( "View Settings:", width = 3,
                                                      # Slider to select what year to show data for data table
                                                      # Has animation that goes through years
                                                      sliderInput("main_select_year",
                                                                  2005, 2015, 1, sep = "",
                                                                  label = "Select year", 
                                                                  animate = animationOptions(interval = 4000)),
                                                      # Dropdown box to select national or state to view  
                                                      selectInput("main_select_state",
                                                                  choices = c("National", choices()),
                                                                  label = "Select focus (by State or national)"),
                                                      radioButtons("radio_select", label = h3("Data Shown"),
                                                                   choices = list("select1" = 1, 
                                                                                  "select2" = 2, 
                                                                                  "select3" = 3), 
                                                                   selected = 1
                                                                   
                                                      )
                                                      
                                                      
                                        ),
                                        # contains the information paragraph and the reactive map
                                        mainPanel(
                                          #plotlyOutput('ac1Plot'),
                                          #plotlyOutput('ac2Plot'),
                                          br(),
                                          br(),
                                          h4("Information"),
                                          br(), 
                                          p(" Information about data shown"),
                                          br()
                                          )
                                        )  
                                        ),
                             #############################################################
                             ## UI Athletics
                             tabPanel("Athletics",
                                      sidebarLayout(
                                        sidebarPanel( "View Settings:", width = 3,
                                                      # Slider to select what year to show data for data table
                                                      # Has animation that goes through years
                                                      sliderInput("main_select_year",
                                                                  2000, 2016, 1, sep = "",
                                                                  label = "Select year", 
                                                                  animate = animationOptions(interval = 4000)),
                                                      # Dropdown box to select national or state to view  
                                                      selectInput("main_select_state",
                                                                  choices = c("National", choices()),
                                                                  label = "Select focus (by State or national)"),
                                                      radioButtons("radio_select", label = h3("Data Shown"),
                                                                   choices = list("select1" = 1, 
                                                                                  "select2" = 2, 
                                                                                  "select3" = 3), 
                                                                   selected = 1
                                                                   
                                                      )
                                                      
                                                      
                                        ),
                                        # contains the information paragraph and the reactive map
                                        mainPanel(
                                          #plotlyOutput('athl1Plot'),
                                          #plotlyOutput('ath2lPlot')
                                          br(),
                                          br(),
                                          h4("Information"),
                                          br(), 
                                          p(" Information about data shown"),
                                          br()
                                        )
                                      )  
                             ),
                             #############################################################
                             ## UI for Documentation
                             tabPanel("Documentation",
                                      mainPanel( 
                                        #HTML Formatted Text
                                        h1("Project Documentation"),
                                        h3("Created by: Nick Haener, James Lee, Douglas Pham and Ryan Siu"),
                                        br(), 
                                        h2("Project Description"),
                                        p("This project uses data about NCAA School's atheltic funding and NCAA School's student attendance.
                                          After some data manipulation and analysis we were able analyze and display the relationship of these,
                                          and visualize the data so that we are able to draw conclusions and answers about the schools in that
                                          scope."),
                                        h3("What is the data?"),
                                        p("The data views the major NCAA Schools' revenue and expenditure trends in correlation to those school's 
                                          attendance from the years 2006-2015, with data collected on a yearly basis."), 
                                        p("For a quick link to NCAA's School's athletic funding", 
                                          tags$a(href = "http://spendingdatabase.knightcommission.org/reports/63a3c708", 
                                                 "Click Here!")),
                                        p("This data set is based on information released spending logs from each major NCAA school included in
                                          the data."),
                                        p("For a quick link to post-secondary education data", 
                                          tags$a(href = "https://catalog.data.gov/dataset/201112-integrated-postsecondary-education-data-system", 
                                                 "Click Here!")),
                                        p("This data set is based on information released data from all post-secondary education (any education
                                          past high school. i.e. undergraduate or postgraduate educations) institutions."),
                                        p("The data sets we used are:"), 
                                        tags$ul(
                                          tags$li("data 1"), 
                                          tags$li("data 2")),
                                        h3("Why do we care?"),
                                        p("The one of the main concepts we aimed to address was, how the ranking of college sports teams matched up to the
                                          ranking of the college. Perhaps potential student athletes are searching for the best colleges to attend
                                          that suit their goals. Another was to observe and show how colleges spend their money. Tuition payers and donors would
                                          probably like to know how their money is being spent! And the last main idea was if certain conference/region have
                                          better funding, and if that correlates at all to more admitted students to those colleges. It could possibly indicate
                                          a better school if there's more private funding which could be information students and parents would like to know!"),
                                        br(),
                                        h2("Technical Description"),
                                        h3("What libraries were used?"),
                                        p("To create the visual representations we used ", 
                                          #Linked Library Documentation
                                          tags$a(href = "http://shiny.rstudio.com/", "shiny"), ", ",
                                          tags$a(href = "https://plot.ly/r/", "plotly"), ", ",
                                          #tags$a(href = "https://cran.r-project.org/web/packages/choroplethr/", "choroplethr"), ", ",
                                          #tags$a(href = "https://cran.r-project.org/web/packages/choroplethrMaps/index.html", "choroplethrMaps"), ", and ",
                                          tags$a(href = "https://cran.r-project.org/web/packages/shinyjs/shinyjs.pdf", "shinyjs"), ". ",
                                          "For the in depth data manipulation I used ",
                                          tags$a(href = "https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html", "dplyr"), "."
                                        ),
                                        h3("What aspects of the data sets were used?"),
                                        p("We focused mainly on using the attendance and total athletic spending for the overview,
                                          athletic spending per athlete, total athletic spending, number of football players, and the
                                          NCAA subdivision for the athletics tab, and academic spending, people attending and division
                                          for the academics tab.", 
                                          tags$ul(
                                            tags$li(""),
                                            tags$li(" ")
                                          ), 
                                          br()
                                          
                                        )
                                      )
                             )
                             ######################################################
                             ## End of UI tabs
            )
))
