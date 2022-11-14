#set your working directory, defined as mridr
setwd("C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/NIfTI")
mridir<-"C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/BRAINIX/NIfTI"
#do sequence, FLAIR (hyperintense)
sequence <- "FLAIR"
volume.f <- readNIfTI (file.path (mridir,paste0(sequence,'.nii')), reorient=FALSE)
volume.f<- cal_img(volume.f)
image(volume.f, z=12,plot.type = "single")
#do the same for sequence, T1 (hypo intense)
sequence <-'T1'
volume.t1 <- readNIfTI (file.path(mridir, paste0(sequence, '.nii')), reorient=FALSE)
volume.t1 <- cal_img(volume.t1)
image(volume.t1, z=12,plot.type = 'single')
#sequence, T2 (hyper intense)
sequence <-'T2'
volume.t2 <-readNIfTI (file.path(mridir, paste0(sequence, '.nii')), reorient = FALSE)
volume.t2 <- cal_img(volume.t2)
image(volume.t2, z=12, plot.type='single')
