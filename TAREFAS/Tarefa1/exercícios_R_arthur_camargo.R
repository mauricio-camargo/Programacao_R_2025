poliquetas = readxl::read_excel('PoliquetasRS-a.xlsx')
library(sqldf)

# 1
nrow(poliquetas)

#2
taxons_costeiro = sqldf ('SELECT * FROM poliquetas WHERE costeiro = 1 and neritico = 0 and oceanico = 0 and plataforma = 0')
taxons_costeiro

#3
taxons_oceaplat = sqldf('SELECT* FROM poliquetas WHERE oceanico = 1 and plataforma = 1')
taxons_oceaplat

#4
taxons_ampladist = sqldf('SELECT * FROM poliquetas WHERE costeiro = 1 and neritico = 1 and plataforma = 1 and oceanico = 1')
taxons_ampladist

#5
poliq_espgen = sqldf ('SELECT *, genero  || " " || especie AS genero_especie FROM poliquetas')

    # ou

poliq_somente_espgen = sqldf ('SELECT genero || " " ||  especie AS genero_especie FROM poliquetas')


#6
poliq_esp = sqldf('SELECT * FROM poliquetas WHERE taxon NOT LIKE "%sp.%"')

poliq_gen = sqldf ('SELECT * FROM poliquetas WHERE taxon LIKE "%sp.%" ')

#7 
nrow(poliq_esp)

#8 
poliq_esp_cost = sqldf ('SELECT * FROM poliq_esp WHERE costeiro = 1 ')
nrow(poliq_esp_cost)

#9
familias = sqldf ('SELECT DISTINCT família AS Famílias FROM poliquetas')
familias

#10
nrow(familia)

#11
generos = sqldf('SELECT DISTINCT genero AS Gêneros FROM poliquetas')
generos
nrow(generos)

#12
WORMS  = 'https://www.marinespecies.org'
