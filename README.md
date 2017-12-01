# BC-AMNW

Github link:
https://github.com/info201b-au17/BC-AMNW

Project Description:
We will be working with the dataset from FiveThirtyEight's blog regarding college majors. The data can be found at https://github.com/fivethirtyeight/data/blob/master/college-majors/all-ages.csv
and includes data regarding unemployment rate and pay for each college major. The data was collected by the United States Census and was organized by FiveThirtyEight. We will be using the data from both undergraduate and graduate students which is contained in the all-ages.csv file.

Our target audience will be high-school and college students who are trying to figure out what they want to major in. As pay and employment are very important aspects of a major, knowing what they can expect will be very helpful in determining if their desired major is a viable career or if they should switch or double major in another more promising option.

Some things that our audience will want to learn from our data include:
What majors have the highest pay?
Our audience may want to see which majors have the best return considering the price of college, and ranking the majors by average job compensation could be useful to them.
Which majors have the highest employment rate?
Pay is one important aspect for a job, but it doesn't matter if you can't get hired. Our audience may want to consider which majors provide the most job opportunities (denoted by unemployment rate) so that they may choose a major such that they quickly receive a job offer on completion of their schooling.
How does this major compare to others?
Some members of our audience may already have a specific major in mind that they are considering. However, they may want to know how it ranks in pay and employment rate compared to other majors in order to see if it is a viable option. We will offer them the ability to compare one specific major to the others and see the data just for it.

Technical Description:
The format that we chose for our final product will be in terms of a Shiny app in order to allow user input and customize the data shown based off of the user's desires.

The dataset that we chose for this project is in a csv file which we will obtain from the FiveThirtyEight github.

The only data-wrangling that we will be doing will be in relationship with the shiny app (such as filtering data based on user input). The dataset is format in such a way that further data-wrangling will likely not be necessary.  

Besides the libraries that we have use for past assignments (such as dplyr, jsonlite, etc.) it seems that no other new libraries will be need for this project besides Shiny.

As of right now all the questions that we will be answering in this project: which majors earn the most money, have highest employment, etc. can be answered without using any statistical analysis/machine learning.

As of right now the dataset seems to be easy to work with in the sense that we are used to using csv files and that the dataset is arranged in a clean and clear manner, thus no major challenges are anticipated for this project besides learning how to work with Shiny.
