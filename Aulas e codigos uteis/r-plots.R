x = rnorm(100)
x = sort(x)
x
hist(x)
y1 = x^2
plot(x,y1)
y2 = x^3
plot(x,y2)
par(mfrow=c(1,2))
plot(x,y1,ylab='y primeiro',xlab='xunico',pch=19,ty='l')
legend('topright',legend='y=x^2',pch=19)
plot(x,y2,ylab='y segundo',xlab='xunico',pch=19,ty='l')
legend('topleft',legend='y=x^3',pch=19)

#Mesmo gráfico com 2 y
par(mfrow=c(1,1))
plot(x,y1, xaxt='n',yaxt='n',col='red')
axis(1)
axis(2)
par(new=TRUE)
plot(x,y2, xaxt='n',yaxt='n',col='blue')
axis(4)
legend('top',legend=c('y=x^2',y='y=x^3'),pch=c(19,19),col=c('red','blue'))

#Lendo dados de ctd online

library(oce)
path = url('https://raw.githubusercontent.com/mauricio-camargo/sysgran4/main/std.cnv')
ctd = read.ctd(path)
temp = ctd[['temperature']]
sal = ctd[['salinity']]
depth = ctd[['depth']]

mint <- floor(min(temp))
maxt <- ceiling(max(temp))
mins <- floor(min(sal))
maxs <- ceiling(max(sal))
miny <- floor(min(depth))
maxy <- ceiling(max(depth))

t_ticks <- seq(mint,maxt,2)
s_ticks <- seq(mins,maxs,0.5)
y_ticks <- seq(miny),maxy,5)

par(mfrow=c(1,2))
plot(0,0, type="o", xaxt="n", yaxt="n", xlim=c(mint,maxt),
     ylim=rev(range(min(depth),max(depth))), col="white", 
     main="", xlab="", ylab="")
axis(2,at=y_ticks,labels=y_ticks)
axis(3,at=t_ticks,labels=t_ticks)
lines(temp,depth,type="l")
mtext('Temp', side=3,line=2)
mtext('Prof', side=2,line=2)

plot(0,0, type="o", xaxt="n", yaxt="n", xlim=c(mins,maxs),
     ylim=rev(range(min(depth),max(depth))), col="white", 
     main="", xlab="", ylab="")
axis(2,at=y_ticks,labels=y_ticks)
axis(3,at=s_ticks,labels=s_ticks)
lines(sal,depth,type="l")
mtext('Sal', side=3,line=2)
mtext('Prof', side=2,line=2)
