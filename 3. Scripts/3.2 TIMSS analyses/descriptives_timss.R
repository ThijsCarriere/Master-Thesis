
### Descriptive statistics ###
##############################


### 1. Packages and data ###

# Needed packages
library(tidyverse)
library(lubridate)

# Load in data
foo <- read_csv("../../2. Data/2.2 Preprocessed data/mimic_df_raw_times.csv")

foo$tot <- apply(foo[,15:45], 1, sum)
foo$mean.time <- apply(foo[,46:76], 1, mean, na.rm = TRUE)

### 2. Adjustments to data frame before analyses ###

# Select relevant columns
df <- foo |> 
  select(person_id, country = IDCNTRY, school = IDSCHOOL, gender = ITSEX, ME52024: ME72209t)
glimpse(df)

# responses
responses = df |> 
  select(person_id:ME72209)

responses = responses |> 
  pivot_longer(cols = starts_with("ME"),
               names_to = "item_id",
               values_to = "response")

# respons times + in good format
times = df |> 
  select(person_id:gender, ME52024t: ME72209t)

times = times |> 
  pivot_longer(cols = starts_with("ME"),
               names_to = "item_id",
               values_to = "time")

times = times |> 
  mutate(item_id = gsub('.{1}$', '', item_id))

dim(times)
dim(responses)

# Merging dFs
df = responses |> 
  inner_join(times)
dim(df)


### 3. Descriptive plots ###

# Plot of mean country accuracy
df |> 
  group_by(country) |> 
  dplyr::summarise(m = mean(response, na.rm = T),
            sd = sd(response, na.rm =T),
            n = n()) |> 
  ggplot(aes( x= reorder(country, m), y = m))+
  geom_point()+
  geom_errorbar(aes(ymin = m-sd/ sqrt(n)*2, ymax = m+sd/ sqrt(n)*2), width = 0.2)+
  coord_flip()

# Histograms of response times per country
df |>
  filter(time< 300) |> 
  ggplot(aes( x= time))+
  geom_histogram()+
  facet_wrap( ~ country)

# Figure 3 for the Thesis
# Plot of percentage correct answers by item per country
df |> 
  group_by(country, item_id) |> 
  dplyr::summarise(m = mean(response, na.rm = T)) |> 
  ggplot(aes( x= reorder(item_id, m), y = m))+
  geom_point(aes(col = country))+
  coord_flip() + 
  ylab("percentage of correct responses") +
  xlab("test item") +
  theme_bw() +
  theme(axis.line = element_line(color='black'),
        plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank())

# Plot of mean response time per country
df |> 
  group_by(country) |> 
  dplyr::summarise(m = mean(time, na.rm = T),
            sd = sd(time, na.rm =T),
            n = n()) |> 
  ggplot(aes( x= reorder(country, m), y = m))+
  geom_point()+
  geom_errorbar(aes(ymin = m-sd/ sqrt(n)*2, ymax = m+sd/ sqrt(n)*2), width = 0.2)+
  coord_flip() +
ylab("mean response time") +
  xlab("country") +
  theme_bw() +
  theme(axis.line = element_line(color='black'),
        plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank())


# Figure 4 of Thesis
# Plot of mean response time by item per country

df |> 
  group_by(country, item_id) |> 
  dplyr::summarise(m = mean(time, na.rm = T)) |> 
  ggplot(aes( x= reorder(item_id, m), y = m))+
  geom_point(aes(col = country))+
  coord_flip() +
  ylab("mean response time") +
  xlab("test item") +
  theme_bw() +
  theme(axis.line = element_line(color='black'),
        plot.background = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank())

# Correlations between speed and correct answer
df |> 
  group_by(country, item_id) |>
  dplyr::summarize(cor = cor(response, time, use = "complete.obs")) |> 
  ggplot(aes(x = reorder(item_id, cor),y = cor))+
  geom_point(aes(col = country))+
  coord_flip()

# plot of correlation per item per country
df |> 
  group_by(country, item_id) |>
  dplyr::summarize(cor = cor(response, time, use = "complete.obs")) |> 
  ggplot(aes(x = reorder(item_id, cor),y = cor))+
  geom_point()+
  coord_flip()+
  facet_wrap(~country)


### 4. General descriptive Statistics ###

# Overall correlation between accuracy and correct response
cor(foo$tot, foo$mean.time, use = "complete.obs") # 0.0029


# Summary statistics on item level per country
summary.stats <- as.data.frame(df) %>% dplyr::group_by(country,item_id) %>% dplyr::summarise(p.value = mean(response), mean.time = mean(time, na.rm = TRUE), correlation = cor(response, time, use = "complete.obs"))
View(summary.stats)

# Summary statistics per country
big.sum <- summary.stats %>% group_by(country) %>% dplyr::summarise("Time" = mean(mean.time), "Acc" = mean(p.value))
View(big.sum)

# Correlation between accuracy and response time on country level
cor(big.sum$Time, big.sum$Acc) #  -0.90976


### 5. Summary statistics per item (Table 4) ###

# Summary statistics per item
summs <- df %>% group_by(item_id) %>% dplyr::summarise(cor = cor(time, response, use = "complete.obs"), acc = mean(response, na.rm = TRUE), time = mean(time, na.rm = TRUE))

View(summs)


### 6. Summary statistics per country (Table 3) ###

# Country accuracy
df %>% group_by(country) %>% dplyr::summarise(mean(response), sd(response))

# Country correct number of items
foo %>% group_by(IDCNTRY) %>% dplyr::summarise(mean(tot), sd(tot))

# Recode unrealistic times
df$time <- ifelse(df$time > 400, 400, df$time)
plot(df$time[df$country == "ENG"])

# Response times for table 3 summary statistics
df %>% group_by(country)%>% dplyr::summarise(mean = mean(time, na.rm = T), sd = sd(time, na.rm = T))


### 7. Session info ###

# Obtain sessionInfo
sessionInfo()
