###########################################
#
# VSP Urban Big Data Assignment 4
#
# Title: Data visualization with Gapminder data
# Group number: <your input>
# Name: <your input>
# Date: <your input>
# 
###########################################

### Install required package

install.packages("dplyr")
install.packages("magrittr")
install.packages("ggplot2")
install.packages("plotly")
install.packages("leaflet")


### Load the package
library(dplyr)
library(magrittr)
library(ggplot2)
library(plotly)
library(leaflet)


### Reading Gapminder dataset

# Make sure to change `[your user name]` with your own user name for the path.

# For Windows
gapminder = read.csv("C://Users//[your user name]//Documents//vsp_bigdata//assignments//gapminder_data_2016.csv")
geo = read.csv("C://Users//[your user name]//Documents//vsp_bigdata//assignments//gapminder_geo.csv")

# For Mac
gapminder = read.csv("/Users/[your user name]/Documents/vsp_bigdata/assignments/gapminder_data_2016.csv")
geo = read.csv("/Users/[your user name]/Documents/vsp_bigdata/assignments/gapminder_geo.csv")


### Join gapminder data and the geographic coordinates
gapminder = gapminder %>% inner_join(geo, by="name")


### Initialize ggplot
ggplot(gapminder, aes(x = income))

## Generate a histogram
ggplot(gapminder, aes(x = income)) + geom_histogram()

### Generate a scatter plot
ggplot(gapminder, aes(x = income, y=lifeExp)) + geom_point()


# Create a log-transformed income variable
gapminder = gapminder %>% mutate(income_log = log(income))

# Plot again with the log-transformed income
ggplot(gapminder, aes(x = income_log, y=lifeExp)) + geom_point()

# Plot again with a log scale applied to the x-axis
ggplot(gapminder, aes(x = income, y=lifeExp)) + geom_point() + scale_x_log10()


# Generate a boxplot
ggplot(gapminder, aes(x = region, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)

# The `geom_jitter` is not necessary but addes more depth into our visualization.
ggplot(gapminder, aes(x = region, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)

# Plot a trend line
ggplot(gapminder, aes(x = income, y=lifeExp)) + geom_point() + geom_smooth() + scale_x_log10()


############# Tasks to complete ############# 

## Task 1

# Modify the R code chunk above to create one histogram for population `population` and another histogram for life expectancy `lifeExp`.<br>
#   _Hint: you may use `geom_histogram()`._ <br><br>


## Task 2  
  
# Modify the R code chunk above to create a scatter plot and a trend line showing the relationship between population and life expectancy by continent. Please transform the variable accordingly. <br>
  #_Hint: you may use `geom_point()` and `geom_smooth()`._ <br><br>
  

## **Task 3**

# Please email the completed Assignment 4 template R file to the course email (urbanbigdata2019@gmail.com). 
# Make sure to use the following email title format: <br>
# `VSP BigData [assignment number] - [your name]` <br>
# ex), `VSP BigData Assignment 4 - Bill Gates` <br>
# Assignment 4 is due this Wednesday (Jul 31, 5:00 PM)


  


