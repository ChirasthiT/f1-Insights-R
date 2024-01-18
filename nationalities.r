#This is to get insights from data from kaggle
#Data set used - Formula 1 World Championship (1950 - 2023)
#https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

library(tidyverse)
library(dplyr)

# Driver Naitonalities

drivers = read.csv("f1_data/drivers.csv")

head(drivers)
unique(drivers$nationality)
#  [1] "British"           "German"            "Spanish"          
#  [4] "Finnish"           "Japanese"          "French"           
#  [7] "Polish"            "Brazilian"         "Italian"          
# [10] "Australian"        "Austrian"          "American"         
# [13] "Dutch"             "Colombian"         "Portuguese"       
# [16] "Canadian"          "Indian"            "Hungarian"        
# [19] "Irish"             "Danish"            "Argentine"        
# [22] "Czech"             "Malaysian"         "Swiss"            
# [25] "Belgian"           "Monegasque"        "Swedish"          
# [28] "Venezuelan"        "New Zealander"     "Chilean"          
# [31] "Mexican"           "South African"     "Liechtensteiner"  
# [34] "Rhodesian"         "American-Italian"  "Uruguayan"        
# [37] "Argentine-Italian" "Thai"              "East German"      
# [40] "Russian"           "Indonesian"        "Chinese"  

nationalities = count(drivers, nationality)
nationalities

plot = ggplot(nationalities, aes(x = "", y = n, fill = nationality)) +
geom_bar(stat = "identity") +
coord_polar(theta = "y") +
theme_void() +
labs(title = "F1 Insights - Driver Nationalities", subtitle = "https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020") +
theme(legend.position = "bottom", plot.title = element_text(hjust = 0.5, size = 16), plot.subtitle = element_text(hjust = 0.5, size = 14))

plot

ggsave("plot.png", plot, height = 2400, width = 1600, units = "px")

