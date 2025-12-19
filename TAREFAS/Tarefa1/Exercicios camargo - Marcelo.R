library(sqldf)
library(readxl)

df = readxl::read_excel('PoliquetasRS-a.xlsx')


#Exercicio 1: 

nrow(df)

#Exercicio 2: 

taxons_somente_costeira = sqldf("SELECT taxon FROM df WHERE costeiro = 1 AND neritico = 0 AND oceanico = 0 
                                AND plataforma = 0")

#Exercicio 3:

taxons_oceano_plat = sqldf("SELECT taxon FROM df WHERE oceanico = 1 AND plataforma = 1")

#Ecercicio 4: 

taxons_ampla_distr = sqldf("SELECT taxon FROM df WHERE costeiro = 1 AND neritico = 1 AND oceanico = 1 
                           AND plataforma = 1")

#Exercicio 5:

sqldf_result = sqldf("SELECT *, genero || ' ' || especie AS nome_completo FROM df")
df = sqldf_result

#Exercicio 6:

taxons_genero = sqldf("SELECT * FROM df WHERE taxon LIKE '%sp.%'")

taxons_especie = sqldf("SELECT * FROM df WHERE taxon NOT LIKE '%sp.%'")

#Exercicio 7: 

nrow(taxons_especie)

#Exercicio 8: 

contagem_especie_costeira = sqldf("SELECT COUNT(taxon) FROM df WHERE taxon NOT LIKE '%sp.%' AND costeiro = 1")
contagem_especie_costeira

#Exercicio 9:

familias_unicas = sqldf("SELECT DISTINCT família FROM df")

#Exercicio 10: 

nrow(familias_unicas)

#Exercicio 11:

generos_unicos = sqldf("SELECT DISTINCT genero FROM df")
nrow(generos_unicos)















