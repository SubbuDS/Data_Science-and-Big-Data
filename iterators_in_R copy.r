millimeter_measurements <- c(10000, 54900, 94312, 49185, 2100)
meter_measurements <- c()
for (measurement in millimeter_measurements) {
  meter <- measurement / 1000
  meter_measurements <- c(meter_measurements, meter)
}



millimeter_measurements <- c(10000, 54900, 94312, 49185, 2100)
meter_measurements <- integer(length(millimeter_measurements))
indices <- 1:length(millimeter_measurements)

for (i in indices) {
  calc <- millimeter_measurements[i] / 1000
  meter_measurements[i] <- calc
}


-----------------------------------------
nums <- 1:10
is_condition_met <- FALSE
i <- 1

# Loop execution
while (!is_condition_met) {

  print(paste("The loop has run", i, "time(s)"))

  current_num <- nums[i] # Grab a number using the index

  print(paste("current_num is currently:", current_num))  
    
  is_condition_met <- current_num > 7 # Recheck the condition
    
  print(paste("is_condition_met is currently:", is_condition_met))
    
  i = i + 1 # Increase the index

  print(paste("The index i has been set to:", i))    
    
}

-----------------------------------------

prices <- c(138.19, 82.72, 118.97, 77.55, 62.28, 89.71, 97.36, 91.98, 113.45, 73.93)
is_below_70 <- FALSE
i <- 1
while (!is_below_70) {
  current_price <- prices[i]
  is_below_70 <- current_price < 70
  i = i + 1
}

buy_price <- current_price

------------------------------------

