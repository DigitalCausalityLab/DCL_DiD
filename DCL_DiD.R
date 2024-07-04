
##Install packages

install.packages("ggplot2")
install.packages("wooldridge")
install.packages("lmtest")
install.packages("multiwayvcov")
install.packages("gghighlight")
install.packages("rmarkdown")
library (lmtest)
library (multiwayvcov)
library (wooldridge )
library(ggplot2)
library(dplyr)
library(gghighlight)
library(rmarkdown)


## Load data

setwd("C:~")
testdata <- read.csv("testdata.CSV", sep=";")
```

## Prepare and illustrate the data


testdata <- testdata %>%
  mutate(
    group = case_when(
      wage == 0 & year < 1981 ~ "wage_0_pre",
      wage == 0 & year >= 1981 ~ "wage_0_post",
      wage == 1 & year < 1981 ~ "wage_1_pre",
      wage == 1 & year >= 1981 ~ "wage_1_post"
    )
  )

## Plot the DiD

testdata$wage = as.factor(testdata$wage)
ggplot(data = testdata, aes(x = year, y = employ, color = wage)) +
  geom_point() +
  stat_summary(fun = mean, geom = "line", aes(group = wage), linetype = "solid") +
  geom_vline(xintercept = 1981, color = "red", linetype = "dashed") +
  labs(
    x = "Year",
    y = "Employment in Percentage",
    color = "Group",
    title = "Impact of Minimum Wage Introduction on Employment",
    subtitle = "Difference-in-Differences Analysis"
  ) +
  scale_color_manual(values = c("red", "green"), labels = c("no min wage", "min wage")) +
  theme_minimal()



## Naive estimation of the treatment


mean_post_treatment <- testdata %>%
  filter(year >= 1981 & wage == 1) %>%
  summarize(mean_employ = mean(employ))%>%
  print(mean_post_treatment) 


mean_post_non_treatment <- testdata %>%
  filter(year >= 1981 & wage == 0) %>%
  summarize(mean_employ = mean(employ))%>%
  print(mean_post_non_treatment) 


print(mean_post_treatment - mean_post_non_treatment)

## Estimation that accounts for business-cycles (common trend)


mean_pre_non_treatment <- testdata %>%
  filter(year < 1981 & wage == 0) %>%
  summarize(mean_employ = mean(employ))

print(mean_pre_non_treatment)

mean_post_non_treatment <- testdata %>%
  filter(year >= 1981 & wage == 0) %>%
  summarize(mean_employ = mean(employ))

print(mean_post_non_treatment)


print(mean_post_non_treatment - mean_pre_non_treatment)


## Better estimation employing the DiD-Design


mean_pre_treatment <- testdata %>%
  filter(year < 1981 & wage == 1) %>%
  summarize(mean_employ = mean(employ))


diff_d1.1 <-  mean_pre_treatment - mean_pre_non_treatment 
print(diff_d1.1)


diff_d1.2 <- mean_post_treatment - mean_post_non_treatment
print(diff_d1.2)


att <- diff_d1.2 - diff_d1.1
print(att)

## Withh att we end up with our corrected estimation taking the common trends into consideration 

