#### EXERCÍCIO 1 ####
# 1.1. Abrir a planilha
dados = readxl::read_excel('plan1.xlsx')
dados
# 1.3. Criar novas planilhas
fat = dados[,1:3]
fat
abio = dados[,4:6]
abio
bio = dados[,7:9]
bio
# 1.4. Criando coluna abund
dados$abund = dados$sp1 + dados$sp2 + dados$sp3
# 1.5. Criando coluna riqueza (primeiro calcule a presença-ausência de cada espécie, depois some todas as linhas)
sp1 = ifelse(dados$sp1 > 0, 1, 0)
sp1
sp2 = ifelse(dados$sp2 > 0, 1, 0)
sp3 = ifelse(dados$sp3 > 0, 1, 0)
dados$riqueza = sp1+sp2+sp3
dados$riqueza

# 1.6. Criando dataframe de índices
indices = data.frame(dados$abund,dados$riqueza)
indices

# 1.7. Extraindo a média de salinidade para cada local
localA = dados[dados$local=='A',]
mean(localA$sal)
localB = dados[dados$local=='B',]
mean(localB$sal)
localC = dados[dados$local=='C',]
mean(localC$sal)

# 1.8. Extraindo a média de temperatura para cada estação 
estacaoC = dados[dados$estacao == 'C',]
mean(estacaoC$temp)
estacaoS = dados[dados$estacao == 'S',]
mean(estacaoS$temp)

# Média da temperatura por local
aggregate(temp ~ local, data = dados, FUN = mean)

# Quantas amostras tenho por local?
aggregate(temp ~ local, data = dados, FUN = length)

# Média da salinidade por local E estação
aggregate(sal ~ local + estacao, data = dados, FUN = mean)

# Para selecionar várias colunas para mostrar: 
aggregate(dados[, c("temp", "sal", "pH")],
           by = list(Local = dados$local,
                     Estacao = dados$estacao),
           data = dados,
           FUN = mean)

library(sqldf)
sqldf('select local, estacao, avg(temp),avg(sal),avg(pH) from dados group by local, estacao') 

#### EXERCÍCIO 2 ####
# 2.1. Abrindo e armazenando a planilha
dad = readxl::read_excel('limno.xlsx')
View(dad)
# 2.3. Criando novos dataframes
fat = dad[,1:4]
bio = dad[,5:24]
abio = dad[,25:30]
# 2.4. 
View(bio)
dad$abund = rowSums(bio)
dad$abund
# 2.5.
verao = dad[dad$estacao == 'Verão',]
veraoSQL = sqldf('select * from dad where estacao="Verão"')
veraoSQL
inverno = dad[dad$estacao == 'Inverno',]
invernoSQL = sqldf('select * from dad where estacao="Inverno"')
primavera = dad[dad$estacao == 'Primavera',]
primaveraSQL = sqldf('select * from dad where estacao="Primavera"')
outono = dad[dad$estacao == 'Outono',]
outonoSQL = sqldf('select * from dad where estacao="Outono"')

# 2.6.
aggregate(dad$abund ~ dad$setor + dad$estacao,data=dad,FUN=mean)
sqldf('select setor,estacao,avg(abund) from dad group by setor,estacao')
