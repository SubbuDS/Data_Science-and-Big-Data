library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
new_recent_grads <- recent_grads %>% 
  mutate(
    median_level = if_else(Median > 50000, "Above Average", "Below Average"),
    greater_prop_gender = if_else(Women > Men, "Women", "Men")
  )
  
  
  -----------------
  wpm <- 70
if (wpm < 58) {
  classification <- "Below Average"
} else if (wpm > 82) {
  classification <- "Above Average"
} else {
  classification <- "Average"
}

--------------------------

wpm <- 70
if (wpm >= 68 && wpm <= 82) {
  classification <- "Average"
} else {
  classification <- "Not Average"
}

--------------------------

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
new_recent_grads <- recent_grads %>% 
  mutate(
    unemployment_level = case_when(
      Unemployment_rate < 0.05 ~ "Low",
      Unemployment_rate >= 0.05 & Unemployment_rate < 0.1 ~ "Moderate",
      Unemployment_rate >= 0.1 ~ "High"
    )
  )
  
--------------------------------------

library(tidyverse)
recent_grads <- read_csv("recent_grads.csv")
arts_grads <- recent_grads %>% 
  filter(
    Major_category %in% c("Arts", "Humanities and Liberal Arts")
  )

non_engineering_science_grads <- recent_grads %>% 
  filter(
    !(Major_category %in% c("Engineering", "Physical Sciences"))
  )
  
---------------------------------------

