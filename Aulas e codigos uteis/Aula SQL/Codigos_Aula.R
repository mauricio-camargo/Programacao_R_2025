#compras = read.csv2('https://www.dropbox.com/s/zpdyhb90hez2agv/Compras.csv?raw=1')

compras = read.csv2('compras.csv')
compras
View(compras)

library(sqldf)

##### Selecionando colunas
sqldf("SELECT * FROM compras") #Seleciona tudo
sqldf("SELECT Item,Preco FROM compras") #Seleciona algumas colunas
##### Selecionando colunas e filtrando linhas
sqldf("SELECT * FROM compras
      WHERE Item='Sorvete'")
sqldf("SELECT * FROM compras
      WHERE Item='Sorvete' or Item='Lanche'")
sqldf("SELECT * FROM compras
       WHERE Preco>20")
sqldf("SELECT * FROM compras
       WHERE Local='Lanchonete' and Preco>20")
#Usando like para filtrar pedaços de textos
sqldf("SELECT * FROM compras
      WHERE Local like '%te%'")
#SQL com datas
sqldf("SELECT * FROM compras
       WHERE Data>'2022-06-01'
       AND Data<'2022-06-30'")
sqldf("SELECT * FROM compras 
       WHERE MONTH(Data)=7")
sqldf("SELECT * FROM compras
       WHERE Data>'2022-07-16'")
#Ordenando o resultados
sqldf("SELECT * FROM compras
       ORDER BY Item")
sqldf("SELECT * FROM compras
       ORDER BY Preco DESC")
sqldf("SELECT * FROM compras
       WHERE Local='Lanchonete' 
       ORDER BY Item")
#Inserindo dados
sqldf(c("INSERT INTO compras (Data,Item,Local,Preco) VALUES 
       ('2022-08-04','Chocolate','Loja',32)","SELECT * FROM compras"))
#Resumindo dados
sqldf("SELECT Local,count(Item) FROM compras 
      GROUP BY Local")
sqldf("SELECT Local,sum(Preco) FROM compras 
      GROUP BY Local")
sqldf("SELECT Local,avg(Preco) FROM compras 
      GROUP BY Local")