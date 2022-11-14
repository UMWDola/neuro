getwd()
"C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0"
setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/DICOM/FLAIR")
getwd()
slice= readDICOM("IM-0001-0011.dcm")
class(slice)
names(slice)
class(slice$hdr)
class(slice$hdr[[1]])
class(slice$img)
class(slice$img[[1]])
dim(slice$img[[1]])
d= dim(t(slice$img[[1]]))
image(1:d[1],1:d[2], t(slice$img[[1]]), col=gray (0:64/64))
slice$img[[1]] [101:105,121:125]
hist(slice$img[[1]][,],breaks=50, xlab="FLAIR",prob=T, col=rgb(0,0,1.1/4), main="")
hdr=slice$hdr[[1]]
names(hdr)
hdr$name
hdr[hdr$name == "PixelSpacing","value"]
hdr[hdr$name == "FlipAngle", ]
setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/DICOM")
all_slices_T1 = readDICOM("T1/")
dim(all_slices_T1$img[[11]])
hdr= all_slices_T1$hdr[[11]]
hdr[hdr$name == "PixelSpacing", "value"]
