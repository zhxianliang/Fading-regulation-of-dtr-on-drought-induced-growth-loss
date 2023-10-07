install.packages("remotes")
remotes::install_github("kholsteen/geneRal")
library("forcats")
library(geneRal)
library(tidyverse)

library(ggplot2)
library(reshape2)
library(openxlsx)
library(ggpubr)


rm(list =ls()) 
ycor<-read.xlsx("E:\\DTR\\fig2.specor.xlsx",sheet=2)
ycor$growth[ycor$growth>2]<-NA
#yycor<-melt(ycor,c('X1','num'))
#ycor$num<-factor(ycor$num,levels = c('PCEN','ABLA','TSME','LAGM','LASI','PCAB','PCGL','PCMA','PIED','PINI','LADE','PIPO','PISY','PSME','TSCA','ABAL','NOPU','QURO','QUSP','FASY','QUAL','QUMA','QUST'))
ggplot(data = ycor,aes(x=species,y=growth,fill=DTR)) +
 # geom_violin(notch=TRUE,position=position_dodge(0.7))+
  geom_boxplot(notch=TRUE,position=position_dodge(0.8))+
 # geom_jitter(aes(color=variable),position=position_dodge(0.7))+
  scale_fill_manual(values = c('red','greenyellow'))+
  stat_compare_means(aes(group=DTR),label="p.signif",method="t.test")+
  xlab('Species')+
  ylab('Growth indices')+
  theme_test()+
  theme(axis.text = element_text(size=10))
ggsave("E:\\DTR\\newfigure\\figs5dry.tiff",width = 12, height = 5,dpi = 300)


#scale_fill_manual(values = c('#84a354','#84a354','#C0FF3E','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#84a354','#C0FF3E','#C0FF3E','#C0FF3E','#C0FF3E','#C0FF3E','#C0FF3E'))+

ycor<-read.xlsx("E:\\DTR\\fig2.specor.xlsx",sheet=3)
ycor$growth[ycor$growth>2]<-NA
#yycor<-melt(ycor,c('X1','num'))
#ycor$num<-factor(ycor$num,levels = c('PCEN','ABLA','TSME','LAGM','LASI','PCAB','PCGL','PCMA','PIED','PINI','LADE','PIPO','PISY','PSME','TSCA','ABAL','NOPU','QURO','QUSP','FASY','QUAL','QUMA','QUST'))
ggplot(data = ycor,aes(x=species,y=growth,fill=DTR)) +
  # geom_violin(notch=TRUE,position=position_dodge(0.7))+
  geom_boxplot(notch=TRUE,position=position_dodge(0.8))+
  # geom_jitter(aes(color=variable),position=position_dodge(0.7))+
  scale_fill_manual(values = c('red','greenyellow'))+
  stat_compare_means(aes(group=DTR),label="p.signif",method="t.test")+
  xlab('Species')+
  ylab('Growth indices')+
  theme_test()+
  theme(axis.text = element_text(size=10))
ggsave("E:\\DTR\\newfigure\\figs5wet.tiff",width = 12, height = 5,dpi = 300)
