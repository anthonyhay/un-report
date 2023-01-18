#the goal of our file is run life expectancy and climate/co2 emissions versus population
#date jan 17 2023
#author Anthony Hay
#load in packages necessary for analyssis
#read in data for analysis
library(tidyverse)
gapminder_1997 <-read_csv("un-report/gapminder_1997.csv
#plotting data for visualization
ggplot(data=gapminder_1997)
ggplot(data)

ggplot(data = gapminder_1997) 
+ aes(x=gdpPercap)+ aes(y=lifeExp)
+labs(y="life expectance (yrs)")

ggplot(data = gapminder_1997) +
 aes(x=year, y=lifeExp, color=continent) +
                          geom_line()

#learn about data using the structure command str
str(gapminder_1997)

 ggplot(data = gapminder_1997) +
 aes(x=year, y=lifeExp, color=continent) +
                          geom_point()


