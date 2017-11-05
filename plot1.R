data <- './Rproject/household_power_consumption.txt'
household_power_consumption <- read.table(data,sep = ';', header = TRUE, stringsAsFactors = FALSE)

household_power_consumption$Date <- as.Date(strptime(household_power_consumption$Date,'%d/%m/%Y'))
head(household_power_consumption)
attach(household_power_consumption)
twodays <- household_power_consumption[Date == '2007-02-01'| Date == '2007-02-02' ,]
detach(household_power_consumption)
attach(twodays)
head(twodays)
twodays$Global_active_power <- as.numeric(Global_active_power)
hist(Global_active_power, col = 'red', freq = TRUE, xlab = 'Global Active Power (kilowatts)',main = 'Global Active Power')

dev.copy(png,'plot1.png')
dev.off()





























