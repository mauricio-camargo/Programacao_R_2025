# Atividade para entregar dia 05/12/2025 - 08:34
# Clara S. Bainy, n? 153791

# INSTRUCOES
# Abra a planilha PoliquetasRS.xlsx e a armazene em um dataframe.
# Esta tabela cont?m uma parte da lista de esp?cies de poliquetas da Bacia de Pelotas (RS) coletadas nos ?ltimos 50 anos pela FURG.
# Responda ?s perguntas a seguir, sempre usando a linguagem SQL, atrav?s do pacote sqldf.
# Envie as respostas em arquivo .R por e-mail.

#### INSTALANDO e IMPORTANDO ####
#install.packages("sqldf")
#install.packages("readxl")
library(sqldf)
library(readxl)
# Importando planilha
poliq = read_excel('PoliquetasRS-a.xlsx')
poliq = as.data.frame(poliq)


#### 1. Quantos taxons existem no total? ####
sqldf('SELECT COUNT(taxon) FROM poliq')
# 280 taxons

#### 2. Quais taxons ocorrem somente na regi?o costeira? ####
sqldf('SELECT COUNT(taxon) FROM poliq WHERE costeiro = "1" and neritico ="0" and oceanico ="0" ')
# 19 taxons

#### 3. Quais taxons sao comuns as regioes oceanica e de plataforma? ####
sqldf('SELECT COUNT(taxon) FROM poliq WHERE neritico ="1" and oceanico ="1" ')
# 82 taxons
# Como o enunciado nao excluiu abertamente a regiao costeira, nao considerei "costeiro = 0"

#### 4. Quais taxons possuem ampla distribuicao em todas as regioes? ####
sqldf('SELECT COUNT(taxon) FROM poliq WHERE costeiro = "1" and neritico ="1" and oceanico ="1" ')
# 53 taxons

#### 6. A coluna "taxon" contem todas as informacoes sobre o genero, especie, autoria e ano. ####
# Crie uma nova coluna contendo apenas o nome do genero e da esp?cie, concatenando a coluna "genero" com a coluna "especie".
# Pesquise como fazer concatencao de strings em SQL usando ||.
poliq_2 = sqldf("SELECT *, genero|| ' ' ||especie AS genero_especie FROM poliq")
# Gerada uma nova tabela com uma coluna a mais. Nessa coluna tem a juncao de genero e especie.
poliq_2

poliq_2 = sqldf("SELECT *, genero || ' ' || (CASE WHEN especie = 'NA' OR especie IS NULL THEN 'sp.' ELSE especie END) AS genero_especie FROM poliq")
# coluna mais completa, outra forma de fazer esse exercicio

#### 4. Repare que muitos taxons estao apenas no nivel de generos ("sp."). ####
# Separe a planilha original em duas, uma contendo apenas os t?xons a nivel de generos e outra de t?xons a n?vel de esp?cie.
# Pesquise sobre a clausura LIKE para encontrar substrings ("sp.") dentro de uma string (da coluna "taxon").

poliq_sp = sqldf('SELECT * FROM poliq WHERE taxon NOT LIKE "%sp.%"') # genero
poliq_gen = sqldf('SELECT * FROM poliq WHERE taxon LIKE "%sp.%"') # genero e especie
nrow(poliq_sp)
nrow(poliq_gen)

#### 5. Quantos taxons existem a nivel de especie no total? ####
sqldf('SELECT COUNT (especie) FROM poliq')
# 217

#### 6. Quantos taxons existem a nivel de esp?cie na regiao costeira? ####
sqldf('SELECT COUNT (especie) FROM poliq WHERE costeiro = "1"')
# 130

#### 7. Crie uma lista das familias que aparecem na regiao. Pesquise sobre a clausura DISTINCT para selecionar nomes unicos em SQL. ####
sqldf('SELECT DISTINCT (família) FROM poliq')
# observar que fam?lia ? com acento na tabela

#### 8. Quantas familias existem na regi?o? ####
sqldf('SELECT COUNT(DISTINCT(família)) FROM poliq')
# 50

#### 9. Faca o mesmo para generos. Quantos generos existem na regiao? ####
sqldf('SELECT COUNT(DISTINCT(genero)) FROM poliq')
# 174
