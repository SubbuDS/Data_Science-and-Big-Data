millimeter_measurements <- c(10000, 54900, 94312, 49185, 2100)
meter_measurements <- c()
for (measurement in millimeter_measurements) {
  meter <- measurement / 1000
  meter_measurements <- c(meter_measurements, meter)
}


