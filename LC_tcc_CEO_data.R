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
CEOsmpls <- read.csv('CEOdata\\compiled_CEOsmpls07272021.csv')
