library(plot3D)
library(marelac)

data = read.table('data.txt',header=T,dec=',')
data

mint = min(data$temp)
mint = min(data['temp'])
maxt = max(data['temp'])
mins = min(data['sal'])
maxs = max(data['sal'])
sal.c <- seq(from=mins, to=maxs, length.out=100)
temp.c <- seq(from=mint, to=maxt, length.out=100)
sigmat.c <- outer(sal.c, temp.c, FUN=function(S, t)
  sw_dens(S=S, t=t) - 1000)
png(filename="figure-name.png", width=15, height=15, unit="cm",
    res=600, pointsize=12, bg="white")
par(mar=c(5,5,4,6))
contour2D(x=sal.c, y=temp.c, z=sigmat.c, lwd=2, main="T-S Diagram", col="black",xlab=expression("Salinity"),
          ylab=expression("Temperature ("~degree*"C)"))
data$temp
temp
temp <- unlist(data['temp'], use.names=FALSE)
sal <- unlist(data['sal'], use.names=FALSE)
sigma_theta <- sw_dens(S = sal, t = temp) - 1000
scatter2D(sal, temp, colvar=sigma_theta, pch=16, cex=1.25,
          add=TRUE, clim=range(sigmat.c), colkey=FALSE)
colkey(clim=range(sigmat.c), dist=0.005, side=4, add=TRUE,
       clab=expression("Density (kg m"^-3*")"), col.clab="black",
       side.clab=4, line.clab=2.5, length=1, width=0.8,
       col.axis="black", col.ticks="black", cex.axis=0.9)
dev.off()


S.seq  <- seq(from = 30, to = 38, length.out = 100)
t.seq  <- seq(from = -5, to = 30, length.out = 100)
sig.mat <- outer(S.seq, t.seq, FUN = function(S, t) sw_dens(S = S, t = t) - 1000)

contour2D(x = S.seq, y = t.seq, z = sig.mat, lwd = 2,
          xlab = "Salinity, psu", ylab = "Temperature, dgC", 
          main = "Sigma, p = 0 dbars")

# Measurements:
t <- c(10.119,    4.036,  13.062,  -0.579,  21.602,   2.984, 
       24.836,    0.111, 14.954)
S <- c(34.7130, 33.7890, 35.5660, 33.6816, 36.5660, 34.5210, 
       36.4310, 32.8912, 35.9200)
t=data$temp
S=data$sal
sigma <- sw_dens(S = S, t = t) - 1000       

scatter2D(S, t, colvar = sigma, pch = 18, cex = 2, add = TRUE, 
          clim = range(sig.mat), colkey = FALSE)
