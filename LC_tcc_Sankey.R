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
### Differences between LC maps.
#####################################################################

# load conversion data.
tcc10 <- read.csv('SummaryStats\\tcc10_LC_Sankey.csv')
head(tcc10)

colnames(tcc10)
# Union_ha         CentralCord_ha   Cagayan_ha      
# Isabela_ha       Mindoro_ha       Palawan_ha       
# Bohol_ha         Zamboanga_ha     SouthCotabato_ha

Pilot<-tcc10$Union_ha; name <- 'Union'
Pilot<-tcc10$CentralCord_ha; name <- 'centralCordillera' 
Pilot<-tcc10$Cagayan_ha; name <- 'Cagayan'
Pilot<-tcc10$Isabela_ha; name <- 'Isabela'
Pilot<-tcc10$Mindoro_ha; name <- 'Mindoro'
Pilot<-tcc10$Palawan_ha; name <- 'Palawan'
Pilot<-tcc10$Bohol_ha; name <- 'Bohol'
Pilot<-tcc10$Zamboanga_ha; name <- 'Zamboanga'
Pilot<-tcc10$SouthCotabato_ha; name <- 'Cotabato'
Pilot<-tcc10$AgusanDelSur_ha; name <- 'AgusanDelSur'

# Make a connection data frame
links <- data.frame(
  source=tcc10$tcc10[Pilot>0], 
  target=tcc10$NAMRIA_LC[Pilot>0], 
  value=Pilot[Pilot>0]
)

# From these flows we need to create a node data frame: it lists every entities involved in the flow
nodes <- data.frame(
  name=c(as.character(links$source), as.character(links$target)) %>% 
    unique()
)

# With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
links$IDsource <- match(links$source, nodes$name)-1 
links$IDtarget <- match(links$target, nodes$name)-1

nodes$group<-'update'
hits<-grep("Forest", nodes$name); nodes$group[hits] <- 'forest'
hits<-grep("Mangrove", nodes$name); nodes$group[hits] <- 'forest'
hits<-grep("Non", nodes$name); nodes$group[hits] <- 'non'
hits<-grep("Brush", nodes$name); nodes$group[hits] <- 'brush'
hits<-grep("Crop", nodes$name); nodes$group[hits] <- 'crop'
hits<-grep("Grass", nodes$name); nodes$group[hits] <- 'grass'
hits<-grep("Other", nodes$name); nodes$group[hits] <- 'other'
unique(nodes$group)

# prepare color scale: I give one specific color for each node.
my_color <- 'd3.scaleOrdinal() .domain([
"update", "forest", "non",
"brush", "crop", "grass", "other"]) 
.range([
"lightgrey","darkgreen", "#0047AB", 
"#BE5504", "#FF69B4", "yellow","charcoal"])'
## ??, grassland, ??, other, closed forest

links$LinkGroup<-'update'

# Make the Network. I call my colour scale with the colourScale argument
p <- sankeyNetwork(Links = links, Nodes = nodes, Source = "IDsource", Target = "IDtarget", 
                   Value = "value", NodeID = "name", colourScale=my_color, 
                   NodeGroup="group", LinkGroup = "LinkGroup",
                   fontSize = 16, nodeWidth = 20,fontFamily = "Arial")
p
name 

#######################
## Look up how to customize colors:
## https://www.r-graph-gallery.com/322-custom-colours-in-sankey-diagram/

## https://stackoverflow.com/questions/49294056/how-to-set-the-color-of-nodes-in-the-sankey-plot-using-the-networkd3-library?rq=1

