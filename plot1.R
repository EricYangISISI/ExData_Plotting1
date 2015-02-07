source("subDataset.R")
plot1 <- function(data=NULL){
  #if subdata is not available, run subDataset()
  is(is.null(data))
    data <- subDataset()
  #set png size
  png("plot1.png", width=480, height=480)
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  
  dev.off()
}