##Gfk pet food analysis

petfood <- read.csv("ols pet food.csv")

##regression of effect on total sales value
effect <- lm(tot_salesvalue ~ conglomerate +foodform+preservation+natural+year, data=petfood)

#effect on foodform
foodform <- lm(tot_salesvalue ~ foodform+year, data=petfood)

#effect on conglomerate
conglomerate <- lm(tot_salesvalue ~ conglomerate, data=petfood)

##pounds sold regression
poundseffect<- lm(tot_totalweight ~ conglomerate+foodform+preservation+natural+year, data=petfood)


##regression results
summary(poundseffect)
summary(effect)
summary(typeeffect)
summary(foodform)
summary(conglomerate)

#plot effect 
plot(effect)

#heteroskedasticity tests
kappa(typeeffect)
ncvtest(effect)
vif(effect)