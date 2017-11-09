# Unequal Democracy Reproduction Data

These are from the ANES 1952-2012 CDF and the 2016 ANES Time Series, via [electionstudies.org](http://electionstudies.org).

### Figure 3.1

```r
library(ggplot2)
figure31 <- read.csv("figure31.csv")
figure31$Percent <- figure31$Proportion*100
figure31$StdErr <- figure31$SE*100
figure31plot <- ggplot(data=figure31,aes(Year,color=Education)) + geom_pointrange(aes(y=Percent,ymin=Percent-1.96*StdErr,ymax=Percent+1.96*StdErr),alpha=.5) + geom_line(aes(y=Percent),lwd=2,alpha=.5)  + ylim(c(0,100)) + ylab("Democratic share of two-party vote (%)") + ggtitle("Bartels Figure 3.1: White Presidential Vote by Education Level, (1952-2016 ANES)")  + theme_minimal()+ theme(legend.pos=c(.8,.8))
```

![Figure 3.1](https://github.com/smidtc/unequaldemocracy/raw/master/figure31.png)

### Figure 3.2

```r
library(ggplot2)
figure32 <- read.csv("figure32.csv")
figure32$Percent <- figure32$Proportion*100
figure32$StdErr <- figure32$SE*100
figure32plot <- ggplot(data=figure32,aes(Year,color=Income)) + geom_pointrange(aes(y=Percent,ymin=Percent-1.96*StdErr,ymax=Percent+1.96*StdErr),alpha=.5) + geom_smooth(aes(y=Percent,weight=1/StdErr),method = "lm", formula = y ~ splines::ns(x, 3)) + ylim(c(0,100)) + ylab("Democratic share of two-party vote (%)") + ggtitle("Bartels Figure 3.2: White Presidential Vote by Income Class, (1952-2016 ANES)")  + theme_minimal()+ theme(legend.pos=c(.8,.8))
ggsave("figure32.png",plot=figure32plot,width=9,height=7)
```

![Figure 3.2](https://github.com/smidtc/unequaldemocracy/raw/master/figure32.png)

### Figure 3.3

```r
library(ggplot2)
figure33 <- read.csv("figure33.csv")
figure33$Margin <- figure33$Margin*100
figure33plot <- ggplot(data=figure33,aes(Year,Margin,color=Income)) + geom_point(aes(y=Margin),alpha=.5) + geom_smooth(method = "lm", formula = y ~ splines::ns(x, 3)) + ylab("Democratic margin (%)") + ggtitle("Bartels Figure 3.3: White Presidential Party Identification by Income Class, (1952-2016 ANES)")  + theme_minimal()+ theme(legend.pos=c(.8,.8))
ggsave("figure33.png",plot=figure33plot,width=9,height=7)

```

![Figure 3.3](https://github.com/smidtc/unequaldemocracy/raw/master/figure33.png)
