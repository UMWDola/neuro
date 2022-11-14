library(oro.nifti)
mridir <- "C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/kirby21/visit_1/113"
T1 <- readNIfTI(file.path (mridir, "/113-01-MPRAGE.nii"), reorient=FALSE)
orthographic(T1)
mask <- readNIfTI(file.path (mridir, '/SUBJ0001_mask.nii/SUBJ0001_mask.nii'), reorient=FALSE)
orthographic(mask)
masked.T1 <-T1*mask
orthographic(masked.T1)
mridir1 <- "C:/Users/mine/Downloads/Neurohacking_data-0.0/Neurohacking_data-0.0/kirby21/visit_2/113"
T1.follow <- readNIfTI(file.path (mridir1, '/113-02-MPRAGE.nii'), reorient=FALSE)
subtract.T1 <- T1.follow - T1
min(subtract.T1)
max(subtract.T1)
orthographic(subtract.T1)
