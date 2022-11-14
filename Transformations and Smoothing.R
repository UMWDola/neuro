im_hist <- hist(T1,plot = FALSE)
par(mar= c(5,4,4,4) + 0.3)
col1=rgb(0,0,1,1/2)
plot(im_hist$mids,im_hist$counts, log = "y", type = "h",lwd=10, lend=2, col=col1,xlab="intensity values", ylab ="count(Log Scale)")
par(new = TRUE)
curve(x*1, axes = FALSE, xlab = "", ylab= "", col=2, lwd=3)
axis(side=4,at = pretty(range(im_hist$mids))/max(T1), labels=pretty(range(im_hist$mids))) 
mtext("Original Intensity", side=4, line=2)
#define a different transfer function
lin.sp<- function(x,knots,slope)
  {knots<-c(min(x),knots,max(x))
  slopeS<-slope[1]
  for(j in 2: length(slope)) {slopeS<-c(slopeS, slope[j]-sum(slopeS))}
  rvals<-numeric(length(x))
  for(i in 2: length(knots))
  {rvals<-ifelse(x>=knots[i-1], slopeS[i-1]*(x-knots[i-1])+rvals, rvals)}
  return(rvals)}
#define a spline with two knots and three slopes
knot.vals <- c(.3,.6)
slp.vals <-  c(1,.5,.25)

par(new = TRUE)
curve(lin.sp(x,knot.vals,slp.vals), axes=FALSE,xlab="",ylab="",col=2,lwd=3)
axis(side=4,at= pretty(range(im_hist$mids))/max(T1), labels=pretty(range(im_hist$mids)))
mtext ("Transformed Intensity", side=4, line=2)
#image transformation
trans_T1<-lin.sp(T1, knot.vals*max(T1), slp.vals)
image(T1,z=150,plot.type='single',main="Original Image")
image(trans_T1, z=150, plot.type='single', main="Transformed Image")
knots.vals*max(T1)
#AnalyzeFMRI: GaussSmoothArray
install.packages('C:/Users/mine/Downloads/AnalyzeFMRI_1.1-16.tar',lib ='C:/Users/mine/AppData/Local/R/win-library/4.2')
library(AnalyzeFMRI)
smooth.T1<- GaussSmoothArray(T1,voxdim=c(1,1,1), ksize=11,sigma=diag(3,3),mask=NULL,var.norm=FALSE)
orthographic(smooth.T1)
