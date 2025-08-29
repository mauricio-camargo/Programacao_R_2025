#Gráficos simples

#Gerando dados aleatórios
set.seed(21)
v=rnorm(50,12,4)

#Construíndo um Histograma
hist(v)#Função de alto nível
text(5,8,'Texto')#Função baixo nível
text(5,9,'Mais um')
points(8,10)
points(9,10)

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col='blue')

hist(v,ylab='Frequência',
     xlab='Classes',
     main='Meu histograma',
     col=c('blue','red','yellow','green'))
text(3,2,'azul')
text(5,4,'laranja')
text(7,6,'amarelo')
text(9,6,'verde')
text(11,7,'azul de novo')
#Tentar plotar com 13
text(13,13,'asd')
#Não aparece
#Refazer o gráfico com ylim=c(0,15),

#### Dividindo a janela ####
set.seed(21)
v=rnorm(50,12,4)
par(mfrow=c(2,1))
hist(v)
boxplot(v,horizontal = T)

#### Dados transformados ####
par(mfrow=c(2,1))
hist(log(v))
boxplot(log(v),horizontal=T,outline = F)
par(mfrow=c(1,1))
qqnorm(v)
qqline(v)

#### Abrindo arquivo Excel ####
library(readxl)
dados=read_excel('planilha1.xlsx') #O arquivo do script (Aula2.R) e do Excel têm que estar na mesma pasta.
#Pode-se usar a funcionalidade "Import dataset" do Rstudio.
dados
dados$dep
dados$fator1
hist(dados$dep)
boxplot(dados$dep)


#### Gráficos básicos ####
#Criando um gráfico de barras sem dispersão
table(dados$fator1)
barplot(table(dados$fator1))

#Gráficos qqplot
qqnorm(dados$dep)
qqline(dados$dep)

#Graficando com erro padrão
library(sciplot)
bargraph.CI(dados$fator1,dados$dep,lc=F,ylim=c(0,25))
abline(h=0)

dados
dados$fator2

bargraph.CI(fator1,dep, factor(fator2),data=dados)

text(1.5,20,'A1')
text(2.5,26,'A2') #Fica fora

#Usando ylim()
bargraph.CI(fator1,dep, factor(fator2), ylim=c(0,28),data=dados)
text(1.5,20,'A1')
text(2.5,27,'A2') #Agora está dentro

text(4.5,15,'B1')
text(5.5,14,'B2')

