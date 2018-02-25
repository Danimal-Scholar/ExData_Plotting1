
# in case the data are not loaded or the data frame is not in the environment
if (file.exists("power_subsample.csv") != TRUE){
     source(load_power_data.R)
}
if (exists("sub_power_dt")==FALSE){
     
     sub_power_dt <- read.csv("power_subsample.csv") %>% tbl_df()
}
########################

library(dplyr)
par(mfrow = c(1,1))
plot_1_dat <- sub_power_dt %>% select(Global_active_power)
with(plot_1_dat, hist(Global_active_power,xlab = "Global Active Power (kilowatts)",ylab = "Frequency"
                      ,col = "red", main= "Global Active Power"))


#Tidy up your plot devices
dev.copy(png,"plot1.png")
dev.off()
dev.set(2)