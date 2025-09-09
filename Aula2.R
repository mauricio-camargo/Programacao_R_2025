Aula 05/09/2025 - Programação em R

######## Exemplo 1: soma de dois números. ####

soma2num = function(x1,x2) {
  x_tot = x1 + x2
  return(x_tot)
}
# Testando a função
soma2num(12,15)

####### Exemplo 2: Concatenar duas strings. ####

alo_mundo = function(s1,s2) {
  s = (paste(s1, s2))
  return(s)
}
# Testando a função
alo_mundo('Hello,','world!')

####### Exercício 1: Multiplicar dois números. ####
f_mult = function(x1,x2) {
  xt = x1 * x2
  return(xt)
}
# Testando a função
f_mult(12,2)

####### Exercício 2: Calcular a circunferência. ####
f_circ = function(r) {
  cincunferencia = 2*pi*r
  return(cincunferencia)
}
# Testando a função
f_circ(1)

