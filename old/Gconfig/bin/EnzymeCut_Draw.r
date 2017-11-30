times<-Sys.time();
options(bitmapType='cairo');
library('getopt');
spec = matrix(c(
	'help' , 'h', 0, "logical",
	'infile' , 'i', 1, "character",
	'outfile' , 'o', 1, "character"
), byrow=TRUE, ncol=4);
opt = getopt(spec);
print_usage <- function(spec=NULL){
	cat(getopt(spec, usage=TRUE));
	cat("Usage example: \n")
	cat("
	Usage example: 

	Options: 
	--help		NULL 		get this help
	--infile 	character 	the input file [forced]
	--outfile 	character 	the filename for output graph [forced]
	\n")
		q(status=1);
}
if ( !is.null(opt$help) ) { print_usage(spec) }
if ( is.null(opt$infile) )	{ print_usage(spec) }
if ( is.null(opt$outfile) )	{ print_usage(spec) }

a<-read.table(opt$infile);
pdf(file=paste(opt$outfile,".pdf",sep=""))
plot(a[,1],a[,2],col="royalblue",type="h",xlim=c(200,1000),xlab="Fragment length",ylab="Fragment Number",main="Frangment and Length")
dev.off()
png(file=paste(opt$outfile,".png",sep=""))
plot(a[,1],a[,2],col="royalblue",type="h",xlim=c(200,1000),xlab="Fragment length",ylab="Fragment Number",main="Frangment and Length")
dev.off()

pdf(file=paste(opt$outfile,".all.pdf",sep=""))
plot(a[,1],a[,2],col="royalblue",type="h",xlim=c(200,10000),xlab="Fragment length",ylab="Fragment Number",main="Frangment and Length")
dev.off()
png(file=paste(opt$outfile,".all.png",sep=""))
plot(a[,1],a[,2],col="royalblue",type="h",xlim=c(200,10000),xlab="Fragment length",ylab="Fragment Number",main="Frangment and Length")
dev.off()
escaptime=Sys.time()-times;
print("Done!")
print(escaptime);
q()