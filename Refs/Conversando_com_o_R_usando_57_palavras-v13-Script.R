############################################################### 
# Caso este arquivo seja aberto no RStudio com acentos errados, clique em File e escolha "Reopen with encoding". Depois selecione ISO-8859-1.
#


###############################################################
#       
#     Conversando com o R usando 57 palavras:
#  Introdução à programação com exemplos em Ecologia

#               Lista de Exercícios
#        Versão 13: 16 de setembro de 2014
 
# Adriano S. Melo  asm.adrimelo láNo gmail.com
# Dep. Ecologia, ICB, Universidade Federal de Goiás
#
###############################################################
#                  Capítulo 1
  
  # use o símbolo jogo-da-velha para colocar SEUS comentários.


###############################################################
#                  Capítulo 2

  # digite aqui seus comandos para acompanhar a apostila.

  
###############################################################
#                  Capítulo 3



###############################################################
#                  Capítulo 4

f1.simp <- function(abund){ #1 cria a função.  
                    # note que possui um argumento: abund
total <- sum(abund)  #2 abundância total na amostra.
prop.i <- abund/total #3 proporção de cada espécie.
prop.i.2 <- prop.i^2 #4 proporções elevadas ao quadrado.
D <- sum(prop.i.2)   #5 soma das proporções ao quadrado.
indice <- 1/D        #6 divisão para obter o índice.
return(indice)       #7 para mandar para fora da função.
}        



f2.correl <- function(x, y){ #1 dar nome e criar função. Abrir chaves.
  #2 reunir 'ingredientes'. O primeiro poderia ser a média de x.
  #3 o segundo poderia ser a média de y.
  #4 diferenças de cada xi em relação à média de x.
  #5 idem acima, mas para y.
  #6 multiplicar os 2 termos dentro de parênteses no numerador.
  #7 somar valores obtidos no passo anterior. Isto é o numerador.
  #8 já temos as diferenças de x em relação à média (passo 4). Elevar ao quadrado.
  #9 somar valores obtidos no passo anterior.
  #10 idem passo 8, mas para y.
  #11 idem passo 9, mas para y.
  #12 multiplicar as somas obtidas em 9 e 11.
  #13 tirar sqrt do passo anterior para obter denominador.
  #14 calcular o coeficiente r.
  #15 enviar o coeficiente para o usuário.
  }


###############################################################
#                  Capítulo 5


f3.dp <- function(amostra){  # cria função com 1 argumento
  # média da amostra (media)
  # diferenças dos valores em amostra em relação à média (dif)
  # eleva as diferenças ao quadrado (dif2)
  # soma as diferenças ao quadrado (numerador)
  # obtém número de observações (n)
  # calcula o denominador
  # faz a divisão
  # tira raiz quadrada
  # retorna resultado para usuário
}		


f4.shannon <-  {# inicie a função. Ela deverá ter 1 argumento, para abundâncias.
  # some abundâncias para obter abundância total
  # obtenha as abundâncias relativas de cada espécie (propi)
  # obtenha o logaritmo natural das propi
  # multiplique as propi pelo ln das propi
  # some a multiplicação anterior
  # coloque o sinal negativo e depois a soma obtida antes
  # devolva para o usuário
}			 


f5.hill <- function(abunds, a){    #
  # já deve estar ficando fácil...
  # deixo para você fazer sua própria 'receitinha'.
  # use quantas linhas quiser.
}	


f6.cole <- {   # crie a função. Deve ter argumentos para areas, abunds, area.i
   # obtenha área total do arquipélago
   # obtenha a área relativa da ilha i (xi) (aquela que tem interesse)
   # obtenha complemento da área relativa: 1-xi
   # eleve o complemento da área a todas abundâncias das espécies (1-xi)^nj
   # faça a subtração 1 - o passo anterior
   # some o obtido no passo anterior.
   # passe o resultado (passo anterior) para o usuário
}		


f7.F2<-function(k1, k2){   
   # junte as duas amostras.
   # obtenha a média geral (ybarra).
   # obtenha a SQT.
   # obtenha a média do primeiro tratamento (y1).
   # obtenha a soma de SQE parcial para y1.
   # obtenha a média do segundo tratamento (y2).
   # obtenha a soma de SQE parcial para y2.
   # obtenha a SQE.
   # obtenha a SQR.
   # obtenha a QMR.
   # obtenha a QME (obtenha n dentro da função).
   # obtenha F.
   # retorne F para usuário.
}


###############################################################
#                  Capítulo 6

f8.dissi.par.quali <- function(obj1, obj2, qual='jac'){ 
   # caso o usuário não coloque nada no argumento 'qual', a função usará como padrão o 'jac'.
   # precisamos encontrar as informações a, b e c. Para a, uma solução seria:
soma <- obj1 + obj2 # note que sum() não funcionaria aqui. Experimente e veja a razão.
quais2 <- soma==2 # 2 indica as variáveis descritoras que estão presentes nos dois objetos
quais2.num <- as.numeric(quais2) # fazendo coerção para transformar em 0 e 1.
a <- sum(quais2.num)
   # agora precisamos de b e c, mas note na formula que não precisamos separadamente:
quais1 <- soma==1 # 1 indica que está presente num objeto ou no outro, mas não nos dois.
quais1.num <- as.numeric(quais1)
b.c <- sum(quais1.num)
   # agora temos nossos 'ingredientes' para calcular. Só falta saber o que calcular:
if(qual == 'sor'){
   dois.a <- 2*a
   indice <- dois.a/(dois.a + b.c)
}
if(qual == 'jac'){
   indice <- a/(a+b.c)
} 
   
return(1-indice) #para ficar como dissimilaridade
}


f10.nodf.par <- function(supost.rica, supost.pobre){
}


###############################################################
#                  Capítulo 7

f11.jack1 <- function(dados){ # dados não podem ter colunas inteiramente vazias (apenas zeros).
   # obtenha Sobs com ncol()
   # obtenha m com nrow()
dados.01 <- ifelse(dados>0,1,0)#precisamos obter Q1. Transformamos em 0 e 1. 
Q1.TF <- colSums(dados.01)==1   # espécies aparecem em apenas 1 ua?
Q1.01 <-				# pode usar uma coerção para transformar TRUE em 1...
Q1 <-				# ... e depois somar.
      # já possui todos ingredientes. Calcule a formula. 
      # use mais de uma linha se quiser.
      # não esqueça de mandar resultado para usuário
}


f12.chao1 <- function(dados){ # dados não podem ter colunas inteiramente vazias (apenas zeros).
   # já sabe como obter o Sobs.
   # F1 é fácil. Em relação ao Q1 (visto acima), não precisa transformar em 0 e 1.
   # F2: fácil também
   # termine e mande resultado para usuário.
}


f13.jacks<-function(dados){ # dados não podem ter colunas inteiramente vazias (apenas zeros).
   # o código é apenas uma sugestão. Pode fazer de outra forma.
   # obtenha os 'ingredientes'
j1 <-		# calcule o Jack1. Use parte do código da f11.jack1()
    # calcule o que está no primeiro parênteses da formula acima.
   #multiplique o que obteve acima por Q1.
   #calcule o que está no segundo parênteses. Use mais de uma linha se quiser.
   #multiplique por Q2.
   # já consegue calcular o que está dentro dos colchetes.
j2 <-		# calcule o Jack2.
resu <- list(j1, j2) # entenda o que estamos fazendo aqui...
names(resu) <- c('Jackknife 1', 'Jackknife 2') # ... e aqui
return(resu)
}


###############################################################
#                  Capítulo 8

f14.correl.teste <- function(x, y, aleats=999){
r.obs <- f2.correl(x, y) #Passos 1 e  2. Podemos aproveitar uma função que já fizemos.
r.aleats <- numeric(aleats)    #para guardar os r aleatorizados
for(maria in 1:aleats){
   x.aleat <- sample(x) 		#Passo 3. Basta aleatorizar um dos vetores.
   r.aleats[maria] <- f2.correl(x.aleat, y) #Passo 4.
} 				   		#fecha o for(). Passos 5.
   
   #Agora só precisamos fazer o Passo 6.
r.obs.abs <- abs(r.obs) #pois estamos interessados em saber se o observado é um valor
   #extremo, independente da cauda (positiva ou negativa)
r.aleats.abs <- abs(r.aleats) #idem
maiores <- r.aleats.abs >= r.obs.abs #vai criar um vetor com TRUE e FALSE
extremos <- sum(as.numeric(maiores)) #transforma TRUE em 1 e FALSE em 0 e soma.
p <- (extremos+1) / (aleats+1) #temos que somar 1 no numerador pois existe a
   #possibilidade de não existir nenhum valor extremo. 
   #Se não somarmos, o p seria 0 e não existe
   #probabilidade 0 (seria uma certeza).
return(list(r.observado=r.obs, Probabilidade=p, r.aleats=r.aleats))
}


f15.medias2.teste <- function(g1, g2, aleats=999){
#g1 e g2 são vetores com observações. De preferência, do mesmo tamanho.
#obtenha a estatística observada (diferença das médias).
#crie um vetor para guardar as estatísticas aleatorizadas. Qual tamanho?
#inicie um for
   #pode-se aleatorizar um dos vetores apenas? Aleatorizar os dois?
   #ou juntá-los, aleatorizar, e depois partir em dois vetores?
   #obtenha a estatística aleatorizada.
#feche o for.
#obtenha os absolutos do observado e dos aleats.
#calcule o número de aleats extremos.
#calcule o p
#retorne para o usuário os valores da estatística observada e a probabilidade.
}


f16.par.teste <- function(dados, aleats=999){
   # dados é um data.frame ou matrix com duas colunas. Cada linha indica um par. 
   # calcule a estatística para...
   # crie vetor...
   # abra um for...
      # preste atenção em como deve fazer a aleatorização. Crie uma estratégia.
      # calcule estatística, guarde...
   # calcule p, mande para usuário valor da estatística observada e probabilidade.
}


f17.coletor <- function(comunidade){
   #comunidade é uma matrix ou data.frame com poças nas linhas e espécies nas colunas.
   #transforme em 0 ou 1 (pois usuário pode ter inserido valores de abundância).
   #obtenha o número de poças. Chame de n.
   # obtenha o número de espécies. Chame spp.
ordem <- sample(1:n) #crie uma ordem aleatória para as poças.
temp <- matrix(0, nrow=n, ncol=spp) # uma matriz com zeros. Veja como será preenchida.
resu <- numeric() #um vetor numérico, mas sem conteúdo.
   #inicie um for com o indexador i. Ele irá de 1 até n.
   temp.po <- # use ordem para obter 1 poça (a 1a no ciclo 1). Lembre dos colchetes.
   temp[i,] <- temp.po #junte as poças
       #obtenha a riqueza de espécies. Talvez precise de várias linhas.
       #guarde o valor de riqueza em resu.
   # fecha for
   # retorne sequência de valores de riqueza acumulada para o usuário.
}


f18.caspp(comunidade, aleats){
   #use a função f17.coletor() para fazer cada curva do coletor.	
   # pense um pouco antes de fazer. Tente escrever um pseudo-código. Não é tão difícil :-)
   
return(riquezas) #vetor de riqueza acumuladas médias
}
###########################################################