# logisitic regression
library(ISLR)
data(Default)
head(Default)
str(Default)

head(Default[Default$default=='Yes',])

table(Default$student)
(t1=table(Default$default, Default$student))
addmargins(t1,FUN=mean)

library(dplyr)
Default %>% group_by(student,default) %>% summarise(n())
Default %>% group_by(student,default) %>% summarise(mean(income),mean(balance))


# create a logistic model
#modelname=function(Y~X1 + X2 +....., data=_____,...)

logit1=glm(default~income + balance + student,family='binomial',data=Default)
summary(logit1) # shows that income is signicant


#are all Iv signicant- No (income)
logit2=glm(default~balance + student,family='binomial',data=Default)
summary(logit2)

ndata=data.frame(balance=mean(Default$balance),student="Yes")
(p1=predict(logit2,newdata=ndata,type='response'))

ndata=data.frame(balance=1486,student="Yes")
(p1=predict(logit2,newdata=ndata,type='response'))
