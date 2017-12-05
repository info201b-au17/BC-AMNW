# install.packages("shiny")
library(shiny)

# install.packages("dplyr")
library(dplyr)

# install.packages("ggplot2")
library(ggplot2)

# Call Global R script to do all the processing, this script is to display the graph
source("scripts/common.R")

# This function takes in a list of majors that a user may be interested in then returns a graph of median pay 
# for those majors
GetPayByMajors <- function(majors) {
  return(graphMajorsPay(data, majors))
}

# Stub data to test with
listOfMajors <- c("FOOD SCIENCE", "MUSIC", "ECOLOGY", "INFORMATION SCIENCES")
as.list(listOfMajors)



