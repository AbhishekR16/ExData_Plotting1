hpc<-read.table("hpc.txt", skip = 66637,  nrow = 2879, sep =";")
names(hpc)<- c("Date","Time","Global.active.power","Global.reactive.power",
   "Voltage","Global.intensity","Sub.metering.1","Sub.metering.2","Sub.metering.3")

hpc$Time<-strptime(hpc$Time, format = "%H:%M:%S")
hpc$Date<-as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Time<- format(hpc$Time, "%H:%M:%S")


# PLot 1

png(file = "Plot1.png",width = 480, height = 480,units = "px")
hist(hpc$Global.active.power, main =" Global Active Power",xlab = "Global Active Power (Kilowatts)",col="red")
dev.off()