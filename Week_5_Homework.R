library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys_wide <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  group_by(genus, plot_type) %>% 
  summarise(mean_hindfoot = mean(hindfoot_length)) %>% 
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% 
  arrange(Control)
summary(surveys$weight)
surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    T ~ "large"
  ))
surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    weight >= 48.00 ~ "large"
  ))
surveys %>% 
  mutate(weight_cat = ifelse(weight <= 20.00, "small",
                             ifelse(weight > 20.00 & weight < 48.00, "medium","large")))
summ <- summary(surveys$weight)
summ[[2]]
summ[[5]]
surveys %>% 
  mutate(weight_cat = case_when(
    weight >= summ[[2]] ~ "small",
    weight > summ[[2]] & weight < summ[[5]] ~ "medium",
    weight >= summ[[5]] ~ "large"
  ))
