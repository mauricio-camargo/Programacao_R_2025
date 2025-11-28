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
sqldf('select * from tab') 
# Seleciona apenas a primeira colunas e todas as linhas
sqldf('select col1 from tab') 
# Seleciona as duas primeira colunas e todas as linhas
sqldf('select col1,col2 from tab') 
# Filtro para as linhas (usando where)
sqldf('select * from tab where col1="A" ') 
sqldf('select * from tab where col1="A" and col2=3')
sqldf('select * from tab where col1="A" or col2=3') 
# Cálculos de médias (avg), soma (sum), contagem (count) etc.  
sqldf('select avg(col3) from tab')  
# Cálculos por grupos (usando group by)
sqldf('select avg(col3) from tab group by col1') 
# Adicionando col1
sqldf('select col1, avg(col3) from tab group by col1') 

# A sentença abaixo cria mesma tabela que usamos com aggregate() na aula passada. 
mediasAbundSQL = sqldf('select setor, estacao, avg(abund) from dad group by setor,estacao')
mediasAbundSQL
