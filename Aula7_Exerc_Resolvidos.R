# Exemplo de Dataframe (DF) (Slide 5)
estacao = c(rep('V',4) , rep('I',4))
local = rep(c('L1','L2'),4)
set.seed(18)           # Semente dos números aleatórios a seguir
sp1 = trunc(runif(8,0,4))
sp2 = trunc(runif(8,0,12))
sp3 = trunc(runif(8,0,6))
sal = round( rnorm(8,25,8) , 1)
temp = round( rnorm(8,20,6) , 1)
df1 = data.frame(local,estacao,sp1,sp2,sp3,sal,temp)
df1

# Fatores em Dataframes (DF) (Slide 6)
is.factor(df1$estacao)  #False
df1$estacao = as.factor(df1$estacao)  #Transforma o vetor num fator
is.factor(df1$estacao)  #True
df1$estacao

# Funções específicas para DF (Slide 7)
head(df1, 3)      # primeiras linhas
tail(df1, 2)      # últimas
dim(df1) 
nrow(df1) 
ncol(df1)
names(df1)        # nomes das colunas
str(df1)          # estrutura (tipos por coluna)
summary(df1)      # resumo estatístico

# Exercício 1 - fatiando um DF (Slide 9)
# Separe o df1 em três novos DF:
# 1.1. fat (fatores: local e estacao)
fat = df1[1:2]
# 1.2. bio (bióticos: espécies)
# bio (bióticos: espécies)
bio = df1[3:5]
# 1.3.abio (abióticos: sal e temp)
# abio (abióticos: sal e temp)
abio = df1[6:7]

# Exercício 2 - criando novos DF (Slide 10)
# Crie os novos DF:
#2.1. tab_bio = Fatores + dados bióticos apenas
tab_bio = data.frame(fat,bio)
tab_bio
# 2.2. tab_abio = Fatores + dados abióticos apenas
tab_abio = data.frame(fat,abio)
tab_abio
# 2.3. tab_inv = Fatores + dados bióticos e filtrar as linhas de inverno
tab_inv_tot = data.frame(fat,bio)
tab_inv = tab_inv_tot[estacao=='I',]
tab_inv
# 2.4. tab_ver = Fatores + dados bióticos e filtrar as linhas de verão
tab_ver_tot = data.frame(fat,bio)
tab_ver = tab_ver_tot[estacao=='V',]
tab_ver

# Exercício 3 - filtrando um DF (Slide 11)

# 3.1. Crie um novo DF contendo apenas amostras do local L1 do verão
df2 = df1[local=='L1' & estacao=='V',]
df2
# 3.2. Crie um novo DF contendo apenas amostras do inverno com temperatures abaixo de 15 graus.
df3 = df1[estacao=='I',temp<15]
df3
# 3.3. Crie um novo DF contendo apenas amostras com salinidade abaixo de 30 OU temperatures acima de 20 graus.
df4 = df1[sal<30 | temp>20,]
df4
# 3.4. Crie um novo DF contendo apenas amostras do inverno com abundâncias da espécie sp3 diferentes de zero.
df5 = df1[estacao=='I' & sp3 != 0,]
df5
# 3.5. Crie um novo DF contendo apenas amostras do com abundâncias da sp1 E da sp2 maiores que zero.
df6 = df1[sp1>0 & sp3 > 0,]
df6

# Exercício 4 - cálculos com DF (Slide 12)
# 4.1. Calcule o valor médio e o desvio padrão da salinidade de df1
mean(df1$sal)
sd(df1$sal)

# 4.2. Calcule o valor máximo e mínimo da temperatura
max(df1$temp)
min(df1$temp)

# 4.3. Calcule a abundância total das 3 espécies (soma das 3 abundâncias por linha)
abund_tot = df1$sp1 + df1$sp2 + df1$sp3
abund_tot

# 4.4. Calcule a riqueza de espécies das 3 espécies (primeiro crie uma tabela de presença-ausência, depois somar as linhas)

sp1pa=c()
for (i in 1:length(df1$sp1)) {
if (df1$sp1[i]==0)
  sp1pa[i] = 0
else
  sp1pa[i] = 1
}
sp2pa=c()
for (i in 1:length(df1$sp2)) {
  if (df1$sp2[i]==0)
    sp2pa[i] = 0
  else
    sp2pa[i] = 1
}
sp3pa=c()
for (i in 1:length(df1$sp3)) {
  if (df1$sp3[i]==0)
    sp3pa[i] = 0
  else
    sp3pa[i] = 1
}

riq = sp1pa + sp2pa + sp3pa
riq

