library(plot3D)
library(marelac)

data = read.table('data.txt',header=T,dec=',')
data

mint = min(data$temp)
maxt = max(data$temp)
mins = min(data$sal)
maxs = max(data$sal)

sal.seq = seq(from=mins, to=maxs, length.out=100)
temp.seq = seq(from=mint, to=maxt, length.out=100)
sigmat.seq = outer(sal.seq, temp.seq, FUN=function(S, t)
  sw_dens(S=S, t=t) - 1000)
#Salvando em alta definição: guarde isso...
png(filename="figure-name.png", width=15, height=15, unit="cm",
    res=600, pointsize=12, bg="white")
par(mar=c(5,5,4,6))
contour2D(x=sal.seq, y=temp.seq, z=sigmat.seq, lwd=2, main="T-S Diagram", col="black",xlab=expression("Salinity"),
          ylab=expression("Temperature ("~degree*"C)"))
temp = unlist(data['temp'], use.names=FALSE)
sal = unlist(data['sal'], use.names=FALSE)

temp = data$temp
sal = data$sal

sigma_theta <- sw_dens(S = sal, t = temp) - 1000
scatter2D(sal, temp, colvar=sigma_theta, pch=16, cex=1.25,
          col=rainbow(15), add=TRUE, clim=range(sigmat.seq), colkey=FALSE)
colkey(clim=range(sigmat.seq), dist=0.005, side=4, add=TRUE,
       clab=expression("Densidade (kg m"^-3*")"), col.clab="black",
       side.clab=4, line.clab=2.5, length=1, width=0.8,
       col.axis="black", col.ticks="black", cex.axis=0.9)
dev.off() #Fecha o device gráfico

