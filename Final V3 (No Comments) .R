# Final V3 - No Help Comments

setwd("~/Desktop/PSCI 390 Final Project")
getwd()

library(plotly)
library(tidyverse)
library(ggpubr)

data.final<- read.csv("Refugee Final.csv")

require(gridExtra)
require(scales)

# Side by Side Comparison of Greece and Turkey: Refugees and Cases #4

refugee.plot.1 <- ggplot(data = data.final, aes( x = Years)) + geom_point(aes(y = Greece.Refugee),
color = "blue") + geom_point(aes(y = Turkey.Refugee), color = "red") + scale_x_continuous(breaks=seq(2010,2019,1), name = "Year") + scale_y_continuous(name = " # of Refugees Emigrationg to Greece & Turkey", labels = comma) 

cases.plot.2 <- ggplot(data = data.final, aes( x = Years)) + geom_point(aes(y = Greece.Case), color= "blue") + geom_point(aes(y= Turkey.Case), color = "red") + scale_x_continuous(breaks=seq(2010,2019,1), name = "Year") + scale_y_continuous(name= " Number of Human Rights Violations against Greece & Turkey") 

grid.arrange(refugee.plot.1, cases.plot.2, ncol=2)


# Side by Side Comparison of Greece self, and Turkey self in regards to refuges and cases. #5

refugee.plot.3 <- ggplot(data = data.final, aes(x = Years)) + geom_point(aes(y = Greece.Refugee), color = "blue") + geom_point(aes(y= Greece.Case), color = "steelblue3") + scale_x_continuous(breaks=seq(2010,2019,1), name = "Year") + scale_y_continuous(name = " Greece Cases & Refugee Comparison")

refugee.plot.4 <- ggplot(data = data.final, aes(x = Years)) + geom_point(aes(y = Turkey.Refugee), color = "red") + geom_point(aes(y = Turkey.Case), color = "pink1") + scale_x_continuous(breaks=seq(2010,2019,1), name = "Year") + scale_y_continuous(name = "Turkey Cases & Refugee Comparison", labels = comma)

grid.arrange(refugee.plot.3, refugee.plot.4, ncol=2)

# Interactive Visualization Slide #4 & Slide #5 -> Slide 6

first.slide <- subplot (refugee.plot.1, cases.plot.2)
ggplotly(first.slide)

second.slide <- subplot (refugee.plot.3, refugee.plot.4)
ggplotly(second.slide)

# Side by Side Comparison of Greece and Turkey Refugees and Cases in regards to correlation ; #7

correlation.plot.1 <- ggscatter(data.final, x = "Greece.Case", y = "Turkey.Case", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Greece Cases", ylab = "Turkey Cases")

correlation.plot.2 <- ggscatter(data.final, x = "Greece.Refugee", y = "Turkey.Refugee", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Greece Refugees", ylab = "Turkey Refugees") + scale_y_continuous( labels = comma)

grid.arrange(correlation.plot.1, correlation.plot.2, ncol=2)
# Side by Side of Greece Self, and Turkey Self in regards to correlation in Refugees and Cases ; #8

correlation.plot.3 <- ggscatter(data.final, x = "Greece.Case", y = "Greece.Refugee", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Greece Cases", ylab = "Greece Refugees")

correlation.plot.4 <- ggscatter(data.final, x = "Turkey.Case", y = "Turkey.Refugee", add = "reg.line", conf.int = TRUE, cor.coef = TRUE, cor.method = "pearson", xlab = "Turkey Cases", ylab = "Turkey Refugees") + scale_y_continuous(labels = comma) 

grid.arrange(correlation.plot.3, correlation.plot.4, ncol=2)

# Visualization of Slide #7 & #8 -> #9

fourth.slide <- subplot(correlation.plot.1, correlation.plot.2)
ggplotly(fourth.slide) 

fifth.slide <- subplot(correlation.plot.3, correlation.plot.4)
ggplotly(fifth.slide)

# End of R 
# R with comments will be uploaded to github