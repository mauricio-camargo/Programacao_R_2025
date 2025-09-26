library(marelac)
library(plot3D)

Sal.seq = seq(from = 25, to = 35, length.out = 100)
Temp.seq = seq(from = 5, to = 30, length.out = 100)
sig.mat = outer(Sal.seq, Temp.seq, 
 FUN=function(Sal,Temp) sw_dens(S=Sal,t=Temp)-1000)

contour2D(x = Sal.seq, y = Temp.seq, z = sig.mat, lwd = 1,
          xlab = "Salinidade", ylab = "Temperatura", 
          main = "Diagrama TS",colkey = F)

#Gerando dados para testar
Temp = runif(20,5,25) 
Sal = runif(20,25,35)
#Calculando Sigma
sigma <- sw_dens(S = Sal, t = Temp) - 1000       
sigma

scatter2D(Sal, Temp, colvar = sigma, 
          col='black',  pch = 19, cex = .6, add = TRUE, 
          clim = range(sig.mat), colkey = F)

