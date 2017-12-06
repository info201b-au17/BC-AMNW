library(dplyr)
library(ggplot2)


getUnemploymentGraph <- function(majors) {
    return(filterByMajorName(data, majors) %>% graphCategory("Unemployment_rate", "Unemployment %"))
}
