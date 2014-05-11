electric_usage = read.csv2('household_power_consumption.txt')
electric_usage[, 1] = as.Date(electric_usage[, 1], '%d/%m/%Y')
subset = electric_usage[as.Date('2007-02-01') <= electric_usage$Date, ]
subset = subset[subset$Date <= as.Date('2007-02-02'), ]
dev.copy(png, 'plot2.png', height=480, width=480)
dev.off()