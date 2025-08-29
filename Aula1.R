########## R como calculadora ##########
2+2
5-2
12/4
12*5
5^2

# Hashtag é só um comentário 

########## PRIMEIRA SEÇÃO ########## 

# Lógica de parênteses deve ser obedecida
(5*4) + 5
(6+4)*(4+6)
# Parênteses aninhados
3*((3+4)/2)

# Separador decimal é o ponto
12.4+5.8
15,6+1 #ERRO

########## SEGUNDA SEÇÃO ########## 

# FUNÇÕES EMBUTIDAS
sqrt(4) #Função sqrt tem um único argumento
sqrt(169)
# Função com dois argumentos
log(100,10)#Argumentos não nomeados
log(x = 100, base = 10)#Argumentos nomeados

# OUTRAS FUNÇÕES
round(12.4)
round(12.6)
abs(-12)
sin(.98)

# Exercício 1 - Respostas
10/(5-1)
12/(4+2) + 12/(3+2+1) - 4/3^2
( -2+sqrt(4) ) / (  2*2*3 ) 
( 9^2-(7.3-5)^3 ) / (  log(5,2) + 3^2 + sqrt(5)  )

########## TERCEIRA SEÇÃO ##########

# OBJETOS OU VARIÁVEIS

joao=12
joao
#Símbolo de atribuição tradicional
joao <- 12

#Outros exemplos
x=15
y=12
z=x+y
z
#Outros exemplos
x=log(1000,10)
y=sqrt(144)
z=x/y
z
#Remover objetos
rm(z)
z
#Nomes de objetos
#Têm que começar com letra.
#Máx 256 caracteres
x12=432.65
#Pode ter _ e .
trat.inicial=434
tratamento_final=654

#Armazenar texto (caracter ou string)
s='texto simples'
#Aspas duplas dá no mesmo
s="texto simples"
s

#Letras maiúsculas e minúsculas são diferentes
A=33
a

# Exercícios 2 (Respostas)
#a
z=sqrt(12)
z
w=log(20,10)
w
s=w+z
s
#b
R=20
pi
A=pi*R^2

########## QUARTA SEÇÃO #### 

#VETORES (conj. de dados do mesmo tipo,
#podendo ser numérico ou de string)
#Criando um vetor
v = c(3,7,9,11)
v
s = c('a','b','c','d')

#Misturando números com texto
w=c(12,'y') #não dá erro. Por quê?
w

#Construindo vetores
#Usando sequencia de numeros
1:10
10:1
vetor1=1:27
vetor1
#Função seq
seq(1,10)
seq(1,20,2)  #Sequência de dois em dois 
seq(20,1,-2) #Sequência inversa

#Função rep 
rep(12,5)

#Exercícios 3 (a, b e c)
#a
x=c(1,3,5,7,9)
#b
y=10:50
#c
w=seq(10,50,3)
#d
z=c(4,2,7,12,23,5)
length(z)
min(z)
max(z)
sum(z)
mean(z)
sd(z)

#Criar um vetor correspondente a um fator
#Na mão:
fat1=c('Norte','Norte','Sul','Sul')
#fat1 ainda não é um fator.
fat1
#Precisa dizer ao R que isso é um
as.factor(fat1)
#Usando rep para criar fatores
fat2=rep('inicial',3)
fat
fatlongo = c( rep('inicial',3), rep('final',3) )
fatlongo
#Ou então a função gl (generate levels)
gl(2,3,6,labels = c('inicial','final'))

#Exercício 3 (e)
#e
z=c(  rep('A',5) ,  rep('A,5') ) 
  #Ou então..
gl(2,5,labels=c('A','B'))

#CÁLCULO DE VETORES
x = c(2,5,7,10)
x
x + 3
x^2
x
log(x)

#índices de vetores
x[3]
x[2]
x[5] # NA (not available)
x
x[2:4]

#Funções vetoriais
x
length(x) #Número de elementos
sum(x)
#Calcular manualmente a média do vetor
media=sum(x)/length(x)
media
#Função interna que calcula a média
mean(x)
median(x) #Mediana
var(x) #Variância
sd(x) #Desvio padrão
range(x)
min(x)
max(x)

summary(x)

#Criando vetores de números aleatórios da distribuição normal
rnorm(12,5,2)

#Gerar sempre o mesmo número aleatório
set.seed(15)
rnorm(10)

#Especificando o valor da média e desvio que os números aleatórios devem ter
x=rnorm(100,5,2)
mean(x)
sd(x)

#Criando números aleatórios da distribuição uniforme.
Runif(15,5,15)

#Equivalente da função ALEATÓRIOENTRE do Excel
trunc(runif(15,5,15))

#Simulação
set.seed(777)
v=rnorm(5,7,2)
mean(v)
sd(v)

set.seed(777)
v=rnorm(20,7,2)
mean(v)
sd(v)

set.seed(777)
v=rnorm(100,7,2)
mean(v)
sd(v)

set.seed(777)
v=rnorm(100000000,7,2) #Máximo de 100 milhões
mean(v)
sd(v)

#Exercício 3 (f)
k=rnorm(20,12,3)
mean(k)
sd(k)


