#Abrir dados.xlsx pelo Import dataset

dados
names(dadosp)
library(sqldf)
sqldf('select Area,Est,Peixe from dadosp inner join projetos
      on dadosp.projetoID=projetos.ID
      WHERE Area="N"')

##### Selecionando colunas
sqldf("SELECT * FROM dados") #Seleciona tudo
sqldf("SELECT Area,Peixe FROM dados") #Seleciona algumas colunas
##### Selecionando colunas e filtrando linhas
sqldf("SELECT Area,Peixe FROM dados
      WHERE Area='S'")
sqldf("SELECT Area,Rep,Peixe FROM dados
      WHERE Area='N' and Rep=1")
sqldf("SELECT * FROM dados
       WHERE Rep=1 or rep=2")
sqldf("SELECT * FROM dados
       WHERE Temp>18")
#Usando like para filtrar pedaços de textos
sqldf("SELECT * FROM dados
      WHERE OBS like 'Chuva%'")
#SQL com datas
#Ordenando o resultados
sqldf("SELECT * FROM dados
       ORDER BY Temp desc")
sqldf("SELECT * FROM dados
       WHERE Est='Ver' 
       ORDER BY Temp")
#Resumindo dados
sqldf("SELECT Area,Est,stdev(peixe) as Media 
      FROM dados GROUP BY Area,Est")

