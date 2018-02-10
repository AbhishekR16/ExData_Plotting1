hpc<-read.table("hpc.txt", skip = 66637,  nrow = 2879, sep =";")
names(hpc)<- c("Date","Time","Global.active.power","Global.reactive.power",
               "Voltage","Global.intensity","Sub.metering.1","Sub.metering.2","Sub.metering.3")
hpc<-unite(hpc, Datetime, Date, Time, sep=" ")

hpc$Datetime<-as.POSIXlt(hpc$Datetime, format = "%d/%m/%Y %H:%M:%S")

#PLOT 4

png(file = "Plot4.png",width = 480, height = 480,units = "px")
par(mfrow = c(2,2))
 
with(hpc,plot(Datetime,Global.active.power, ylab = "Global.active.power(Killowatts)",xlab = "",type = "l"))
with(hpc,plot(Datetime,Voltage, ylab = "Voltage",xlab = "Datetime",type = "l"))

with(hpc,plot(Datetime,Sub.metering.1,type = "n",ann = FALSE))
with(hpc,lines(Datetime,Sub.metering.1)) 
with(hpc,lines(Datetime,Sub.metering.2,col="red")) 
with(hpc,lines(Datetime,Sub.metering.3,col="blue"))
legend("topright",pch ="_",col=c("black","red","blue"),border = "white",
       legend = c("Sub.metering.1","Sub.metering.2","Sub.metering.3"))
title(ylab="Energy Sub metering")

with(hpc,plot(Datetime,Global.reactive.power, ylab = "Global.reactive.power(Killowatts)",xlab = "Datetime",type = "l"))

dev.off()