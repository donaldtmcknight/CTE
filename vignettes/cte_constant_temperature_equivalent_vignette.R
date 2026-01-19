## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

if (!requireNamespace("dplyr", quietly = TRUE)) {
  knitr::knit_exit()
}

## -----------------------------------------------------------------------------
library("CTE")
library("dplyr")
data(example_temp_data)

#extract data for nest 2, which only has 1 day of data
nest2 <- example_temp_data[example_temp_data$nest == "nest2",]

#calculate the mean (M)
daily.mean <- mean(nest2$temp)

#calculate the maximum deviation from the mean (R)
#take the difference between the maximum and mean temp and difference between mean 
# and minimum temp. The larger of the two values will be R.
daily.dev <- max(
              (max(nest2$temp)-daily.mean),
              (daily.mean-min(nest2$temp))
              )

#The T0 value (temp below which no development occurs) cannot be calculated from the
# data and has to be determined based on the biology of the study species. 
# We will use T0 = 16 for our example. 
#We will run CTE using the calculated values and leave t and max.it on their defaults
cte.res <- CTE(M = daily.mean, R = daily.dev,T0 = 16)

cte.res

## -----------------------------------------------------------------------------
cte.res2 <- CTE(M = daily.mean, R = daily.dev,T0 = 16,t=.01)

cte.res
cte.res2


## -----------------------------------------------------------------------------
#calculate M (daily mean) and R (daily.dev) for each nest for each date.
daily.values <- example_temp_data %>% 
  group_by(nest,date) %>% 
  dplyr::summarize(daily.mean = mean(temp),
                   daily.dev = max(
              (max(temp)-mean(temp)),
              (mean(temp)-min(temp))
              ))

daily.values

#calculate CTE for each nest for each date
#CTE will be added as a new column
daily.values <- daily.values %>% 
  group_by(nest,date) %>% 
  dplyr::mutate(CTE=CTE(M = daily.mean,
                        R=daily.dev,T0=16)) 

daily.values 

