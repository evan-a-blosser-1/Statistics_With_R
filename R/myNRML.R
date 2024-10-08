#' Newton-Raphson Method
#'
#' @param x0        X-not first approximation value
#' @param delta     increment, try 0.001
#' @param llik      :
#' @param xrange    :
#' @param parameter :
#' @description
#'    This is a
#'
#' @return         A list of X & Y values, and plots a graph
#' @export
#'
#' @examples
#' myNRML(x0=0.99,delta=0.000001,llik=function(x)
#' log(dbinom(12,size=20,prob=x)*dbinom(10,size=25,prob=x)),
#' xrange=c(0.01,0.99),parameter="p" )
myNRML=function(x0,delta=0.001,llik,xrange,parameter="param"){
  f=function(x) (llik(x+delta)-llik(x))/delta
  fdash=function(x) (f(x+delta)-f(x))/delta
  d=1000
  i=0
  x=c()
  y=c()
  x[1]=x0
  y[1]=f(x[1])
  while(d > delta & i<100){
    i=i+1
    x[i+1]=x[i]-f(x[i])/fdash(x[i])
    y[i+1]=f(x[i+1])
    d=abs(y[i+1])
  }
  graphics::layout(matrix(1:2,nrow=1,ncol=2,byrow=TRUE),width=c(1,2))
  graphics::curve(llik(x), xlim=xrange,xlab=parameter,ylab="log Lik",main="Log Lik")
  graphics::curve(f(x),xlim=xrange,xaxt="n", xlab=parameter,ylab="derivative",main=  "Newton-Raphson Algorithm \n on the derivative")
  graphics::points(x,y,col="Red",pch=19,cex=1.5)
  graphics::axis(1,x,round(x,2),las=2)
  graphics::abline(h=0,col="Red")

  graphics::segments(x[1:(i-1)],y[1:(i-1)],x[2:i],rep(0,i-1),col="Blue",lwd=2)
  graphics:: segments(x[2:i],rep(0,i-1),x[2:i],y[2:i],lwd=0.5,col="Green")

  list(x=x,y=y)
}
