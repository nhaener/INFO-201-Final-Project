##############################################
## Nick Haener
## Final Project
##
## This file is for harvesting data from CKAN
## government data
##
## Link to API documentation
## http://docs.ckan.org/en/latest/api/index.html#
##############################################

#load packages
require(dplyr)
require(jsonlite)
require(knitr)
require(curl)
require(httr)


#retrieve and define data access key
base_uri <- 'http://catalog.data.gov/api/3/'


#function to make requests from the api server
makeRequest <- function(uri) {
  response <- GET(uri, add_headers('X-API-Key' = apiKey))
  body <- content(response, "text")
  parsed_data <- fromJSON(body)
  results <- parsed_data$results
  flattened_results <- flatten(results)
  return(flattened_results)
}