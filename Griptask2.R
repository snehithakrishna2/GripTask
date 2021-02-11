iris <- read.csv("C:/Users/Snehitha/Downloads/Iris.csv")
View(iris)

# storing the original iris dataset into one more data frame. 
iris1 <- iris

# removing the class column as it is labeled.
iris1 <- iris1[,-6]

# removing the Id column where we will not require that column.
iris1 <- iris1[,-1]

#Checking whether any missing data is available.
colSums(is.na(iris1))

# For finding optimum number of clusters
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")
  wss
}

wssplot(iris1)

#There is inflection point or "elbow of the graph" at k = 3, total optimum clusters is 3 
#install cluster package
#applying k means clustering
result <- kmeans(iris1,centers = 3)
result

result$size

result$cluster


# Visualization of clustering 
clusplot(iris1, result$cluster, color= TRUE, shade=FALSE,lines = 0)

#this is visualizing the data using original iris data
clusplot(iris, result$cluster, color= TRUE, shade=FALSE,lines = 0)
