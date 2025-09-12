f_intervalo = function(x) {
  if (x>=5 & x<=10) {
    return('SIM')
} else {
 return('NÃO')
  }
}  
f_intervalo(9)

f_intervalo = function(x) {
  if (x>=5 & x<=10) return('SIM')
  else return('NÃO')
}  

f_alista = function (idade,sexo) {
  if (sexo==TRUE & idade>=18) 
    return('Idade militar')
  else return('Não aplicável')
} 
f_alista(19,TRUE)

f_disc = function(nota,freq) {
 if (nota>=7 & freq>=70) 
  return('Aprovado')
 else return('Reprovado')
}
f_disc(7,70)

#Modo bem econômico
f_disc = function(nota,freq) {
  if (nota>=7 & freq>=70) return('Aprovado')
  else return('Reprovado')
}

asd=function(ano){
if (ano %% 4 == 0  | ano %% 400 == 0)
return('Bissexto')
  else ('Não')
}
asd(2024)
