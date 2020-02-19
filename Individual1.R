library(readxl)
library(ggplot2)
library(ggmosaic)
install.packages("ggpubr")
library(ggpubr)
dat <- read_xls('../ds202_lab3/Data/GSS.xls')

colnames(dat)
colnames(dat) <- c("Year", "id", "Work_per_wk", "Marital_Status", "Spouse_Education", "Sex", "Political_Party", "General_Happiness", "Ballot_used")
dat
ggplot(dat) + geom_mosaic(aes(x = product(Marital_Status, Sex), fill = General_Happiness))

dat$G
dat

ggplot(dat, aes(x = dat$`General happiness`, fill = dat$`Marital status`)) + geom_bar()
plotMale <- ggplot(dat) + ggtitle('Happiness vs Marital Status in Females') + geom_bar(data = dat[dat$Sex == 'Female', ], aes(x = General_Happiness, fill = Marital_Status)) + theme(legend.position = "none")  
plotFemale <- ggplot(dat) + ggtitle('Happiness vs Marital Status in Males') + geom_bar(data = dat[dat$Sex == 'Male', ], aes(x = General_Happiness, fill = Marital_Status))
ggarrange(plotMale, plotFemale)
