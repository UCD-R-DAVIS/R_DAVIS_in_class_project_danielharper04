library(tidyverse)
gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")
gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>%
  ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+
  geom_line(aes(x = year, y = mean_lifeExp, color = continent))
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'dark red', linetype = 'dotted') +
  theme_bw()
## At this point I was trying to create the graphs with Bolded Labels and Bolded Underlined Title. I used a (~bold(~underline())) to try and get this but it did not work. I'm curious what went wrong, and if I should have defined it as bold in the beginning. 
countries <- c("Brazil", "China", "El Salvador", "Niger", "United States")
gapminder %>%
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.5, color = "purple")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries")+
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("Country") + ylab("Life Expectancy")