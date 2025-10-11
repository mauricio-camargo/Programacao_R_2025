#### Exemplo 1 ####
id = 1:4
sexo = c('F','M','M','F')
altura = c(1.58, 1.87, 1.75, 1.72)
peso = c(62, 91, 78, 72)
df1 = data.frame(id,sexo,altura,peso)
df1$imc = trunc(df1$peso / df1$altura^2)
df1

# Extrai o elemento da linha 1 e coluna 2.
df1[1,2]  

# Extrai apenas a terceira linha.
df1[3,]   

# Extrai apenas a segunda coluna.
df1[,2]   

# Também extrai a segunda coluna
df1$sexo  

# Extrai a linha 1 e a linha 3 inteiras.
df1[c(1,3),]   

# Extrai a linha 1 e a linha 3 da segunda coluna.
df1[c(1,3),2]   

# Extrai da linha 1 até a linha 3 das colunas de 1 a 3. 
df1[1:3,1:3]   

# Selecionando todas as linhas e 2 colunas.
df1[,c('id','sexo')]  

# Selecionando as linhas com imc > 24
df1[df1$imc > 24, ]  

# Selecionando as linhas das mulheres com peso < 77
df1[(df1$sexo=='F') & (df1$peso < 77) , ]  

# Selecionando as linhas dos homens com peso > 80 e mostrando apemas o id e imc.
df1[(df1$sexo=='M') & (df1$peso > 80) , c('id','imc')]  

#### Exercícios de dataframes ####

local = c('L1','L1','L1','L2','L2','L2')
amostra = c('a1','a2','a3','a1','a2','a3')
abund = c(23,45,0,56,0,25)

dados = data.frame(local,amostra,abund)
dados

# 1 - Extraia o vetor correspondente à primeira coluna.
dados[,1]
# ou
dados$local

# 2 - Extraia o elemento da segunda linha e terceira coluna.
dados[2,3]

# 3 - Extraia apenas as linhas correspondentes aos locais L1.
dados[dados$local == 'L1',]

# 4. Extraia apenas as linhas dos locais L2 em que a abundância seja maior que 30.
dados[(dados$local == 'L2') & (dados$abund > 30) , ]

# 5. Extraia apenas as colunas amostra e abund dos locais L1 em que a abundância seja diferente de zero.
dados[(dados$local == 'L1') & (dados$abund != 0) , ]

# DESAFIO: Crie uma nova coluna no dataframe chamada pres_aus com valores de 1 e 0 para presença e ausência de abundância.

# Sugestão de algoritmo:
#  - crie a coluna dados$pres_aus e atribua o valor zero.
#  - crie um laço FOR de 1 até o comprimento do vetor
#     dados$abund. 
#  - Dentro do laço, crie uma condição IF para testar 
#    se cada valor do vetor dados$abund é igual a zero
#    ou não. 
#  - Se for, atribua o valor de zero para o elemento
#    correspondente do vetor dados$pres_aus.
#  - Caso contrário (ELSE), atribua o valor de 1.

