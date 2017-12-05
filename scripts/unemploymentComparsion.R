library(dplyr)
library(ggplot2)
source("scripts/common.R")

getUnemploymentGraph <- function(majors) {
    return(filterByMajorName(data, majors) %>% graphCategory("Unemployment_rate", "Unemployment %"))
}