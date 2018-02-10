hpc<-read.table("hpc.txt", skip = 66637,  nrow = 2879, sep =";")
names(hpc)<- c("Date","Time","Global.active.power","Global.reactive.power",
               "Voltage","Global.intensity","Sub.metering.1","Sub.metering.2","Sub.metering.3")
hpc<-unite(hpc, Datetime, Date, Time, sep=" ")

hpc$Datetime<-as.POSIXlt(hpc$Datetime, format = "%d/%m/%Y %H:%M:%S")


#PLOT 2 

png(file = "Plot2.png",width = 480, height = 480,units = "px")
with(hpc,plot(Datetime,Global.active.power, ylab = "Global.active.power(Killowatts)",xlab = "",type = "l"))
dev.off()

