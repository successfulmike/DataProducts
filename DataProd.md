Predict Diamond Prices
========================================================
author: Michael Patterson
date: July 26, 2015
transition: rotate

First Slide
========================================================
The diamond industry is a very lucrative, yet competitive industry. Gain an edge by

- Having the latest data available in real-time
- Knowing where to best locate diamonds
- Knowing what to pay per carat in real-time

Actual Use Case
========================================================
Say you were presented with the opportunity to quickly (less than 5 seconds) decide whether to buy 3 rough cut diamonds weighing 0.16, 0.27, and 0.34. Buy them now for really cheap the guy says, but what's the REAL value?

Let's load some data to see what the market's typically paying overall.


```r
library(UsingR)
library(ggplot2)
data(diamond)
summary(diamond)
```

```
     carat            price       
 Min.   :0.1200   Min.   : 223.0  
 1st Qu.:0.1600   1st Qu.: 337.5  
 Median :0.1800   Median : 428.5  
 Mean   :0.2042   Mean   : 500.1  
 3rd Qu.:0.2500   3rd Qu.: 657.0  
 Max.   :0.3500   Max.   :1086.0  
```

```r
fit <- lm(price ~ carat, data = diamond)
coef(fit)
```

```
(Intercept)       carat 
  -259.6259   3721.0249 
```

Here's What You Should Pay
=================================

```r
fit2 <- lm(price ~ I(carat - mean(carat)), data = diamond)
fit3 <- lm(price ~ I(carat * 10), data = diamond)

newx <- c(0.16, 0.27, 0.34)
predict(fit, newdata = data.frame(carat = newx))
```

```
        1         2         3 
 335.7381  745.0508 1005.5225 
```

Plotting Diamond Prices
========================================================

![plot of chunk unnamed-chunk-3](DataProd-figure/unnamed-chunk-3-1.png) 

Knowledge is Power
=========================
There you have it! When you're equipped with the right information AND what it means, you can tell the difference between bargains and bankruptcy :-)
