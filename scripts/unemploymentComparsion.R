library(dplyr)
library(ggplot2)

#TEMP READ IN
data <- read.csv("data/college-majors/all-ages.csv")

# Takes in a vector of major names, returns a data frame containing just those majors.
filterByMajorName <- function(majors) {
    filteredData <- data.frame()
    for(major in majors) {
        filteredData <- rbind(filteredData, data[which(data$Major == major),])
    }
    return(filteredData)
}

# Takes in a dataframe, category AS STRING, and category label (y-axis label) AS STRING, returns a bar graph of Major vs. Category
graphCategory <- function(data, category, categoryLabel) {
    data["Unemployment_rate"] <- data["Unemployment_rate"] * 100
    result <- ggplot(data, aes(Major, get(category))) + geom_col(aes(fill = Major_category))
    result <- result + labs(x = "Major", y = categoryLabel, fill = "Category") + scale_x_discrete( labels = 
    function(labels) {
        fixedLabels <- c() 
        for (l in 1:length(labels)) {
            fixedLabels <- c(fixedLabels, paste0(ifelse(l %% 2 == 0, '', '\n'), labels[l]))
        } 
        return( fixedLabels )
    })
    return(result)
}