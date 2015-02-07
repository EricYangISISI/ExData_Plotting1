subDataset <- function(){
  #Get UCI consumption Dataset
  if(!file.exists("exdata-data-household_power_consumption.zip")){
    downloadFile <- tempfile()
    
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", downloadFile)
    
    consumptionFile <- unzip(downloadFile)
    
    unlink(downloadFile)
    
  }
  
  df <- read.table(consumptionFile,header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),
                   na="?")
  
  # convert date and time variables to Date/Time class
  df$Time <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")
  df$Date <- as.Date(df$Date, "%d/%m/%Y")
  # only use data from the dates 2007-02-01 and 2007-02-02
  dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
  df <- subset(df, Date %in% dates)
  
  return(df)
}

