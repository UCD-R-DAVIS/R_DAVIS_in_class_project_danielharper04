## loading the libraries 
library(tidyverse)
library(ggplot2)

## reading in the data from the link provided in GitHub

url <- "https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv"
tyler_running <- read_csv(url)

# Filter and preprocess the data... I named in "tyler_running" for this. 
tyler_running <- tyler_running %>%
  filter(
    sport == "running",
    between(minutes_per_mile, 5, 10),
    total_elapsed_time_s > 60
  ) %>%
## this mutate will allow for all off the cases in "period" where these requirements are met in the data.
  mutate(period = case_when(
    year < "2024-01-01" ~ "Pre-2024",
    year < "2024-07-01" ~ "Initial Rehab",
    TRUE ~ "Post-Intervention"
  )) %>%
## Here I was converting the data to get a speed in mph.
  mutate(speed_mph = (total_distance_m / 1609.34) / (total_elapsed_time_s / 3600))

# Scatter plot of steps per min v. the speed. I thought that there would be more color in the plot based on my choses colors but I seem to be mistaken. 
scatter_plot <- ggplot(tyler_running, aes(x = speed_mph, y = steps_per_minute, color = period)) +
  geom_point(size = 2, alpha = 0.6) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("Pre-2024" = "orange", "Initial Rehab" = "purple", "Post-Intervention" = "lightgreen")) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    legend.position = "topright"
  ) +
  labs(
    title = "Steps Per Minute vs Speed",
    x = "Speed (mph)",
    y = "Steps Per Minute (SPM)",
    color = "Time Period"
  )

# Print the scatter plot to portray these differences. 
print(scatter_plot)

# Focus on post-July 2024 data and filter out the laps between 1 and 3. I found myself getting an error with my mutate here and I am unsure why. I think trying to look back at this took the most time, along with the previous scatter plot script.
Tyler_laps_1_to_3 <- tyler_running %>%
  filter(period == (timestamp) %>%
  mutate(lap_number = rank(timestamp),
  filter(lap_number <= 3))
  )

# Plot steps per min by lap number. I think based on the previous chunk of code this is where I am getting the most stuck and I think its because I messed up the wording and structure. 
laps_plot <- ggplot(Tyler_laps_1_to_3, aes(x = lap_number, y = steps_per_minute, color = speed_mph)) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(
    title = "Steps Per Minute by Lap Number",
    x = "Lap Number",
    y = "Steps Per Minute (SPM)",
    color = "Speed_mph"
  )

# This would idealy print the laps plot and portray the data but I messed up somewhere along the way. I think it was in the mutate section with laps 1-3
print(laps_plot)



colnames(tyler_running)
