install.packages("fslr")

Sys.getenv("C:/Users/mine/Desktop/GIT Neuro1/Neuro analysis/FSLR.R")
library("fslr")
have.fsl()
#if have.fsl = false,then specify the fsl path.
options(fsl.path="C:\Users\mine\AppData\Local\Temp\RtmpSK1TKF\downloaded_packages")
#do this everytime you start in R studio if you want to use fslr packages
setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/kirby21/visit_1/113")
library(oro.nifti)
nim= readNIfTI("113-01-MPRAGE.nii/113-01-MPRAGE.nii", reorient=FALSE)
#statistics using fslr
mean(nim)
fslstats(nim, opts= "-m")
fslstats ("113-01-MPRAGE.nii/113-01-MPRAGE.nii", opts= "-m")
fslstats.help()
library("fslr")
fslstats(nim, opts= "-m")
