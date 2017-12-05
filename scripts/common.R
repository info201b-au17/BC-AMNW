library(shiny)
library(dplyr)
data <- read.csv("data/college-majors/all-ages.csv", stringsAsFactors = FALSE)


category.data <- function(category) {
  category_data <- filter(data, Major_category == category)
  return(category_data)
}

# Takes in a vector of major names, returns a data frame containing just those majors.
filterByMajorName <- function(data, majors) {
    filteredData <- data.frame()
    for(major in majors) {
        filteredData <- rbind(filteredData, data[which(data$Major == major),])
    }
    return(filteredData)
}

# Takes in a dataframe, category AS STRING, and category label (y-axis label) AS STRING, returns a bar graph of Major vs. Category
# Example call: graphCategory(data, "Median", "Median Pay)
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

1#categories 
2#Agriculture & Natural Resources
3#Biology & Life Science
4#Engineering
5#Humanities & Liberal Arts
6#Communications & Journalism
7#Computers & Mathematics
8#Industrial Arts & Consumer Services
9#Education
10#Law & Public Policy 
11#Interdisciplinary
12#Health
13#Social Science
14#Physical Sciences
15#Psychology & Social Work
16#Arts
17#Business

categories <- c("Agriculture & Natural Resources", "Biology & Life Science","Engineering", "Humanities & Liberal Arts",
                "Communications & Journalism", "Computers & Mathematics",
                "Industrial Arts & Consumer Services", "Education","Law & Public Policy", 
                "Interdisciplinary","Health","Social Science","Physical Sciences","Psychology & Social Work",
                "Arts","Business")

# for(category in categories) {
#   data <- category.data(category)
#   pay <- NULL
#   unemployment_rate <- NULL
# }


employment.rate <- function(category_or_major, data_to_filter) {
  
}


# pay.aggregate.data <- aggregate(data, by = list("Agriculture & Natural Resources", "Biology & Life Science","Engineering", "Humanities & Liberal Arts",
#   "Communications & Journalism", "Computers & Mathematics","Industrial Arts & Consumer Services", "Education","Law & Public Policy", 
#   "Interdisciplinary","Health","Social Science","Physical Sciences","Psychology & Social Work", "Arts","Business"), FUN = mean,
#   na.rm = TRUE)




