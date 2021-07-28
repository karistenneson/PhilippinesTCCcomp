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
source("00_GIA_functions.R")

#####################################################################
### Load data
#####################################################################

#+ inputdata
# Data input and cleaning ------------------------------------------------------
# Code for Continental SEA
# rawData <- read_csv("data/Compiled/Myanmar_points.csv", col_types = "ddddldcdcdddcdccccc")

## Code for Indonesia and Philippines
dataPath <- c("CEOdata/")
files <- dir(dataPath)

rawData <- files %>%
  map_dfr(~ read_csv(file.path(dataPath, .)))

write.csv(rawData, file = 'CEOdata/compiled_CEOsmpls07272021.csv', row.names = F)

#####################################################################
### Load data
#####################################################################
CEOsmpls <- read.csv('CEOdata\\compiled_CEOsmpls07272021.csv')

CEOsmplsSubset<-CEOsmpls[is.na(CEOsmpls$Is.this.area.forest.) == F,]
colnames(CEOsmplsSubset)

colnames(CEOsmplsSubset)[21]<-'forest'
colnames(CEOsmplsSubset)[22]<-'fTCC'
colnames(CEOsmplsSubset)[23]<-'confidence'
colnames(CEOsmplsSubset)[24]<-'notes'
colnames(CEOsmplsSubset)[25]<-'demoPlot'
colnames(CEOsmplsSubset)[26]<-'issues'
colnames(CEOsmplsSubset)

CEOsmplsSubset$smpl_tcc10_nam 

tcc30_N<-CEOsmplsSubset[is.na(CEOsmplsSubset$smpl_tcc30_nam) == F, ]
tcc10_N<-CEOsmplsSubset[is.na(CEOsmplsSubset$smpl_tcc10_nam) == F, ]
tcc10_30<-CEOsmplsSubset[is.na(CEOsmplsSubset$smpl_comp10_30) == F, ]

write.csv(tcc10_30, file = 'compiled_tcc10vs30_07272021.csv', row.names = F)
write.csv(tcc10_N, file = 'compiled_tcc10vsNAMRIA_07272021.csv', row.names = F)
write.csv(tcc30_N, file = 'compiled_tcc30vsNAMRIA_07272021.csv', row.names = F)


