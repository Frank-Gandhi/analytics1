# variable created

gender=sample(x=c('Male','Female'),size=1000,replace = T,prob=c(0.5,0.5))
buy=sample(x=c('Buy','NotBuy'),size=1000,replace = T,prob=c(0.5,0.5))
married=sample(x=c('Married','Single'),size=1000,replace = T,prob=c(0.3,0.7))
age=ceiling(runif(1000,22,30))
course=sample(x=c('Phd','MBA','BBA'),size=1000,replace = T,prob=c(0.3,0.4,0.3))
students=data.frame(buy,gender,married,age,course)
head(students)

(ctree=rpart(buy~.,data=students))
library(rpart.plot)
rpart.plot(ctree,nn=T,cex=0.9)

names(students)
ndata1=data.frame(gender='Male',age=27, course='MBA', married='Single')
(p1=predict(ctree, newdata = ndata1, type='class'))
(p2=predict(ctree, newdata = ndata1, type='prob'))
cbind(ndata1,p1,p2)

# cp is complexcity parameter
(ctree2=rpart(buy~.,data=students,cp=-1))
rpart.plot(ctree2,nn=T,cex=1)
printcp(ctree2)

(ctree2b=prune(ctree,cp=0.0015528))
rpart.plot(ctree2b,nn=T)

# for more examples
ndata1=data.frame(gender=c('Male','Female'),age=c(25:30), course=c('MBA','BBA'), married=c('Single','Married'))
(p1=predict(ctree, newdata = ndata1, type='class'))
(p2=predict(ctree, newdata = ndata1, type='prob'))
cbind(ndata1,p1,p2)


