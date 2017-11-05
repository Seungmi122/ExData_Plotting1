data <- './Rproject/household_power_consumption.txt'
household_power_consumption <- read.table(data,sep = ';', header = TRUE, stringsAsFactors = FALSE)
household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date,'%d/%m/%Y'))
attach(household_power_consumption)
twodays <- household_power_consumption[Date == '2007-02-01'| Date == '2007-02-02' ,]
detach(household_power_consumption)
attach(twodays)
Sys.setlocale("LC_TIME", "C") ## As I'm not in USA, I have to transform the system.

twodays$Datetime <- paste(Date,Time)
twodays$Datetime <- as.POSIXct(twodays$Datetime)
attach(twodays)
plot(Datetime,Global_active_power,type = 'l', ylab = 'Global Active Power (kilowatts)',xlab="")

dev.copy(png,'plot2.png')
dev.off()






















