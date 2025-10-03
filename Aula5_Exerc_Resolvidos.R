#### Exercício 1 ####
m = matrix(1:8,nrow=4)
m

### A
m[1,1]
### B
m[4,2]
ou
m[nrow(m),ncol(m)]
### C
m[1,]
### D
m[,ncol(m)]
### E
m[2:3,1]
ou
m[c(2,3),1]

#### Exercício 2 ####
m=matrix(1:16,nrow=4)
m

#### Exercício 3
m[2,3] = 0
ou
m[2,3] <- 0
m

#### Exercício 4
soma=0
for (i in 1:(nrow(m))) 
  for (j in 1:(ncol(m))) 
    soma = soma + m[i, j]

soma    

#### Exercício 5
v_soma = c()
for (i in 1:(nrow(m))) {
  ac = 0
  for (j in 1:(ncol(m))) {
    ac = ac + m[i, j]
  }
  v_soma[i] = ac
}

v_soma

#### Exercício 6
cont = 0
for (i in 1:nrow(m)) 
  for (j in 1:ncol(m)) 
    if (m[i,j] > 12)
     cont = cont + 1

cont
     
#### Exercício 7
f_diag = function(mat) { 
vet = c()
for (i in 1:(nrow(m))) 
  for (j in 1:(ncol(m))) 
   if (i==j)
     vet=c(vet,m[i,j])
return(vet)
}
f_diag(m)
