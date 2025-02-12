library(ggplot2)
library(dplyr)
library(reshape2)
library(choroplethr)
library(choroplethrMaps)
library(gridExtra)
library(knitr)

f1 <- read.delim("50+_predictions.csv")
f1$twitter_id <- as.character(f1$twitter_id)
f2 <- read.delim("formatted_location.csv")
f2$twitter_id <- as.character(f2$twitter_id)
f3 <- left_join(f1,f2)
f3 <- filter(f3, Country!="Unknown")
f3 <- filter(f3, State!="Unknown")
small_table <- f3 %>% select(twitter_id, State, party)
agg <- dcast(small_table, State ~ party)
total_count <- mutate(agg, sum = R+D)
pct_count <- mutate(total_count, Dem = (D/sum)*100, Rep = (R/sum)*100)
colnames(pct_count)[1] <- "abb"
data(state.regions)
polarity50 <- left_join(state.regions, pct_count)
write.csv(polarity50,'50+.csv')

f1 <- read.delim("20+_predictions.csv")
f1$twitter_id <- as.character(f1$twitter_id)
f2 <- read.delim("formatted_location.csv")
f2$twitter_id <- as.character(f2$twitter_id)
f3 <- left_join(f1,f2)
f3 <- filter(f3, Country!="Unknown")
f3 <- filter(f3, State!="Unknown")
small_table <- f3 %>% select(twitter_id, State, party)
agg <- dcast(small_table, State ~ party)
total_count <- mutate(agg, sum = R+D)
pct_count <- mutate(total_count, Dem = (D/sum)*100, Rep = (R/sum)*100)
colnames(pct_count)[1] <- "abb"
data(state.regions)
polarity20 <- left_join(state.regions, pct_count)
write.csv(polarity20,'20+.csv')
