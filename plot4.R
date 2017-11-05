data <- './Rproject/household_power_consumption.txt'
household_power_consumption <- read.table(data,sep = ';', header = TRUE, stringsAsFactors = FALSE)
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date,'%d/%m/%Y'))
attach(household_power_consumption)
twodays <- household_power_consumption[Date == '2007-02-01'| Date == '2007-02-02' ,]
detach(household_power_consumption)
attach(twodays)

twodays$Global_active_power <- as.numeric(Global_active_power)
Sys.setlocale("LC_TIME", "C") ## As I'm not in USA, I have to transform the system.

twodays$Datetime <- paste(Date,Time)
twodays$Datetime <- as.POSIXct(twodays$Datetime)
attach(twodays)
op <- par(no.readonly=TRUE)
par(mfrow=c(2,2))
plot(Datetime,Global_active_power,xlab='',ylab='Global Active Power',type='l')
plot(Datetime,Voltage,xlab='datetime',type='l')
plot(Datetime,Sub_metering_1,type = 'l', ylab = 'Energy sub metering',xlab="")
lines(Datetime,Sub_metering_2,col = "red")
lines(Datetime,Sub_metering_3,col = "blue")
legends <-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend("topright",legend = legends, col = c("black","red","blue"),lty =1,cex = 1,bty="n")
plot(Datetime,Global_reactive_power,xlab='datetime',type='l')
detach(twodays)
par(op)

dev.copy(png,'plot4.png')
dev.off()