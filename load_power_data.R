

library(dplyr)



#loads entire file using character specifications to keep the time down

columns <-c("character", "character","numeric","numeric","numeric","numeric",
                 "numeric","numeric","numeric")
power <- read.table("household_power_consumption.txt",header = TRUE, sep = ";"
                         , colClasses = columns, na.strings = "?")
     
#turns into a DPLYR-friendly table, split into two DF's 
# one WITH date and time, one without them (dt means data table not "Date Time" :(  )
power_dt <- tbl_df(power)
Date_Time <- select(power_dt,Date,Time)
power_dt <- select(power_dt, -(Date:Time))
     

# slaps the POSIXlt together and formats it as a full date/time entity
paste_date_time <- as.data.frame(paste(Date_Time$Date,Date_Time$Time))
names(paste_date_time) <- "Date_Time"
Date_Time <-strptime(paste_date_time$Date_Time,format = "%d/%m/%Y %H:%M:%S")
Date_Time <- as.data.frame(Date_Time, "Date_Time")
     

# recombines the data frame and turns into a DPLYR data frame     

power_dt <- tbl_df(cbind.data.frame(Date_Time,power_dt))
sub_power_dt <- filter(power_dt, Date_Time >="2007-02-01" & Date_Time <"2007-02-03")

#cleans up some variables (big enough to notice)     
     rm(paste_date_time)
     rm(power)
     rm(Date_Time)
     
#saves the file for later
     
write.csv(sub_power_dt,"power_subsample.csv")
