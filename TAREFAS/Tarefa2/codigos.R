library(readxl)
library(sqldf)
library(sciplot)

df = read_excel('rio_doce.xlsx')

function
for
if
else
ifelse
SQL



#Certifique-se que a tabela é um dataframe e que os fatores estão todos corretos:
#ponto: de 1 a 35
#mes: Maio, Junho, Julho e Agosto
#estacao: Outono e Inverno 
#segmento: Alto, Médio 1, Médio 2, Baixo e Estuário
#impacto: Sim e Não
df = as.data.frame(df)
ponto = as.factor(df$ponto)
mes = as.factor(df$mes)
estacao = as.factor(df$estacao)
segmento = as.factor(df$segmento)
impacto = as.factor(df$impacto)

#1. Explore graficamente "var", criando histogramas, boxplot, qqplot e interprete a configuração da distribuição dos dados. O que acontece com as curvas se aplicamos um logarítmo a esses dados?

var = df$ssd
hist(var)
boxplot(var ~ segmento,outline = F)
qqnorm(var)
qqline(var)
Lvar = log(var)
hist(Lvar)
boxplot(Lvar ~ segmento,outline = F)
qqnorm(Lvar)
qqline(Lvar)

par(mfrow=c(2,3)) #Roda de novo os gráficos


par(mfrow=c(1,1)) #Roda de novo os gráficos
bargraph.CI(segmento,var,lc = F)
bargraph.CI(impacto,var,lc = F)
bargraph.CI(estacao,var,lc = F)
bargraph.CI(segmento,var,impacto,lc = F)
bargraph.CI(impacto,var,mes,lc = F)

sqldf('select estacao,segmento,impacto,avg(ssd),stdev(ssd) from df group by estacao,segmento,impacto ORDER BY impacto')

