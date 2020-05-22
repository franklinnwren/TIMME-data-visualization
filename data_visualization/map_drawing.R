library(ggplot2)
library(dplyr)
library(reshape2)
library(choroplethr)
library(choroplethrMaps)
library(gridExtra)
library(knitr)

graph20 <- read.delim("20+.csv", sep=",")
graph20$value = graph20$Polarity
choro = StateChoropleth$new(graph20)
choro$title = "20+"
choro$ggplot_scale = scale_fill_manual(name="Polarity", values=c("#0000FF", "#3333FF", "#6666FF", "#9999FF", "#FF9999","#FF6666", "#FF3333", "#FF0000"), drop=FALSE)
choro$render()

graph50 <- read.delim("50+.csv", sep=",")
graph50$value = graph50$Polarity
choro = StateChoropleth$new(graph50)
choro$title = "50+"
choro$ggplot_scale = scale_fill_manual(name="Polarity", values=c("#0000FF", "#3333FF", "#6666FF", "#9999FF", "#FF9999","#FF6666", "#FF3333", "#FF0000"), drop=FALSE)
choro$render()
