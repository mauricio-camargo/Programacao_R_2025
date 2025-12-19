#### Exercícios aula 11 ####
# 1.1. Abrir a planilha
library(readxl)
dados = read_excel('planilha.TCC.xlsx')
View(dados)
library(sqldf)
dad = sqldf('SELECT * FROM dados WHERE Setor <> "NA"')
View(dad)
o2 = dad$oxigenio
par(mfrow=c(2,1))
hist(o2)
boxplot(o2,horizontal = T)

grafs = function(vet) {
  par(mfrow=c(2,1))
  hist(vet,main=paste('Gráfico de ',name(vet))
  boxplot(vet,horizontal=T,outline=F)
}

grafs(o2)
grafs(dad$temperatura)
grafs(dad$pH)


grafsT = function() {
  for (i in 4:ncol(dad)) {
   par(mfrow=c(2,1))
   col = dad[,i]
#   tiff(filename = paste0('H',names(dad)[i]),'.tiff')
   hist(col,main=paste('Gráfico de ',names(dad)[i]))
#   dev.off()
#   tiff(filename = paste('B',names(dad)[i]),'.tiff')
   boxplot(col,horizontal=T,outline=F)
#   dev.off()
  }
}

grafsT()

#gráficos de média
library(sciplot)
bargraph.CI(dad$estacao,dad$temperatura,
            dad$Setor, legend = T,lc = F,
            x.leg=1,
            main='titu',ylim=c(15,30),
            col= c('blue','red','yellow','green'))
abline(h=15)
text(12,28,'oi')
