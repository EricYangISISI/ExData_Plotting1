source("subDataset.R")
plot2 <- function(data=NULL){
  #if subdata is not available, run subDataset()
  is(is.null(data))
  data <- subDataset()
  #set png size
  png("plot2.png", width=480, height=480)
  
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
}