#' Pareto Barplot
#'
#' @param x   Input
#' @param mn   Main Title
#' @param ... Graph parameters
#'
#' @return
#' @export
#'
#' @examples
pareto<-function(x,mn="Pareto barplot",...){  # x is a vector
  x.tab=table(x)
  xx.tab=sort(x.tab, decreasing=TRUE,index.return=FALSE)
  cumsum(as.vector(xx.tab))->cs
  length(x.tab)->lenx
  bp<-graphics::barplot(xx.tab,ylim=c(0,max(cs)),las=2)
  lb<-seq(0,cs[lenx],l=11)
  graphics::axis(side=4,at=lb,labels=paste(seq(0,100,length=11),"%",sep=""),las=1,line=-1,col="Blue",col.axis="Red")
  for(i in 1:(lenx-1)){
   graphics::segments(bp[i],cs[i],bp[i+1],cs[i+1],col=i,lwd=2)
  }
  graphics::title(main=mn,...)

}
