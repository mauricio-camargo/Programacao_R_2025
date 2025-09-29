# Exemplo1
for (i in 1:5) { 
  print(i)
}
# Mesma coisa que:
for (i in 1:5) print(i)

# Exemplo 2
vet = c(2,5,1,9)
for (i in vet) {
  print(i)
}

# Exemplo 3
pessoas = c('Carla','Mauro','Sofia')
for (p in pessoas) {
  print(p)
}

# Exercício 1 
vet = c(13,25,8,6,33)
for (i in vet) {
  if (i>20) 
    print(i)
}

# Exercício 1a 
vet = c(13,25,8,6,33)
nv=c()
for (i in vet) {
  if (i>20) 
   nv=c(nv,i)
}
nv #Conferindo

# Exercício 2
for (i in vet) {
  if (i %% 2 == 0) 
    print(paste('O número',i,'é par'))
  else
    print(paste('O número',i,'é impar'))
}

# Exercício 3
for (i in vet) {
  if (i %% 2 != 0 && i < 30) 
    print(i)
}

# Exercício 4
nome = c('David','Roger','Syd')
sobre = c('Guilmour','Waters','Barrett')
for (i in 1:3) {
  print(paste(nome[i],sobre[i]))
} 

# Exercício 5
vet = c(2,3,5,8)
soma = 0
for (i in 1:4) {
  soma=soma+vet[i]
}
soma

# Exercício 6
f_soma = function(v) {
  soma=0
  for (i in 1:length(v)) 
    soma=soma+v[i]
  return(soma)
}
f_soma(c(3,4,5))

# Exercício 7
f_media = function(v) {
  media = f_soma(v)/length(v)
    return(media)
}
f_media(c(3,4,5))

# Exercício 8
f_fat = function(x) {
  resultado=1
  if (x==0) return(1)
   else
  for (i in 2:x) resultado=resultado * i
  return(resultado)
}
f_fat(0)

# Exercício 9
pres_aus = function(v) {
  v_novo = c()
  for (i in 1:length(v)) 
   if (v[i]==0)
    v_novo =  c(v_novo,0)
   else
    v_novo =  c(v_novo,1)
   return(v_novo)   
}

v1 = c(0,4,1,6,0,0,7,0,35,0)
pres_aus(v1)

# Exercício 10
ft_substituir = function(vet,y,z) {
  for (i in 1:length(vet)) {
    if (vet[i]==y)
      vet[i]=z
  }  
  print(vet)
}

v2 = c(2,5,10,12,20,40,50)
ft_substituir(v2,20,200)


# Exercício 11
ft_remove_vazias = function (v) { 
  dw = c()
  for (i in 1:length(v))
    if (v[i] != '')
     dw = c(dw,v[i])
  return(dw)
 }
v3=c('A','','B','C','')
ft_remove_vazias(v3)

# Exercício 12
ft_incluir_no_fim = function (x,y) { 
  n=length(x)
  x[n+1]=y
  print(x)
}
v4 = c(50,60,70,80,90,100,110)
ft_incluir_no_fim(v4,120)


# Exercício 13
ft_remove_todas = function (x,y) { 
  dw = c()
  for (i in 1:length(x)) {
    if (x[i] != y) 
      dw = c(dw, x[i])
  }
 dw
}
v5 = c(5, 20, 15, 20, 25, 50, 20)
ft_remove_todas(v6,20)
