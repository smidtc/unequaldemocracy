# Unequal Democracy Reproduction Data

These are from the ANES 1952-2012 CDF and the 2016 ANES Time Series, via [electionstudies.org](http://electionstudies.org).

### Figure 3.1, original

```r
library(ggplot2)
figure31 <- read.csv("figure31.csv")
figure31$Percent <- figure31$Proportion*100
figure31$StdErr <- figure31$SE*100
figure31plot <- ggplot(data=figure31,aes(Year,color=Education)) + geom_pointrange(aes(y=Percent,ymin=Percent-1.96*StdErr,ymax=Percent+1.96*StdErr),alpha=.5) + geom_line(aes(y=Percent),lwd=2,alpha=.5)  + ylim(c(0,100)) + ylab("Democratic share of two-party vote (%)") + ggtitle("Bartels Figure 3.1: White Presidential Vote by Education Level, (1952-2016 ANES)")  + theme_minimal()+ theme(legend.pos=c(.8,.8))

![Figure 3.1](https://github.com/smidtc/unequaldemocracy/figure31.png)

```

