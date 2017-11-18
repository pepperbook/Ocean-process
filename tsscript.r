#UPWELING IN SOUTHWEST COAST OF INDIA-INTERANNUAL VARIABILITY
#STUDY AREA -south west coast of India
#AIM-To plot the sst of 15 years (2003-2006)
#sst datas are downloaded from https://coastwatch.pfeg.noaa.gov/erddap
#datas used are Multi-scale Ultra-high Resolution (MUR) SST Analysis fv04.1, Global, 0.01°, 2002-present,Daily
#datas 2003-01-01T09:00:00Z 2016-12-31T09:00:00Z,stride=10 with LONG=(70E-79E) AND LONG=(3N-17N)
#dowloaded datas for each year separately and the datas in the file is called sst in .nc format
#enter the raster library for raster datas
library(raster)
#files present  in working directory are named as filenames
filenames<- list.files()
#every single year is stacked separately
filelist<- lapply(filenames,function(x)stack(x))
#the above stacked years are again stacked as single file and named as fullstack
sst<- stack(filelist)
#study area is divided in to 8 boxes as a1,a2,b1,b2,c1,c2,d1,d2
a1=c(77,78,7,8)
a2=c(77,78,4,5)
b1=c(76,77,8,9)
b2=c(71,72,8,9)
c1=c(74,76.5,8.5,12.5)
c2=c(71,72,9,12)
d1=c(72.5,75,12,16.5)
d2=c(71,72,12,16)
#crop the boxes from the bigger data set SST to get smaller boxes
a1crop<- crop(sst,a1)
a2crop<- crop(sst,a2)
b1crop<- crop(sst,b1)
b2crop<- crop(sst,b2)
c1crop<- crop(sst,c1)
c2crop<- crop(sst,c2)
d1crop<- crop(sst,d1)
d2crop<- crop(sst,d2)
# the boxes to values are converted to individual raster points
a1box<- rasterToPoints(a1crop)
a2box<- rasterToPoints(a2crop)
b1box<- rasterToPoints(b1crop)
b2box<- rasterToPoints(b2crop)
c1box<- rasterToPoints(c1crop)
c2box<- rasterToPoints(c2crop)
d1box<- rasterToPoints(d1crop)
d2box<- rasterToPoints(d2crop)
#triming the boxes to avoid 1st and 2nd coloumn
# -sign denotes elimination of the coloumn 
a1box<- a1box[,c(-1,-2)]
a2box<- a2box[,c(-1,-2)]
b1box<- b1box[,c(-1,-2)]
b2box<- b2box[,c(-1,-2)]
c1box<- c1box[,c(-1,-2)]
c2box<- c2box[,c(-1,-2)]
d1box<- d1box[,c(-1,-2)]
d2box<- d2box[,c(-1,-2)]
#Remove NA
a1box<- na.omit(a1box)
a2box<- na.omit(a2box)
b1box<- na.omit(b1box)
b2box<- na.omit(b2box)
c1box<- na.omit(c1box)
c2box<- na.omit(c2box)
d1box<- na.omit(d1box)
d2box<- na.omit(d2box)

#mean of every boxes for each day
a1box_m<- colMeans(a1box)
a2box_m<- colMeans(a2box)
b1box_m<- colMeans(b1box)
b2box_m<- colMeans(b2box)
c1box_m<- colMeans(c1box)
c2box_m<- colMeans(c2box)
d1box_m<- colMeans(d1box)
d2box_m<- colMeans(d2box)
#diference of the coloumns are taken to extract index values
a<- a2box_m-a1box_m 
b<- b2box_m-b1box_m
c<- c2box_m-c1box_m
d<- d2box_m-d1box_m
 #plot
par(mfrow=c(2,2))
     plot(a,type="l",xaxt="n",xlab="year",ylab="index",main="SST ANALYSIS-A")
#tickpoints are added to the below given points of days
tkpt<-c("365","731","1096","1461","1826","2192","2557","2922","3287","3653","4018","4383","4748","5114")
#at each tickmark the years are added from 2004 to 2017
axis(1,at = tkpt,labels = 2004:2017)

     plot(b,type="l",xaxt="n",xlab="year",ylab="index",main="SST ANALYSIS-B")
#tickpoints are added to the below given points of days
tkpt<-c("365","731","1096","1461","1826","2192","2557","2922","3287","3653","4018","4383","4748","5114")
#at each tickmark the years are added from 2004 to 2017
axis(1,at = tkpt,labels = 2004:2017)

    plot(c,type="l",xaxt="n",xlab="year",ylab="index",main="SST ANALYSIS-C")
#tickpoints are added to the below given points of days
tkpt<-c("365","731","1096","1461","1826","2192","2557","2922","3287","3653","4018","4383","4748","5114")
#at each tickmark the years are added from 2004 to 2017
axis(1,at = tkpt,labels = 2004:2017)

    plot(d,type="l",xaxt="n",xlab="year",ylab="index",main="SST ANALYSIS-D")
#tickpoints are added to the below given points of days
tkpt<-c("365","731","1096","1461","1826","2192","2557","2922","3287","3653","4018","4383","4748","5114")
#at each tickmark the years are added from 2004 to 2017
axis(1,at = tkpt,labels = 2004:2017)
 
 
 
 
