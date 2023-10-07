library(lme4)
library(xlsx)
library(MuMIn)
library(reshape2)
library(gbm)
library(dismo)
library(ggplot2)
rm(list=ls())
temp = read.xlsx('E:\\DTR\\climatdata.xlsx',1) 
colnames(temp)<-c('Species','gloss','PDSI','PRE','DTR','TEM','Tmax','Tmin','gloss10')
tempp <- na.omit(temp)
gbmw<-gbm.step(data=tempp, gbm.x=c(1,3:5,7:8),gbm.y =9,family="gaussian",
               tree.complexity =5,learning.rate = 0.01, bag.fraction =0.5)

pp<-summary(gbmw)

