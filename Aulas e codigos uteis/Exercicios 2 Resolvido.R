#### Exercício 1 ####
media = function(x1,x2,x3)
{
  print((x1+x2+x3)/3)
}
# Testanto a função
media(5,11,27)


#### Exercício 2 ####
sequencia = function(ini,fim)
  {
    for (i in ini:fim)
     print(i)
  }
# Testanto a função
sequencia(3,18)


paste('a','b')
cat()

#### Exercício 3 ####
tabuada = function(a,b)
  {
    cat("Tabuada de",a,"até",b,":\n")
    for (i in a:b) 
      {
        cat(a,"x",i,"=",i*a,"\n")
      }
  }
# Testanto a função
tabuada(2,14)


#### Exercício 4 ####
resumo = function(x){
  min = x[1]
  for (i in 1:length(x))
    {
      if (x[i] < min) 
      min = x[i]
    }
  max = x[1]
  for (i in 1:length(x))
    {
      if (x[i] > max)
      max = x[i]
    }
  for(i in 1:length(x))
    {
      media = (sum(x)/length(x))
    }
  return(c(paste('Minima:',min),paste('Máximo:',max),paste('Média:',media)))
}
# Testanto a função
dados = c(2,8,7,-5,-12,9,54,15,19)
resumo(dados)

#### Exercício 5 ####
pres_aus = function(x) 
  {
    for (i in 1:length(x)) 
      if (x[i] > 0) print(1) 
       else print(0)
  }
# Testanto a função
dados2 = c(0,4,1,6,0,0,7,0,35,0)
pres_aus(dados2)

