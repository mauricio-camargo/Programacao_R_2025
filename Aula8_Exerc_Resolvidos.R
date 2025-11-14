#### EXERCÍCIO 1 ####
# 1.1. Baixar a planilha e armazenar
dados = readxl::read_excel('plan1.xlsx')
dados
# 1.3. Criando novos dataframes
fat = dados[,1:3]
fat
abio = dados[,4:6]
abio
bio = dados[7:9]
bio
# 1.4. Criando coluna abund
dados$abund = dados$sp1+dados$sp2+dados$sp3
# 1.5. Criando coluna riqueza (primeiro crie vetores de presença-ausência para cada espécie usando ifelse, depois some os vetores))
sp1 = ifelse(dados$sp1 > 0, 1, 0)
sp2 = ifelse(dados$sp2 > 0, 1, 0)
sp3 = ifelse(dados$sp3 > 0, 1, 0)
dados$riqueza = sp1+sp2+sp3
# 1.6. Criando novo dataframe de índices
indices = data.frame(dados$abund,dados$riqueza)
# 1.7. Extraindo as médias de salinidade para cada local
localA = dados[dados$local == 'A',]
mean(localA$sal)
localB = dados[dados$local == 'B',]
mean(localB$sal)
localC = dados[dados$local == 'C',]
mean(localC$sal)
# 1.8. Extraindo as médias de temperatura para cada estação
estacaoC = dados[dados$estacao == 'C',]
mean(estacaoC$temp)
estacaoS = dados[dados$estacao == 'S',]
mean(estacaoS$temp)

# Média da temperatura por local
aggregate(temp ~ local, data = dados, FUN = mean)

# Desvio padrão da temperatura por local
aggregate(temp ~ local, data = dados, FUN = sd)

# Média da salinidade por local E estação
aggregate(sal ~ local + estacao, data = dados, FUN = mean)

# Soma da abundância por estação
aggregate(sp1 ~ estacao, data = dados, FUN = sum)

# Quantas amostras tenho por local?
aggregate(temp ~ local, data = dados, FUN = length)

# Para selecionar várias colunas para mostrar: 
aggregate(dados[, c("temp", "sal", "pH")],
           by = list(Local = dados$local,
                     Estacao = dados$estacao),
           data = dados,
           FUN = mean)

#### Exercício 2 ####
# 2.1. Abrir e armazenar a planilha limno.xlsx
dad = readxl::read_excel('limno.xlsx')
dad
# 2.3. Criando novos dataframes
fat = dad[,1:4]
fat
bio = dad[,4:24]
bio
abio = dad[,25:30]
abio
# 2.3. Criando coluna abund
dad$abund = rowSums(bio)
# 2.4. Criando um dataframe para cada estação 
chuva = dad[dad$estacao == 'C',]
seca = dad[dad$estacao == 'S',]
# 2.5. Extraindo a média da abundância da combinação estacao e setor
mediasAbund = aggregate(dad[,"abund"],
                by = list(Local = dad$setor,
                          Estacao = dad$estacao),
                data = dad,
                FUN = mean)
mediasAbund
