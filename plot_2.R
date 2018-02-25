
# in case the data are not loaded or the data frame is not in the environment
if (file.exists("power_subsample.csv") != TRUE){
     source(load_power_data.R)
}
if (exists("sub_power_dt")==FALSE){
     
sub_power_dt <- read.csv("power_subsample.csv") %>% tbl_df()
}
#####################

library(dplyr)
par(mfrow = c(1,1))
plot_2_dat <- sub_power_dt %>% select(Date_Time,Global_active_power)
with(plot_2_dat, plot(Date_Time, Global_active_power,xlab = "Weekday",ylab = "Global Active Power (kilowatts)"
                      ,"l", main= "How about a Title?"))


#Tidy up your plot devices
dev.copy(png,"plot2.png")
dev.off()
dev.set(2)