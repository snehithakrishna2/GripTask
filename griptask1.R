data1 <- read.csv(url("http://bit.ly/w-data"))
data1
head(data1)
plot(data1)

summary(data1)
library(caTools)
set.seed(23)
sam <- sample.split(data1,SplitRatio = 0.7)
train <- subset(data1,sam == "TRUE")
train
test <- subset(data1,sam=="FALSE")
test

model <- lm(Scores~.,data = train)
summary(model)


# prediction

pred<- predict(model,test)
pred