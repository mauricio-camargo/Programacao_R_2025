N# 1. Escreva uma função chamada ft_substituir que substituirá um valor y
# por um valor z no vetor x.
# Teste a função substituindo o valor de 20 por 200 no vetor
v1 = c(2,5,10,12,20,40,50)

ft_substituir = function(x,y,z) {
 for (i in 1:length(x)) {
  if (x[i]==y)
   x[i]=z
 }  
print(x)
}

ft_substituir(v1,20,200)


# 2. Escreva uma função chamada ft_remove_vazias que remova as strings vazias de um vetor x.
# Teste a função com o vetor 
v2 = c('a1','a2','','a3','a4','')

ft_remove_vazias = function (x) { 
 dw = c()
 Count = 0
 for (i in 1:length(x)) {
  if (x[i] != "") {
   Count = Count + 1
   dw[Count] = x[i]
  }
 }
dw
}
ft_remove_vazias(v2)

# 3. Escreva uma função chamada ft_incluir_no_fim que incluirá um valor y no final
# de um vetor x.
# Teste a função incluindo o valor de 120 ao vetor 
v3 = c(50,60,70,80,90,100,110)

ft_incluir_no_fim = function (x,y) { 
 n=length(x)
 x[n+1]=y
 print(x)
}
ft_incluir_no_fim(v3,120)

# 4. Escreva uma função chamada ft_incluir_no_meio que incluirá um valor y 
# após o valor z do vetor x
# Teste a função incluindo o número 259 logo após o número 200, no seguinte vetor:
v4 = c(50,100,150,200,300,350,400)

ft_incluir_no_meio = function(x,y,z) {
 dw = c()
 Count = 0
 for (i in 1:length(x)) {
    Count = Count + 1
    dw[Count] = x[i]
    if (x[i] == z) {
      Count = Count + 1
      dw[Count] = y
    }
  }
dw
}

ft_incluir_no_meio(v4,259,200)

# 5. Escreva uma função ft_substituir_primeiro para encontrar o primeiro valor de y e substitua 
# pelo valor de z. Faça a substituição apenas para o primeiro valor de y.
# Teste a função substituindo o valor de 20 por 200 no seguinte vetor:
v5 = c(5, 10, 15, 20, 25, 50, 20)
ft_substituir_primeiro = function(x,y,z) {
  for (i in 1:length(x)) {
    if (x[i]==y) {
      x[i]=z
      break;
          }
}  
  print(x)
}
ft_substituir_primeiro(v5,20,200)

# 6. Escreva uma função para remover todas as ocorrências de um valor y
# no vetor x.
# Teste a função removendo as ocorrências do valor 20.
v6 = c(5, 20, 15, 20, 25, 50, 20)
ft_remove_todas = function (x,y) { 
  dw = c()
  Count = 0
  for (i in 1:length(x)) {
    if (x[i] != y) {
      Count = Count + 1
      dw[Count] = x[i]
    }
  }
  dw
}
ft_remove_todas(v6,20)
