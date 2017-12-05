# install.packages("shiny")
library(shiny)

# install.packages("dplyr")
library(dplyr)

install.packages("ggplot2")
library(ggplot2)

GetGraphyByMajors <- function(list) {
  getList <- list
  
}

listOfMajors <- c("FOOD SCIENCE", "MUSIC", "ECOLOGY", "INFORMATION SCIENCES")
readData <- read.csv("./all-ages.csv", header = TRUE)

filterData <- readData[readData$Major %in% listOfMajors, ]

moneyData <- filterData[, c("Major", "Median")]



