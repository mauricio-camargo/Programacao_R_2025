#### Breve aula demonstrativa de SQL (Structured Query Language) #### 
library(sqldf)

# SQL é muito fácil. Vamos começar criando um dataframe rudimentar chamado `tab`. 
set.seed(12)
col1 = c(rep('A',4),rep('B',4))
col2 = trunc(runif(8,0,4))
col3 = rnorm(8,10,4)
tab = data.frame(col1,col2,col3)
tab

# A função sqldf() cria um novo dataframe baseado na seleção feita pela linguagem SQL, que é muito simples. Exemplos:
# Seleciona todas as colunas (*) e todas as linhas
sqldf('SELECT * FROM tab') 
# Seleciona apenas a primeira colunas e todas as linhas
sqldf('SELECT col1 FROM tab') 
# Seleciona as duas primeira colunas e todas as linhas
sqldf('SELECT col1,col2 FROM tab') 
# Filtro para as linhas (usando where)
sqldf('SELECT * FROM tab WHERE col1="A" ') 
sqldf('SELECT * FROM tab WHERE col1="A" and col2=3')
sqldf('SELECT * FROM tab WHERE col1="A" or col2=3') 
# Cálculos de médias (AVG), desvio padrão (STDEV), soma (SUM), contagem (COUNT) etc.  
sqldf('SELECT avg(col3) FROM tab')  
# Cálculos por grupos (usando group by)
sqldf('SELECT avg(col3) FROM tab GROUP BY col1') 
# Adicionando col1
sqldf('SELECT col1, avg(col3) FROM tab GROUP BY col1') 

# A sentença abaixo cria mesma tabela que usamos com aggregate() na aula passada. 
mediasAbundSQL = sqldf('SELECT setor, estacao, AVG(abund) FROM dad GROUP BY setor,estacao')
mediasAbundSQL
