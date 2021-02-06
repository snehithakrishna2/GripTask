#import dataset
data1 <- read.csv("http://bit.ly/w-data")
data1
#Summary of data
summary(data1)
plot(data1)

# Creating a data frame for predicting scores for 9.25 study hours
data2 <- as.data.frame(9.25)
data2
colnames(data2)<- "Hours"

#Create scatter plot
ggplot(data= data1,mapping = aes(x=Hours, y=Scores))+geom_point()+geom_smooth(method = "lm")

#Correlation 
cor(data1$Hours,data1$Scores)

#model creation
model <- lm(Scores~.,data = data1)
model

#predicting scores
pred<- predict(model,newdata = data2)
pred
