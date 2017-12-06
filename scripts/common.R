library(dplyr)
library(ggplot2)

data <- read.csv("data/college-majors/all-ages.csv", stringsAsFactors = FALSE)



MajorCategory <- c("Agriculture & Natural Resources" = "Agriculture & Natural Resources",
                   "Arts" = "Arts",
                   "Biology & Life Science" = "Biology & Life Science",
                   "Business" = "Business",
                   "Communications & Journalism" = "Communications & Journalism",
                   "Computers & Mathematics" = "Computers & Mathematics",
                   "Education" = "Education",
                   "Engineering" = "Engineering",
                   "Health" = "Health",
                   "Humanities & Liberal Arts" = "Humanities & Liberal Arts",
                   "Industrial Arts & Consumer Services" = "Industrial Arts & Consumer Services",
                   "Interdisciplinary" = "Interdisciplinary",
                   "Law & Public Policy" = "Law & Public Policy",
                   "Social Science" = "Social Science",
                   "Physical Sciences" = "Physical Sciences",
                   "Psychology & Social Work" = "Psychology & Social Work")

selectGraph <- c("Average Pay" = "Median",
                 "Unemployment Rate" = "Unemployment_rate")




#filters data by category
category.data <- function(category) {
  category_data <- filter(data, Major_category == category)
  return(category_data)
}

#function for finding average salary or unemployment rate of a given category of majors
#returns dataframe with category and average pay or unemployment rate
major.category <- function(category, data.type) {
  category.data <- category.data(category)
  if(data.type == "Average Pay") {
    data.type <- mean(category.data$Median)
    category.summary <- data.frame(category = rep("", 1), average.pay = rep(NA, 1), stringsAsFactors = FALSE)
  } else {
    data.type <- mean(category.data$Unemployment_rate)
    category.summary <- data.frame(category = rep("", 1), unemployment.rate = rep(NA, 1), stringsAsFactors = FALSE)
  }
  category.summary[1, ] <- list(category, data.type)
  return(category.summary)
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
# Example call: graphCategory(data, "Median", Median Pay)
graphCategory <- function(data, category, categoryLabel) {
  data["Unemployment_rate"] <- data["Unemployment_rate"] * 100
  result <- ggplot(data, aes(Major, get(category))) + geom_col(aes(fill = Major_category))
  result <- result + labs(x = "Major", y = categoryLabel, fill = "Category") + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1))
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


#function that creates a data frame of all major categories and its respective average pay and average unemployment rate.
agg.categories <- function() {
all.categories <- data.frame(category = rep(NA,16), average.pay = rep(NA,16), average.unemployment.rate =rep("",16),
                             stringsAsFactors = FALSE)
for( i in 1:16) {
  category <- MajorCategory[i]
  c.data <- category.data(category)
  mean.pay <- mean(c.data$Median)
  mean.unemployment <- mean(c.data$Unemployment_rate)
  all.categories[i, ] <- list(category, mean.pay, mean.unemployment) 
}
return(all.categories)
}



