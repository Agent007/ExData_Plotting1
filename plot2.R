download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', 'household_power_consumption.zip', 'curl')
unzip('household_power_consumption.zip')
electric_usage = read.csv2('household_power_consumption.txt')
electric_usage[, 1] = as.Date(electric_usage[, 1], '%d/%m/%Y')
subset = electric_usage[as.Date('2007-02-01') <= electric_usage$Date, ]
subset = subset[subset$Date <= as.Date('2007-02-02'), ]
subset$datetime = strptime(paste(subset$Date, subset$Time), '%Y-%m-%d %T')
plot(subset$datetime, subset$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()