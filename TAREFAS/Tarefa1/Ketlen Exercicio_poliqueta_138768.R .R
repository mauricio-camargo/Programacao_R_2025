#### Script PoliquetasRS - Exercício SQL com sqldf ####

# 1. Abrir a planilha
pol = readxl::read_excel('PoliquetasRS.xlsx')
View(pol)

library(sqldf)

# 1. Quantos táxons existem no total?
sqldf('SELECT COUNT(*) AS Total_Taxons FROM pol')

# 2. Táxons que ocorrem somente na região costeira
sqldf('SELECT taxon FROM pol WHERE costa = 1 AND plataforma = 0 AND oceano = 0')

# 3. Táxons comuns às regiões oceânica e de plataforma
sqldf('SELECT taxon FROM pol WHERE oceano = 1 AND plataforma = 1')

# 4. Táxons com ampla distribuição (todas as regiões)
sqldf('SELECT taxon FROM pol WHERE costa = 1 AND plataforma = 1 AND oceano = 1')

# 5. Criar nova coluna com "gênero + espécie"
sqldf('SELECT *, genero || " " || especie AS genero_especie FROM pol')

# 6. Separar táxons apenas a nível de gênero (contêm "sp.")
tax_genero = sqldf('SELECT * FROM pol WHERE taxon LIKE "%sp.%"')
View(tax_genero)

# 7. Separar táxons a nível de espécie (não contêm "sp.")
tax_especie = sqldf('SELECT * FROM pol WHERE taxon NOT LIKE "%sp.%"')
View(tax_especie)

# 8. Quantos táxons a nível de espécie existem no total?
sqldf('SELECT COUNT(*) AS Total_Especie FROM pol WHERE taxon NOT LIKE "%sp.%"')

# 9. Quantos táxons a nível de espécie existem na região costeira?
sqldf('SELECT COUNT(*) AS Especies_Costa FROM pol WHERE costa = 1 AND taxon NOT LIKE "%sp.%"')

# 10. Lista de famílias distintas
sqldf('SELECT DISTINCT familia FROM pol')

# 11. Quantas famílias existem?
sqldf('SELECT COUNT(DISTINCT familia) AS Total_Familias FROM pol')

# 12. Quantos gêneros existem?
sqldf('SELECT COUNT(DISTINCT genero) AS Total_Generos FROM pol')
