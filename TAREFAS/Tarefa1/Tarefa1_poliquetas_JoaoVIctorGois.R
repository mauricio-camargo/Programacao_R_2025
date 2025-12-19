### TAREFA - Lógica da programação (de computadores) e análise de dados no R ###
##### Nome: João Victor da Rosa Gois | Matrícula: 153792 | Data: 05/12/25 ######
## Obs.: a numeração dos exercícios está conforme o documento das orientações ##

#Definindo diretório
setwd('C:/Users/jvict/OneDrive/Desktop/furg/cadeiras/8_periodo/topicosIV/atividade1')

#Importando bibliotecas
library(sqldf) #Pacote para utilização da linguagem SQL
library(readxl) #Pacote para importar planilha

#Importando planilha
poliq = readxl::read_excel('PoliquetasRS-a.xlsx') #Lista de espécies de poliquetas da Bacia de Pelotas (RS) coletadas nos últimos 50 anos pela FURG. 

#### Exercícios ####

### 1. Quantos táxons existem no total? 
taxons = sqldf('SELECT COUNT(taxon) FROM poliq') #Seleciona os táxons e os conta
taxons #O número total de táxons é de 280

### 2. Quais táxons ocorrem somente na região costeira?
tax_cost = sqldf('SELECT taxon FROM poliq WHERE costeiro = 1 AND neritico = 0 AND oceanico = 0 AND plataforma = 0') #Haja vista que atribui-se à cada ambiente o valor de 0 (não ocorre) ou 1 (ocorre) para cada táxon, ao considerarmos apenas os que tem 1 em costeiro e 0 nos demais ambientes, selecionamos apenas os que ocorrem somente no ambiente costeiro.
tax_cost #Esses são os 19 táxons que ocorrem exclusivamente na região costeira

### 3. Quais táxons são comuns às regiões oceânica e de plataforma?
tax_oc_plat = sqldf('SELECT taxon FROM poliq WHERE oceanico = 1 AND plataforma = 1') #Seleciona os táxons que são presentes na região oceânica E de plataforma. Nesse caso, táxons que também ocorrem em outras regiões (e.g.: Alciopa reynaudii) também são inclusas, contanto que ocorram tanto no oceanico quanto no de plataforma simultaneamente.
tax_oc_plat #Esses são os 31 táxons que ocorrem na região oceânica E de plataforma

### 4. Quais táxons possuem ampla distribuição em todas as regiões.
tax_all = sqldf('SELECT taxon FROM poliq WHERE costeiro = 1 AND neritico = 1 AND oceanico = 1 AND plataforma = 1') #Seleciona apenas os táxons que ocorrem em todos os ambientes simultaneamente.
tax_all #Esses são os 11 táxons que ocorrem nos 4 ambientes.

### 6. A coluna "taxon" contém todas as informações sobre o gênero, espécie, autoria e ano. Crie uma nova coluna contendo apenas o nome do gênero e da espécie, concatenando a coluna "genero" com a coluna "especie". Pesquise como fazer concatenção de strings em SQL usando ||.
gen_sp = sqldf('SELECT *, genero || " " || especie AS Genero_Especie FROM poliq') #Dessa forma, concatena os termos de Gênero e Espécie. Entretanto, nos táxons a nível de gênero, os quais não constam os epítetos específicos, retorna-se NA. Logo foi feita a linha a seguir para corrigir esse problema
gen_sp

gen_sp_noNA = sqldf('SELECT *, CASE WHEN especie IS NOT NULL THEN genero || " " || especie ELSE genero || " sp." END AS Genero_Especie FROM poliq') #Dessa forma, testa se a coluna especie apresenta NA; caso não apresente, realiza a concatenação normalmente como feito para o data frama gen_sp acima; caso seja NA, concatena o gênero com o termo "sp.", deixando de retornar NA nos casos de táxon a nível de gênero.
gen_sp_noNA

### 4. Repare que muitos táxóns estão apenas no nível de gêneros ("sp."). Separe a planilha original em duas, uma contendo apenas s táxons a nível de gêneros e outra de táxons a nível de espécie. Pesquise sobre a cláusura LIKE para encontrar substrings ("sp.") dentro de uma string (da coluna "taxon"). 
poliq_gen = sqldf('SELECT * FROM poliq WHERE taxon LIKE "%sp.%"') #Seleciona apenas as linhas que apresentem o termo "sp." na coluna taxon
poliq_gen #Planilha com táxons a nível de gênero

poliq_sp = sqldf('SELECT * FROM poliq WHERE taxon NOT LIKE "%sp.%"') #Seleciona apenas as linhas que NÃO apresentem o termo "sp." na coluna taxon, isto é, estão em nível de espécie
poliq_sp #Planilha com táxons a nível de espécie

### 5. Quantos táxons existem a nível de espécie no total?
taxons_sp = sqldf('SELECT COUNT(taxon) FROM poliq_sp') #Seleciona os táxons a nível de espécie e os conta, haja vista que todos os taxons dessa planilha estão nessa categoria
taxons_sp #O número total de táxons a nível de espécie é de 217

### 6. Quantos táxons existem a nível de espécie na região costeira?
taxons_sp_cost = sqldf('SELECT COUNT(taxon) FROM poliq_sp WHERE costeiro = 1') #Seleciona os táxons a nível de espécie que ocorrem na região costeira e os conta, INDEPENDENTEMENTE se ocorrem ou não nas demais regiões. Caso fosse apenas na região costeira, precisaria incluir '...AND neritico = 0 AND oceanico = 0 AND plataforma = 0' no WHERE, como feito no exercício 2.
taxons_sp_cost

### 7. Crie uma lista das famílias que aparecem na região. Pesquise sobre a cláusura DISTINCT para selecionar nomes únicos em SQL.
familias = sqldf('SELECT DISTINCT família FROM poliq') #Seleciona as famílias da planilha sem repeti-las, uma vez que existem diferentes táxons dentro da mesma família
familias #Uma lista que consta todas as famílias presentes na região do Rio Grande do Sul

### 8. Quantas famílias existem na região?
familias_count = sqldf('SELECT COUNT(DISTINCT família) FROM poliq')
familias_count #No total, existem 50 famílias na região

#Ou poderia ser feito utilizando a prórpia planilha que criamos anteriromente
sqldf('SELECT COUNT(família) FROM familias')

### 9. Faça o mesmo para gêneros. Quantos gêneros existem na região.
##Fazendo a lista
generos = sqldf('SELECT DISTINCT genero FROM poliq') #Seleciona os gêneros da planilha sem repeti-los
generos #Uma lista que consta todos os gêneros presentes na região do Rio Grande do Sul

##Contando os gêneros
generos_count = sqldf('SELECT COUNT(DISTINCT genero) FROM poliq')
generos_count #No total, existem 174 gêneros na região

#Ou

sqldf('SELECT COUNT(genero) FROM generos') 

### 10. Crie uma função que se comunique com o WORMS para conferir se os nomes dos gêneros e das espécies estão atualizados. ISSO É UMA PIADA. NÂO TENTE ISSO EM CASA. Mas é possível de ser realizada em R. Só falta mão-de-obra! Afinal, para quê servem os alunos?
# Não consigo...