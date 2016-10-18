donationdata<- read.csv("~/Documents/BC grad courses/big data course/segmentation and emails sent/5pct Summary & Demographics trimmed(UNTOUCHED).csv")

data(donationdata)

## 75% of the sample size
smp_donationdata <- floor(0.75 * nrow(donationdata))

## set the seed to make your partition reproductible
set.seed(123)
train_ind <- sample(seq_len(nrow(donationdata)), size = smp_donationdata)

#store datasets in variables
train <- donationdata[train_ind, ]
test <- donationdata[-train_ind, ]

#run regression on undergraduate schools
schoolcontribute <-lm(lifetime_cash~ugrad_school,
                      data = train)
summary(schoolcontribute)

#run regression on home state
hstatecontribute <-lm(lifetime_cash~home_state,
                      data=train)
summary(hstatecontribute)

