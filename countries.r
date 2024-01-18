#This is to get insights from data from kaggle
#Data set used - Formula 1 World Championship (1950 - 2023)
#https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020

# Including tidyverse library
library(tidyverse)
library(dplyr)

# Importing the csv file
circuits <- read.csv("f1_data/circuits.csv")

dim(circuits)

head(circuits)

unique(circuits$country)
#  [1] "Australia"     "Malaysia"      "Bahrain"       "Spain"        
#  [5] "Turkey"        "Monaco"        "Canada"        "France"       
#  [9] "UK"            "Germany"       "Hungary"       "Belgium"      
# [13] "Italy"         "Singapore"     "Japan"         "China"        
# [17] "Brazil"        "USA"           "United States" "UAE"          
# [21] "Argentina"     "Portugal"      "South Africa"  "Mexico"       
# [25] "Korea"         "Netherlands"   "Sweden"        "Austria"      
# [29] "Morocco"       "Switzerland"   "India"         "Russia"       
# [33] "Azerbaijan"    "Saudi Arabia"  "Qatar"   
# Two different names for USA, USA and United States

circuits$country <- ifelse(circuits$country == "United States", "USA", circuits$country)

unique(circuits$country)
#  [1] "Australia"    "Malaysia"     "Bahrain"      "Spain"        "Turkey"      
#  [6] "Monaco"       "Canada"       "France"       "UK"           "Germany"     
# [11] "Hungary"      "Belgium"      "Italy"        "Singapore"    "Japan"       
# [16] "China"        "Brazil"       "USA"          "UAE"          "Argentina"   
# [21] "Portugal"     "South Africa" "Mexico"       "Korea"        "Netherlands" 
# [26] "Sweden"       "Austria"      "Morocco"      "Switzerland"  "India"       
# [31] "Russia"       "Azerbaijan"   "Saudi Arabia" "Qatar" 

circuit_unique_values = count(circuits, country)
head(circuit_unique_values)


plot = ggplot(circuit_unique_values, aes(x = country, y = n, fill = n)) +
labs(title = "F1 insights Countries that have the most number of circuits",
    subtitle = "https://www.kaggle.com/datasets/rohanrao/formula-1-world-championship-1950-2020",
    x = "Countries",
    y = "Count") +
geom_bar(stat = "identity")

ggsave("plot.png", plot, width = 7000, height = 2400, units = "px", dpi = 300)
