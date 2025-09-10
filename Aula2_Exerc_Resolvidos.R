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

####### Exercício 2: Média de três números. ####
f_media = function(x1,x2,x3) {
  media = (x1+x2+x3)/3
  return(media)
}
# Testando a função
f_media(2,4,5)

####### Exercício 3: Número a elevado à potência b ####
f_pot = function(a,b) {
  potencia = a^b
  return(potencia)
}
# Testando a função
f_pot(2,5)

####### Exercício 4: Calcular a circunferência. ####
f_circ = function(r) {
  cincunferencia = 2*pi*r
  return(cincunferencia)
}
# Testando a função
f_circ(3)

####### Exercício 5: Calcular a circunferência e area. ####
f_circ_area = function(r) {
  circ = 2*pi*r
  area = pi*r^2
  return(c(circ,area))
}
# Testando a função
f_circ_area(5)

####### Exercício 6: Calcular o IMC. ####
f_IMC = function(peso,altura) {
  imc = peso/(altura)^2
  return(imc)
}
# Testando a função
f_IMC(78,1.72)

####### Exercício 7: Converter temperatura C -> F. ####
f_temp = function(celsius) {
  tempF = celsius * (9/5) + 32
  return(tempF)
}
# Testando a função
f_temp(30)

####### Exercício 8: Converter dólar. ####
f_dolar = function(dolar) {
  real = dolar * 5.7
  return(real)
}
# Testando a função
f_dolar(10)

####### Exercício 9: Formula quadrática. ####
f_quadrat = function(a,b,c) {
  xmenos = ( -b - (sqrt(b^2 - 4*a*c)) ) / (2*a)
  xmais = ( -b + (sqrt(b^2 - 4*a*c)) ) / (2*a)
  return(c(xmenos,xmais))
}
# Testando a função
f_quadrat(2,8,3)

####### Exercício 10: Positivo ou negativo. ####
f_pos_neg = function(x) {
  if (x>0) {
    s='Positivo'
  }
  #Não há necessidade de else, caso contrário "negativo" incluirá o zero
  if (x<0) {
    s='Negativo'
  }
 return(s)
}
# Testando a função
f_pos_neg(0) #Se colocar zero não funciona

####### Exercício 11: Positivo, negativo e zero. ####
f_pos_neg_zero = function(x) {
  if (x==0) {
    s = 'Número Neutro'
  } else if (x<0) {
    s = 'Número Negativo'
  } else if (x>0) {
    s = 'Número Positivo'
  }
  return(s)
}
# Testando a função
f_pos_neg_zero(0)

####### Exercício 12: Par ou impar. ####
f_par_impar = function(x) {
  if (x==0) {
    s = 'Número Neutro'
  } else if (x<0) {
    s = 'Número Negativo'
  } else if (x%%2 == 0) {
    s = 'Número Par'
  } else s = 'Número Impar'
  return(s)
}
# Testando a função
f_par_impar(7)

####### Exercício 13: Categorização da Idade. ####
f_idade = function(x) {
  if (x<12) {
    s = 'Criança'
  } else 
  if (x<17) {
    s = 'Adolescente'
  } else
  if (x<=59) {
    s = 'Adulto'
  } else
  if (x>60) {
    s = 'Idoso'
  }
  return(s)
}
# Testando a função
f_idade(88)

####### Exercício 14: Calcular IMC categorizado. ####
f_imc_cat = function(peso,altura) {
  imc = peso/(altura)^2
  if (imc<18.5) {
    s = 'Abaixo do peso'
  } else if (imc<25) {
    s = 'Peso normal'
  } else if (imc<30) {
    s = 'Sobrepeso'
  } else if (imc<35) {
    s = 'Obesidade 1'
  } else if (imc<40) {
    s = 'Obesidade 2'
  } else if (imc>40) {
    s = 'Obesidade 3'
  }
  return(s)
}
# Testando a função
f_imc_cat(84,1.72)

