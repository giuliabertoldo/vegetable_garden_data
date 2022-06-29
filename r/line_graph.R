# Load packages
library(readxl)
library(tidyverse)

# Load data
df <- read_xlsx("eggs.xlsx")

# Explore data
glimpse(df)

# Calculate percentege eggs old and chickens
# Convert date type
df <- df %>%
  mutate(perc_egg_old = round((egg_old/chicken_old)*100, 2),
         perc_egg_new = round((egg_new/chicken_new)*100, 2))

# Line graph only old
plot_old <- ggplot(data=df, aes(x=date, y=perc_egg_old)) +
  geom_line()+
  geom_point()+
  theme_bw()+
  labs(title = "Uova: Galline Vecchie",
       subtitle = "Percentuale di galline che hanno prodotto uova per giorno",
       y = "Percentuale galline",
       x = "Data")
plot_old

# Line graph only new
plot_new <- ggplot(data=df, aes(x=date, y=perc_egg_new)) +
  geom_line()+
  geom_point()+
  theme_bw()+
  labs(title = "Uova: Galline Nuove",
       subtitle = "Percentuale di galline che hanno prodotto uova per giorno",
       y = "Percentuale galline",
       x = "Data")
plot_new

# Line graph with two groups
