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
