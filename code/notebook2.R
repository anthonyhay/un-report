edited version

ggplot(data = gapminder_1997) + 
  aes(x=gdpPercap)+ 
  aes(y=lifeExp)+
  labs(y="life expectance (yrs)")+
  geom_point()+
  aes(color=continent)+
  scale_color_brewer(palette="Set1")+
  aes(shape = continent)+
  aes(size=pop/100000)

#short handed ggplot
  ggplot(data=gapminder_1997, aes(x=gdpPercap,
                                  y=lifeExp, 
                                  color= continent, 
                                  shape=continent, size=pop/100000))+
    labs(x="gpd per capit", y="life expectancy", 
         title = "do wealth people live longer?",
         size= "pop/100000")+
    geom_point()
gapminder _data <- read.csv(gapminder_1997)  
view(gapminder_1997)  

ggplot(data = gapminder_1997) +
  aes(x=continent, y=lifeExp, color=continent) +
  geom_violin()+
  geom_jitter()

ggplot(data = gapminder_1997) +
  aes(x=continent, y=lifeExp, color=continent, fill=continent) +
  geom_jitter(aes(size=pop))+
  geom_violin()

#histogram
ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(binwidth = 2, bins=20)+
  theme_classic()

ggplot(gapminder_1997)+
  aes(x=gdpPercap, y=lifeExp)+
  geom_point()+
  facet_wrap(vars(continent))

ggplot(gapminder_1997)+
  aes(x=gdpPercap, y=lifeExp)+
  geom_point()+
  facet_grid(rows=vars(continent))

ggsave("awesome_plot.jpg",width=6,height = 4)

?ggsave
