#' ---
#' title: "02_Indonesia_TCC_CarbonSankey.R"
#' author: "K Tenneson, karistenneson@gmail.com"
#' date: "`r format(Sys.time(), '%B %d, %Y')`"
#' ---

#' ### Required packages
#+ Packages
library(tidyverse)
library(knitr)
library(rmarkdown)
library(tidyr)
library(networkD3)
library(tidyverse)
library(dplyr)

######################################################
################## Sankey data ##################
######################################################

#' Set working directory to where data is being stored.
setwd("C:\\Users\\karis\\Documents\\Philippines\\PhilippinesTCCcomp")

#####################################################################
### Load data
#####################################################################
CEOsmpls1030 <- read.csv('compiled_tcc10vs30_07272021.csv')
CEOsmpls10N <- read.csv('compiled_tcc10vsNAMRIA_07272021.csv')
CEOsmpls30N <- read.csv('compiled_tcc30vsNAMRIA_07272021.csv')

sort(unique(CEOsmpls10N$smpl_tcc10_nam))

#####################################################################
### tcc10 vs. NAMRIA
#####################################################################
shrub <- CEOsmpls10N$fTCC[CEOsmpls10N$smpl_tcc10_nam == 'Forest-Brush/Shrubs'| 
                           CEOsmpls10N$smpl_tcc10_nam =='Forest_Brush/Shrubs']

perennial<-CEOsmpls10N$fTCC[CEOsmpls10N$smpl_tcc10_nam == 'Forest-Perennial Crop' | 
                           CEOsmpls10N$smpl_tcc10_nam == 'Forest_Perennial Crop']

annual<-CEOsmpls10N$fTCC[CEOsmpls10N$smpl_tcc10_nam == 'Forest-Annual Crop' | 
                           CEOsmpls10N$smpl_tcc10_nam == 'Forest_Annual Crop'] 

forest_grass <- CEOsmpls10N$fTCC[CEOsmpls10N$smpl_tcc10_nam == 'Forest-Grassland'|
                                   CEOsmpls10N$smpl_tcc10_nam == 'Forest_Grassland']

boxplot(shrub, perennial, annual, forest_grass,
        main = "mean tree canopy cover in tcc10 by NAMRIA land cover",
        xlab = "fractional tree canopy cover",
        at = c(1,2, 3, 4),
        names = c("Brush or Shrub", "Perennial Crop", "Annual Crop", "Grassland"),
        #las = 2,
        col = c("#BE5504","#FF69B4", "pink", "yellow"),
        horizontal = F
        #, notch = TRUE
)


#####################################################################
### tcc30 vs. NAMRIA
#####################################################################

shrub <- CEOsmpls30N$fTCC[CEOsmpls30N$smpl_tcc30_nam == 'Forest-Brush/Shrubs'| 
                            CEOsmpls30N$smpl_tcc30_nam =='Forest_Brush/Shrubs']

perennial<-CEOsmpls30N$fTCC[CEOsmpls30N$smpl_tcc30_nam == 'Forest-Perennial Crop' | 
                              CEOsmpls30N$smpl_tcc30_nam == 'Forest_Perennial Crop']

annual<-CEOsmpls30N$fTCC[CEOsmpls30N$smpl_tcc30_nam == 'Forest-Annual Crop' | 
                           CEOsmpls30N$smpl_tcc30_nam == 'Forest_Annual Crop'] 

forest_grass <- CEOsmpls30N$fTCC[CEOsmpls30N$smpl_tcc30_nam == 'Forest-Grassland' | 
                                   CEOsmpls30N$smpl_tcc30_nam == 'Forest_Grassland']

boxplot(shrub, perennial, annual, forest_grass,
        main = "mean tree canopy cover in tcc30 by NAMRIA land cover",
        xlab = "fractional tree canopy cover",
        at = c(1,2, 3, 4),
        names = c("Brush or Shrub", "Perennial Crop", "Annual Crop", "Grassland"),
        #las = 2,
        col = c("#BE5504","#FF69B4", "pink", "yellow"),
        horizontal = F
        #, notch = TRUE
)

