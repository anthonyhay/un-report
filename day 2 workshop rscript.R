library(tidyverse)
getwd()
gapminder_1997 <- read_csv("un-report/gapminder_data.csv")
summarize(gapminder_1997, mean(lifeExp))
summarize(gapminder_1997, averageLifExp=mean(lifeExp), medianLifExp=median(lifeExp))
# learning to pipe


#filtering
gapminder_1997%>%
  filter(year==2007)%>%
  summarize(average =mean(lifeExp))

gapminder_1997%>% 
  summarise(Firstyear = min(year))

#using group_by

gapminder_1997%>%
  group_by(year, continent)%>%
  summarize(average = mean(lifeExp), error = sd(lifeExp))

gapminder_1997%>%
  mutate(gdp = pop * gdpPercap)

gapminder_1997%>%
  mutate (popinmillions = pop/1000000)

gapminder_1997%>%
  select(pop, year)

gapminder_1997%>%
  select(-continent)
gapminder_1997%>%
  select(country, continent, year, lifeExp)%>%
  pivot_wider(names_from = year, values_from = lifeExp)



gapminder_1997%>%
  select(continent, country, year, lifeExp)%>%
  pivot_wider(names_from = year, values_from = lifeExp)%>%
  View()
#working with messy data

read_csv("un-report/co2-un-data.csv", skip = 1)

co2_emissions_dirty <- read_csv("un-report/co2-un-data.csv", skip = 2,
         col_names = c("region", "country", "year","series","value","footnotes","source"))
c02_emissions <-co2_emissions_dirty%>%
  select(country, year, series, value)%>%
  mutate(series = recode(series, "Emissions (thousand metric tons of carbon dioxide)" = "total_emissions",
         "Emissions per capita (metric tons of carbon dioxide)" = "per_capita_emissions"))%>%

  pivot_wider(names_from=series, values_from=value)%>%
#filter for year 2005 
#select to remove the year column
#store as an object with a descriptive name
    filter(year==2005)%>%
  select(-year)
gapmind_data_2007 <- read_csv("gapminder_data.csv")%>%
  filter(year==2007)%>%
  select(country, pop, lifeExp, gdpPercap)
joined_c02_pop<-inner_join(c02_emissions, gapmind_data_2007, by = "country")
anti_join(c02_emissions, gapmind_data_2007, by = "country")
anti_join(gapmind_data_2007, c02_emissions)
full_join(gapmind_data_2007, c02_emissions)
left_join(c02_emissions,gapmind_data_2007)
right_join(gapmind_data_2007, c02_emissions)

wd

write_csv(joined_c02_pop, file = "joined_c02_pop.csv")

write.csv(joined_c02_pop, file = "joined_c02_pop.csv")


getwd()

join_c02_pop<-read.csv("joined_c02_pop.csv")
gdp_c02_plot<-ggplot(data = join_c02_pop) +
  aes(x =gdpPercap, y=per_capita_emissions)+
  labs(x="GDP (per capita")+ geom_point()+
  labs(y="c02 emitted (per capita)",
       title="There is a strong association between a nation's GDP \nand the amount of CO2 it produces")+
  geom_smooth(method = "lm", se=FALSE)+
  ggpubr::stat_regline_equation(aes(label = after_stat(rr.label)))

ggsave(gdp_c02_plot, filename = "un-report/gdp_c02_plot.png", height = 4,width = 6, units= "in")

install.packages("ggpubr")  
