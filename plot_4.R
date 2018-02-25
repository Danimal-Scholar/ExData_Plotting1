
# in case the data are not loaded or the data frame is not in the environment
if (file.exists("power_subsample.csv") != TRUE){
     source(load_power_data.R)
}
if (exists("sub_power_dt")==FALSE){
     
     sub_power_dt <- read.csv("power_subsample.csv") %>% tbl_df()
}
#########################

library(dplyr)
# split into 4 windows

par(mfrow = c(2,2))

# Plot 1
plot(t, sub_power_dt$Global_active_power,"l", col = "black", xlab = "Weekday", ylab = "Global Active Power")

# Plot 2
plot(t, sub_power_dt$Voltage,"l", col = "black", xlab = "Weekday", ylab = "Voltage")

# Plot 3
plot(t, sub_power_dt$Sub_metering_1,"l", col = "black", xlab = "Weekday", ylab = "Energy Sub Metering")
points(t, sub_power_dt$Sub_metering_2,"l", col = "red")
points(t, sub_power_dt$Sub_metering_3,"l", col = "blue")
legend("topright", legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), col = c("black", "red", "blue"), lty = 1)

# Plot 4
plot(t, sub_power_dt$Global_reactive_power,"l", col = "black", xlab = "Weekday", ylab = "Global Reactive Power")

#Tidy up your plot devices
dev.copy(png,"plot4.png")
dev.off()
dev.set(2)