stdCoef.merMod <- function(object) {
  sdy <- sd(getME(object,"y"))
  sdx <- apply(getME(object,"X"), 2, sd)
  sc <- fixef(object)*sdx/sdy
  se.fixef <- coef(summary(object))[,"Std. Error"]
  se <- se.fixef*sdx/sdy
  return(data.frame(stdcoef=sc, stdse=se))
}

library(lme4)
library(xlsx)
library(MuMIn)
rm(list=ls())
ppp1<-matrix(data=NA,nrow = 15,ncol = 3)
ppp2<-matrix(data=NA,nrow = 15,ncol = 7)
for (i in 1:15)
{
  temp = read.xlsx('E:\\DTR\\glossdata_lmn.xls',i,header=FALSE,startRow =1) 
  ddd<-apply(temp,2,function(x) ifelse(x>1000,NA,x))
  date <- na.omit(ddd)
  colnames(date)<-c('gloss','pdsi','dtr','tmax','tmin','tem','pre','species','age')
  date<-data.frame(date)
fm1<-lmer(gloss~pdsi+dtr+pdsi*dtr+(1|species/age),date)

fm2<-lmer(gloss~tmax+tmin+tmax*tmin*pdsi+(1|species/age),date)
ss1<-stdCoef.merMod(fm1)
ss2<-stdCoef.merMod(fm2)

ppp1[i,]<-ss1[2:4,1]
ppp2[i,]<-ss2[2:8,1]
}

colnames(ppp1)<-c('pdsi','dtr','pdsi*dtr')
colnames(ppp2)<-c('tmax','tmin','pdsi','tmax*tmin','tmax*pdsi','tmin*pdsi','tmax*tmin*pdsi')

write.xlsx(ppp1,'E:\\DTR\\LMER_gloss_result_dtr.xlsx','sheet1')
write.xlsx(ppp2,'E:\\DTR\\LMER_gloss_result_tamxtmin.xlsx','sheet2')

s1<-summary(fm1)

s2<-summary(fm2)

