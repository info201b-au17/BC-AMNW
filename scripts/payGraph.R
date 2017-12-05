# install.packages("shiny")
library(shiny)

# install.packages("dplyr")
library(dplyr)

# install.packages("ggplot2")
library(ggplot2)

source("scripts/common.R")

allData <- read.csv("./all-ages.csv")

# This function takes in a list of majors that a user may be interested in
GetPayByMajors <- function(majors) {
  return(filterByMajorName(data, majors) %>% graphMajors("./data/college-majors/all-ages.csv", "Median"))
}



listOfMajors <- c("FOOD SCIENCE", "MUSIC", "ECOLOGY", "INFORMATION SCIENCES")
as.list(listOfMajors)



