
library(dplyr)
data <- read.csv("data/college-majors/all-ages.csv", stringsAsFactors = FALSE)


category.data <- function(category) {
  category_data <- filter(data, Major_category == category)
  return(category_data)
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


agg.categories <- function() {
categories <- c("Agriculture & Natural Resources", "Biology & Life Science","Engineering", "Humanities & Liberal Arts",
                "Communications & Journalism", "Computers & Mathematics",
                "Industrial Arts & Consumer Services", "Education","Law & Public Policy", 
                "Interdisciplinary","Health","Social Science","Physical Sciences","Psychology & Social Work",
                "Arts","Business")

all.categories <- data.frame(category = rep(NA,16), average.pay = rep(NA,16), average.unemployment.rate =rep("",16),
                             stringsAsFactors = FALSE)
for( i in 1:16) {
  category <- categories[i]
  c.data <- category.data(category)
  mean.pay <- mean(c.data$Median)
  mean.unemployment <- mean(c.data$Unemployment_rate)
  all.categories[i, ] <- list(category, mean.pay, mean.unemployment) 
}
}



