###########################################
#
# VSP Urban Big Data Assignment 3
#
# Title: Data wrangling with Gapminder data
# Group number: <your input>
# Name: <your input>
# Date: <your input>
# 
###########################################

### Install packages
install.packages("dplyr")
install.packages("tidyverse")

### Load packages
library(dplyr)
library(tidyverse)

### Read data

# Please comment out one or the other

# For Windows
gapminder = read.csv("C:\Users\<your user name>\Documents\vsp_bigdata\assignments\gapminder_data.csv")

# For Mac
gapminder = read.csv("/Users/<your user name>/Documents/vsp_bigdata/assignments/gapminder_data.csv")


### Inspect data
head(gapminder) # Gapminder dataset 
names(gapminder) # Variables (columns) in gapminder dataset
str(gapminder) # Structure of the gapminder dataset

summary(gapminder) # Summary statistics of the gapminder dataset


############# Data wrangling example ############# 

# Only select country, continent, year, lifeExp, and pop
core_data = gapminder %>% select(country, continent, year, pop, lifeExp)

# Filter data only for years between 2007 and 2017
core_data = gapminder %>% filter(between(year, 1982, 2002))

# Filter data to choose USA
core_data = gapminder %>% filter(country == "United States of America")

# Select and filter data all together
core_data = gapminder %>% 
  select(country, continent, year, pop, lifeExp) %>% 
  filter(between(year, 1982, 2002)) %>%
  filter(country == "United States of America")

# Let's add a variable that represents gross domestic product (GDP) in 2002
core_data = gapminder %>% 
  filter(year == 2002) %>%
  mutate(gdp = pop * gdpPercap)

# Now let's group the data by continent
core_data = gapminder %>% group_by(continent)

# Lets get the mean population for each continent in 2002
core_data = gapminder %>% 
  filter(year == 2007) %>%
  group_by(continent) %>%
  summarise(meanPop = mean(pop, na.rm=TRUE))


############# Tasks to complete ############# 

### Task 1
# Modify the R code chunk above to now to select `country` and `pop`. Then filter the data for `Canada` for year 2007.
# Insert your code below



### Task 2
# Modify the R code chunk above to to group by continent and calculate mean life expectancy by continent for year 2007.
# Insert your code below





