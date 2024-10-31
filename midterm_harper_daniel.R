#Task 1, load in the tidy verse, and read in the data as "laps"
library (tidyverse)

#This allows me to filter out the activites as needed (or at least I think so). 
laps <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv")

#Task 3, this will allow me to apply a simple filter to search the "sport column" to then find all those non running activities and exclude them from the data set. The laps that were assignmed previously from the csv, will now be saved under "run_sport"
run_sport <- laps %>%
  filter(sport == "running",
         minutes_per_mile < 10,
         minutes_per_mile >= 5,
         total_elapsed_time_s > 60) 
#Task 4, Here I was able to create a new column for pace and form in the "run_data". I like to use the if_else function because it reminds me of the function in Excel that assigns roles. 
run_sport <- run_sport %>%
  mutate(
    pace = case_when(
      minutes_per_mile < 6 ~ "fast",
      between(minutes_per_mile, 6, 8) ~ "medium",
      minutes_per_mile > 8 ~ "slow"
    ),
    form = if_else(year(timestamp) == 2024, "new", "old")
  )
## comments ##
# I enjoy reading through the stack overflow so that I can see which functions I could used based off of my knowedge from Excel. I've found some cool forums on how to learn R based on excel. 
