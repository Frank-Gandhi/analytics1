#finding how people take decisions to bye products
# creating Decision Tree
#install packages -rpart, rpart.plot, Rcolorbrewer

library(rpart) # doing classification
library(rpart.plot) # visualising the tree

#Dataset
str(iris)
head(iris)
summary(iris)
names(iris)

#classification Tree


#predict Species
ctree=rpart(Species~.,method='class',data=iris)
ctree=rpart(Species~Petal.Length + Petal.Width + Sepal.Length + Sepal.Width,method='class',data=iris)
