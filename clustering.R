#clustering- simple dataset- Marks in 2 subjects

A=c(1,1.5,3,5,3.5,4.5,3.5)
B=c(1,2,4,7,5,5,4.5)
(marks=data.frame(A,B))
(c1=kmeans(marks,centers=3))
cbind(marks,c1$cluster)
plot(marks, pch=10,col=c1$cluster)
c1$cluster
points(c1$centers,col=1:3,pch=23,cex=2)


#clustering iris data set

head(iris)
str(iris$Species)
table(iris$Species)
irisfeatures=iris[,-5] # to remove the 5th column
head(irisfeatures) #see the 5th column is removed
(iriskm1=kmeans(irisfeatures,centers = 3))
iriskm1$centers
colMeans(irisfeatures[iriskm1$cluster==1,])
(iris[iriskm1$cluster==1,])

iriskm1$size #no of rows in each cluster



#selecting the number of cluster
library(NbClust)
data=iris[,-5]
head(data)
(km1=kmeans(data,centers = 1))
km1$tot.withinss
km1$withinss

(km2=kmeans(data,centers=2))
km2$tot.withinss
km2$withinss


(km3=kmeans(data,centers=3))
km3$tot.withinss
km3$withinss


(km4=kmeans(data,centers=4))
km4$tot.withinss
km4$withinss


(km5=kmeans(data,centers=5))
km5$tot.withinss
km5$withinss

library(NbClust)
(nc=NbClust(data,distance = "euclidean",min.nc = 2,max.nc = 15,method = "average"))


#clustering of mtcars
names(mtcars)
(data2=mtcars[c('mpg','disp','hp','wt')])
(nc=NbClust(data2,distance = "euclidean",min.nc = 2,max.nc = 15,method = "average"))
