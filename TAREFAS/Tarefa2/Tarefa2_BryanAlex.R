#### 12/12/2025 ####
### Bryan Alex - 156292 ###

library(readxl)
library(sqldf)
library(car)
library(sciplot)
desastre <- read_excel("rio_doce.xlsx")

var = desastre$chumbo
par(mfrow=c (2,3))
hist(var, main="Histograma do Chumbo", xlab="Chumbo (mg/L")
boxplot(var, horizontal =TRUE, main="Boxplot do Chumbo")
qqPlot(var, main="Chumbo")

var_log=log1p(var)

hist(var_log, main="Histograma log(chumbo)")
boxplot(var_log, horizontal=TRUE)
car::qqPlot(var_log)

par(mfrow=c (2,3))
lineplot.CI(segmento, chumbo, data=desastre, xlab="Segmento", ylab="Chumbo (mg/L)",main="Chumbo entre os segmentos")
lineplot.CI(impacto, chumbo, data=desastre,xlab="Impacto", ylab="Chumbo (mg/L)",main="Chumbo entre áreas impactadas e não impactadas")
lineplot.CI(estacao, chumbo, data=desastre, xlab="Estação do ano", ylab="Chumbo (mg/L)",main="Chumbo entre estações do ano")
lineplot.CI(segmento, chumbo, group=impacto, data=desastre,xlab="Segmento", ylab="Chumbo (mg/L)",main="Chumbo por segmento",legend=TRUE)
lineplot.CI(mes, chumbo, group=impacto, data=desastre,xlab="Mês", ylab="Chumbo (mg/L)",main="Chumbo por mês",legend=TRUE)

tapply(desastre$chumbo, desastre$segmento, mean)
tapply(desastre$chumbo, desastre$segmento, var)
tapply(desastre$chumbo, desastre$impacto, var)


