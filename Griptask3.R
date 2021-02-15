#### Task 3 : Exploratory Data Analysis - Retail
#### Name   : Snehitha Krishna

library(dplyr)
library(tidyverse)
library(ggplot2)


data<- read.csv("C:/Users/Snehitha/Downloads/SampleSuperstore.csv") 
data
View(data)

# To check Missing Values 
colSums(is.na(data))

#To check structure of data
glimpse(data)

summary(data)

# As, we can see in the dataset the country is US for all the records 
# So,we can remove that column
data <- data[,-3]
View(data)
#even postal code also doesn't make any difference so we can remove that also
data <- data[,-5]
View(data)

# checking wheather any duplicates are there
data<- data %>% distinct()
summary(data)     # All duplicates are removed 

#for checking outliers
ggplot(data=data,mapping= aes(x= Sales,y=Segment))+geom_boxplot(outlier.colour = "black")

#to remove the outliers we replace the values with mean of the sales
sales<- max(data$Sales)
data$Sales<-replace(data$Sales,data$Sales==sales,mean(data$Sales))

#Visualizations
#Sales vs Category
ggplot(data=data,mapping = aes(x=Category,y=Sales,fill=Region))+geom_bar(stat = "identity")
#we see more sales on technology category, east region has more sales.

#Sales vs Quantity
ggplot(data=data,mapping = aes(x=Quantity,y=Sales,fill=Ship.Mode))+geom_bar(stat = "identity")

#Sales vs Profit
ggplot(data=data,mapping = aes(x=Profit,y=Sales,color=Ship.Mode))+geom_point()

#Sales vs discount
ggplot(data=data,mapping = aes(x=Discount,y=Sales,fill=Ship.Mode))+geom_bar(stat = "identity")

#Profits vs Sales
ggplot(data=data,mapping = aes(x=Discount,y=Profit,fill=Ship.Mode))+geom_bar(stat = "identity")
#if more discounts the profits are less. So we need to more focus on discounts,if discounts are more we are seeing losses.

#Profits vs sub.category
ggplot(data=data,mapping = aes(x=Sub.Category,y=Profit,fill=Ship.Mode))+geom_bar(stat = "identity")
#we see that Binders have more losses when compared to others.
# Machines and tables are also showing losses.So we need to focus more on these sales.


