#Exemplo 1.

f_intervalo = function(x) {
  if (x>=5 & x<=10) {
    return('SIM')
} else {
 return('NÃO')
  }
}  
f_intervalo(19)

#A forma de escrever abaixo é mais simples. Se a instrução
#é única, não é necessário usar { }.
f_intervalo = function(x) {
  if (x>=5 & x<=10) return('SIM')
  else return('NÃO')
}  

# Exercício 1. Pessoa em idade militar? 
f_alista = function (idade,sexo) {
  if (sexo==TRUE & idade>=18) 
    return('Idade militar')
  else return('Não aplicável')
} 
f_alista(19,T)

# Exercício 2. Nota e frequência de aprovação
f_disc = function(nota,freq) {
 if (nota>=7 & freq>=70) 
  return('Aprovado')
 else return('Reprovado')
}
f_disc(6,70)

#Mesmo código mas em modo bem econômico
f_disc = function(nota,freq) {
  if (nota>=7 & freq>=70) return('Aprovado')
  else return('Reprovado')
}

# Exercício 3. Quatro notas e frequência de aprovação
f_nota_anual = function(n1,n2,n3,n4,freq) {
  media = (n1+n2+n3+n4)/4
  if (media>=7 & freq>=70) return('Aprovado')
  else return('Reprovado')
}
f_nota_anual(8,7,7,7,60)

# Exercício 4. Clasiificação de triângulo
f_tri = function(a,b,c) {
 if (a==b & b==c) return('Equilátero')
  else
 if ((a==b | a==c) | (b==a | b==c) | (c==a | c==b))
   return('Isósceles')
  else 
   return('Escaleno')
}
f_tri(1,3,2)

# Exercício 5. Salário e cargo.
f_aumento = function(sal,cargo) {
 if (cargo=='A') 
   if (sal<2000) novosal=sal*1.2
    else novosal=sal*1.1
 if (cargo=='B') 
      if (sal<6000) novosal=sal*1.1
    else novosal=sal*1.05
 return(novosal)
}
f_aumento(8000,'B')

asd=function(ano){
if (ano %% 4 == 0  | ano %% 400 == 0)
return('Bissexto')
  else ('Não')
}
asd(2024)
