#simple linear regression
women
# predict weight for height- 67.5

fit=lm(weight~height, data=women) # for simple regression 
summary(fit)
# in summary p value is less than 0.05 then linear regression model exist.
# so it means there is one independent variable x exist for change in y.
(ndata1 = data.frame(height=c(67.5,69.5)))
(p1=predict(fit, newdata=ndata1,type='response'))
cbind(ndata1,p1)
range(women$height)
# for different values
(ndata1 = data.frame(height=c(70:80)))
(p1=predict(fit, newdata=ndata1,type='response'))
cbind(ndata1,p1)






