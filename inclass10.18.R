#this is classwork from 10/18

str(CO2)
fit <- lm(uptake ~ conc, data = CO2)
summary(fit)
str(fit)
fitted(fit)
resid <-residuals(fit)
hist(resid, col="orange", "border"="pink")

plot(CO2$conc, CO2$uptake, main = "Conc by Uptake")
#add the line of best fit
abline(fit)

fit4 <- lm(uptake ~ conc + I(conc**0.3)+ Treatment*Type,
           data=CO2)
summary(fit4)

plot(fit4)
