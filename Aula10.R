#### Exercícios aula 10 ####
# Exercício 1
# 1.1. Abrir a planilha
dados = readxl::read_excel('plan1.xlsx')
View(dados)

# 1.2. Crie 3 novos dataframes a partir de dados:
#  - fat (local e estacao)
#  - abio (sal, temp e pH)
#  - bio (sp1, sp2 e sp3)

library(sqldf)
fat = sqldf('SELECT local,estacao FROM dados')
fat
abio = sqldf('SELECT sal,temp,pH from dados')
abio
bio = sqldf('SELECT sp1,sp2,sp3 from dados')
bio

# Use a cláusura AS para mudar de nome da coluna.
sqldf('SELECT local AS Local,estacao AS Estação from dados')

# 1.3. Extraia as amostras do local “A”.
sqldf('SELECT * FROM dados WHERE local="A"')

# 1.4. Extraia as amostras do local “A” ou “B”.
sqldf('SELECT * FROM dados WHERE local="A" OR local="B"  ')

# 1.5. Extraia as amostras do local “A” e estacao “S”.
sqldf('SELECT * FROM dados WHERE local="A" AND estacao="S" ')

# 1.6. Extraia as amostras do local “B” que contêm salinidade maior que 17.
sqldf('SELECT * FROM dados WHERE local="B" AND sal > 17 ')

# 1.7. Extraia a média geral da salinidade.
sqldf('SELECT avg(sal) FROM dados')

# 1.8. Extraia as médias de salinidade para cada local.
sqldf('SELECT local, avg(sal) FROM dados GROUP BY local')
sqldf('SELECT local, estacao, avg(sal) FROM dados GROUP BY local')

# 1.9. Extraia os desvios padrão de temperatura para cada estacao.
sqldf('SELECT estacao,stdev(temp) FROM dados GROUP BY estacao')

# 1.10. Extraia o desvio padrão da temperatura para o local “B” e estacao “S”.
sqldf('SELECT local,estacao,stdev(temp) FROM dados WHERE local="B" AND estacao="S"')

# 1.11. Extraia a soma da abundância das 3 espécies por estação.
sqldf('SELECT estacao,sum(sp1) AS especie1,sum(sp2) AS especie2,sum(sp3) AS especie3 FROM dados GROUP BY estacao')

# Exemplo de parametrização, usando uma variável reciclável.
fat = 'estacao'
sqldf(paste('SELECT estacao,sum(sp1) AS especie1,sum(sp2) AS especie2,sum(sp3) AS especie3 FROM dados GROUP BY ',fat))

# 1.12. Extraia o número de observações por local.

sqldf('SELECT local,COUNT(local) FROM dados GROUP BY local')

# Extraindo o número de observações na combinação local e estacao.
sqldf('SELECT local,estacao,COUNT(local) FROM dados GROUP BY local,estacao')

# 1.13. Extraia a média da abundância da combinação de estacao e local.
sqldf('SELECT local,estacao,avg(sp1) AS espécie1,avg(sp2) AS espécie2,avg(sp3) AS espécie3 FROM dados GROUP BY local,estacao')

# 1.14. Crie uma nova coluna chamada abund correspondente à abundância total das espécies em cada amostra.

sqldf('SELECT * , (sp1+sp2+sp3) AS abund FROM dados')

# 1.15. Crie uma nova coluna chamada riqueza contendo a riqueza de espécies, ou seja, o número de espécies em cada amostra.

sqldf('SELECT *, 
      (CASE WHEN sp1 > 0 THEN 1 ELSE 0 END+
      CASE WHEN sp2 > 0 THEN 1 ELSE 0 END+
      CASE WHEN sp3 > 0 THEN 1 ELSE 0 END)
      AS riqueza FROM dados')

# OU .....

sqldf('SELECT *,((sp1>0)+(sp2>0)+(sp3>0)) AS riqueza FROM dados')

# 1.16. Crie um novo dataframe chamado indices contendo os novos índices de abundância e riqueza recém criados.

sqldf('SELECT *,((sp1>0)+(sp2>0)+(sp3>0)) AS riqueza, (sp1+sp2+sp3) AS abund FROM dados')

# Exercício 2. Planilha Oceanografia química

# 2.1. Abrir a planilha
tcc = readxl::read_excel('planilha.TCC.xlsx')
View(tcc)

# 2.2. Criar um novo DF extraindo da planilha apenas as linhas que contêm dados para o Setor (Exclui as linhas com setor vazio).
library(sqldf)
tcc1 = sqldf('SELECT * FROM tcc WHERE Setor <> "" ')
View(tcc1)

# 2.3. Criar uma planilha para cada estação do ano, chamadas verao, outono, primavera e inverno.
verao = sqldf('SELECT * FROM tcc1 WHERE estacao = "V" ')
inverno = sqldf('SELECT * FROM tcc1 WHERE estacao = "I" ')
primavera = sqldf('SELECT * FROM tcc1 WHERE estacao = "P" ')
outono = sqldf('SELECT * FROM tcc1 WHERE estacao = "O" ')

# 2.4. Extrair a média da salinidade estre os setores.
sqldf('SELECT Setor,avg(salinidade) AS Salinidade 
      FROM tcc1 
      GROUP BY Setor')
#agora o desvio padrão
sqldf('SELECT Setor,avg(salinidade) AS Média, 
      stdev(salinidade) AS DP 
      FROM tcc1 
      GROUP BY Setor')

# 2.5. Extrair a média da salinidade estre os locais.
sqldf('SELECT local,avg(salinidade) AS Salinidade 
      FROM tcc1 
      GROUP BY local')

# 2.6. Extrair a média da salinidade estre os setores e estacao.
sqldf('SELECT Setor,estacao,avg(salinidade) AS Salinidade 
      FROM tcc1 
      GROUP BY setor,estacao')

# 2.7. Extrair as médias e os desvios padrão de salinidade e turbidez para a combinação setor e estacao.
sqldf('SELECT 
        Setor,
        estacao,
        avg(salinidade) AS Sal_Media,
        stdev(salinidade) AS Sal_DP,
        avg(turbidez) AS Turb_Media,
        stdev(turbidez) AS Turb_DP 
      FROM tcc1
      GROUP BY 
        Setor,
        estacao')

# 2.8. Criar um novo DF contendo mais uma coluna, correspondente ao Nitrogênio Total. 
df1 = sqldf('SELECT *,(nat+amonia+nitrito) FROM tcc1 AS NT')

# 2.9. Crie um DF sem as amostras com clorofila igual a zero.  
df2 = sqldf('SELECT * FROM tcc1 WHERE clorofila <> 0')

# 2.10. Extraia as amostras com sub-saturação (abaixo de 90)
sqldf('SELECT * FROM tcc1 WHERE saturacao < 90')

