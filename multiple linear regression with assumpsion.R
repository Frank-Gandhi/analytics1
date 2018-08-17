#multiple linear regression
url="https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=1595306231"
omni=as.data.frame(gsheet::gsheet2tbl(url))
head(omni)

#predict data for different combination of price and promotion
mlmodel1=lm(sqty~price + promotion, data=omni)
summary(mlmodel1)
# sqty=5837-(53*price)+(3.6*promotion)

(ndata1=data.frame(price=c(65,69),promotion=c(250,300)))
(sqty=predict(mlmodel1, newdata=ndata1,type='response'))
cbind(ndata1,sqty)

#predict data for omni
#check assumptions for linear regression
# 1. is there linear relationship b/w in independent and dependent variable 
car::crPlot(mlmodel1)
#2. do residues have equal variance(homoscedascity)
plot(mlmodel1)
par(mfrow=c(1,1))
plot(mlmodel1,which=1)
#3. points around staight red line
#4. are the regression normally distributed
plot(density(residuals(mlmodel1)))

plot(mlmodel1,which=2)
#5. is their auto correlation
car::durbinWatsonTest(mlmodel1)
# if p value >0.05, there is auto correlation
#6. is their multi collinearity
car::vif(mlmodel1)

#7. are their significant outliers which can attect model1
plot(mlmodel1,4)


#predict data for new values of Iv
(ndata1=data.frame(price=c(60:70),promotion=c(seq(250,350,by=10))))
range(omni$price) ; range(omni$promotion)
(sqty=predict(mlmodel1,newdata=ndata1,type='response'))
cbind(ndata1,sqty)





