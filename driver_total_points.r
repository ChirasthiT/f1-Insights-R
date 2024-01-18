#This is to get insights from data from kaggle
#Data set used - Formula 1 World Championship (1950 - 2023)
#https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

library(tidyverse)
library(dplyr)

#Importing necessary data
driver_details <- read.csv("f1_data/drivers.csv")
driver_standings <- read.csv("f1_data/driver_standings.csv")

head(driver_details)
head(driver_standings)

details_and_standings <- merge(driver_details, driver_standings, by  = "driverId")

head(details_and_standings)

totalpoints <- driver_standings %>% group_by(driverId) %>% summarise(totalpoints = sum(points))

head(totalpoints)
totalpoints

selectedColumns <- driver_details[, c("driverId", "driverRef")]

ref_id <- data.frame(driverId = selectedColumns$driverId, driverRef = selectedColumns$driverRef)

final <- merge(ref_id, totalpoints, by = "driverId")

head(final)

pngfile <- ggplot(final, aes(x = totalpoints, y = driverRef)) + 
labs(title = "F1 Insights Most points 1950 - 2023", 
    subtitle = "https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020", 
    x = "Points", 
    y = "Driver References") + 
    geom_bar(stat = "identity", fill = "skyblue") +
    scale_x_continuous(breaks = seq(0, 50000, by = 5000)) + 
theme_minimal() 

pngfile
png(filename = "your_output_file.png", width = 3000, height = 6000)

dim(final)

which.max(final$totalpoints)
# [1] 1
max(final$totalpoints)
# [1] 46550.5
final$driverRef[final$driverId == which.max(final$totalpoints)]
# [1] "hamilton"