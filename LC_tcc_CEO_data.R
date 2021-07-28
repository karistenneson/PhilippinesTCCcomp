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
colnames(CEOsmpls10N)
head(CEOsmpls10N)

#####################################################################
### tcc10 vs. NAMRIA
#####################################################################
shrub10 <- CEOsmpls10N[(CEOsmpls10N$smpl_tcc10_nam == 'Forest-Brush/Shrubs'| 
                           CEOsmpls10N$smpl_tcc10_nam =='Forest_Brush/Shrubs'), 
                     c('fTCC', 'smpl_site')]

perennial10<-CEOsmpls10N[(CEOsmpls10N$smpl_tcc10_nam == 'Forest-Perennial Crop' | 
                           CEOsmpls10N$smpl_tcc10_nam == 'Forest_Perennial Crop'), 
                           c('fTCC', 'smpl_site')]

annual10<-CEOsmpls10N[(CEOsmpls10N$smpl_tcc10_nam == 'Forest-Annual Crop' | 
                           CEOsmpls10N$smpl_tcc10_nam == 'Forest_Annual Crop'), 
                         c('fTCC', 'smpl_site')] 

forest_grass10 <- CEOsmpls10N[(CEOsmpls10N$smpl_tcc10_nam == 'Forest-Grassland'|
                                   CEOsmpls10N$smpl_tcc10_nam == 'Forest_Grassland'), 
                                 c('fTCC', 'smpl_site')]

#####################################################################
shrub30 <- CEOsmpls30N[(CEOsmpls30N$smpl_tcc30_nam == 'Forest-Brush/Shrubs'| 
                                CEOsmpls30N$smpl_tcc30_nam =='Forest_Brush/Shrubs'), 
                       c('fTCC', 'smpl_site')]

perennial30<-CEOsmpls30N[(CEOsmpls30N$smpl_tcc30_nam == 'Forest-Perennial Crop' | 
                                  CEOsmpls30N$smpl_tcc30_nam == 'Forest_Perennial Crop'), 
                         c('fTCC', 'smpl_site')]

annual30<-CEOsmpls30N[(CEOsmpls30N$smpl_tcc30_nam == 'Forest-Annual Crop' | 
                               CEOsmpls30N$smpl_tcc30_nam == 'Forest_Annual Crop'), 
                      c('fTCC', 'smpl_site')] 

forest_grass30 <- CEOsmpls30N[(CEOsmpls30N$smpl_tcc30_nam == 'Forest-Grassland'|
                                       CEOsmpls30N$smpl_tcc30_nam == 'Forest_Grassland'), 
                              c('fTCC', 'smpl_site')]

#####################################################################
#####################################################################

boxplot(shrub10$fTCC, shrub30$fTCC, perennial10$fTCC, perennial30$fTCC, 
        annual10$fTCC, annual30$fTCC, forest_grass10$fTCC, forest_grass30$fTCC,
        main = "mean tree canopy cover in tcc10 by NAMRIA land cover",
        border = NA, xaxt='n', yaxt = "n", frame = FALSE, notch = TRUE
)
vec<-seq(from = 0, to = 100, by = 20)
for (i in 1:6){
abline(h= vec[i], col = 'grey')
        }

vec<-seq(from = 10, to = 110, by = 20)
for (i in 1:6){
        abline(h= vec[i], col = 'lightgrey', lty=2)
}

boxplot(shrub10$fTCC, shrub30$fTCC, perennial10$fTCC, perennial30$fTCC, 
        annual10$fTCC, annual30$fTCC, forest_grass10$fTCC, forest_grass30$fTCC,
        main = "mean tree canopy cover in tcc10 by NAMRIA land cover",
        ylab = "percent tree canopy cover",
        at = c(1,2, 3, 4, 5, 6, 7, 8),
        names = c("Brush 10","Brush 30", "Perennial 10", "Perennial 30", 
                  "Annual 10", "Annual 30", "Grassland 10", "Grassland 30"),
        #las = 2,
        col = c("#BE5504","#BE5504","#FF69B4","#FF69B4", "pink","pink", "yellow", "yellow"),
        notch = TRUE, add = T
)

#####################################################################
#####################################################################
#####################################################################

boxplot(shrub10$fTCC~shrub10$smpl_site,
        main = "mean tree canopy cover in tcc10 by NAMRIA land cover",
        border = NA, xaxt='n', yaxt = "n", frame = FALSE, notch = TRUE
)
vec<-seq(from = 0, to = 100, by = 20)
for (i in 1:6){
        abline(h= vec[i], col = 'grey')
}

vec<-seq(from = 10, to = 110, by = 20)
for (i in 1:6){
        abline(h= vec[i], col = 'lightgrey', lty=2)
}

boxplot(shrub10$fTCC, shrub30$fTCC, perennial10$fTCC, perennial30$fTCC, 
        annual10$fTCC, annual30$fTCC, forest_grass10$fTCC, forest_grass30$fTCC,
        main = "mean tree canopy cover in tcc10 by NAMRIA land cover",
        ylab = "percent tree canopy cover",
        at = c(1,2, 3, 4, 5, 6, 7, 8),
        names = c("Brush 10","Brush 30", "Perennial 10", "Perennial 30", 
                  "Annual 10", "Annual 30", "Grassland 10", "Grassland 30"),
        #las = 2,
        col = c("#BE5504","#BE5504","#FF69B4","#FF69B4", "pink","pink", "yellow", "yellow"),
        notch = TRUE, add = T
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

