### Tarefa 1 - Tópicos Especiais IV ###
### Bryan Alex Soares S. - 156292 ###
### No fundo no fundo, tudo é bentos. ###

library(readxl)
library(sqldf)

planilha = readxl::read_excel('PoliquetasRS-a.xlsx')

### Questão 1 ###
sqldf("SELECT COUNT (*) FROM planilha")

### Questão 2 ###
sqldf("SELECT taxon FROM planilha WHERE costeiro=1 and neritico=0 and oceanico=0 and plataforma=0")

### Questão 3 ###
sqldf("SELECT taxon FROM planilha WHERE oceanico=1 and plataforma=1")

### Questão 4 ###
sqldf("SELECT taxon FROM planilha WHERE costeiro=1 and neritico=1 and oceanico=1 and plataforma=1")

### Questão 5 ###
sqldf("SELECT *, genero || ' ' || especie AS genero_especie FROM planilha")

### Questão 6 ###
sqldf('SELECT * FROM planilha WHERE taxon NOT LIKE "%sp.%"')
sqldf ('SELECT * FROM planilha WHERE taxon LIKE "%sp.%" ')

### Questão 7 ### 
sqldf("SELECT COUNT (*) AS total_especies FROM planilha")

### Questão 8 ###
sqldf("SELECT COUNT (*) AS especies_costeiras FROM planilha WHERE costeiro=1")

### Questão 9 ###
sqldf("SELECT DISTINCT família FROM planilha")

### Questão 10 ###
sqldf("SELECT COUNT(DISTINCT família) AS total_familias FROM planilha")

### Questão 11 ###
sqldf("SELECT COUNT(DISTINCT genero) AS total_generos FROM planilha")

### Questão 12 ###
sqldf("https://www.instagram.com/bentosfurg/")
Se sair uma bolsa, quem sabe...