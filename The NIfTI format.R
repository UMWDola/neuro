setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/DICOM")
all_slices_T1 = readDICOM("T1/")
dim(all_slices_T1$img[[11]])
hdr= all_slices_T1$hdr[[11]]
hdr[hdr$name == "PixelSpacing", "value"]
nii_T1=dicom2nifti(all_slices_T1)
d=dim(nii_T1); d; class(nii_T1)
image (1:d[1], 1:d[2], nii_T1[,,11],col=gray(0:64/64),xlab="",ylab="")
library(oro.nifti)
setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/NIfTI")
fname="Output_3D_File"
writeNIfTI(nim=nii_T1,filename=fname)
list.files(getwd(), pattern = "Output_3D_File")
list.files(getwd(),pattern = "T")
nii_T2=readNIfTI("T2.nii.gz", reorient = FALSE)
dim(nii_T2)
