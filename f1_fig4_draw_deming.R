library(ggplot2)
library(reshape2)
library(openxlsx)
yycor<-read.xlsx("E:\\DTR\\EIV.xlsx",sheet=1)
yycor$p_mn<-abs(yycor$p_mn)

ggplot(yycor, aes(x=cr_mean, y=p_mn))+ geom_point(size=2, color="black") + theme_bw()

library("deming")
fit <- deming(cr_mean ~ p_mn, data=yycor, xstd=cr_std, ystd=p_std)

library("mcr")

dem.reg <- mcreg(yycor$cr_mean,yycor$p_mn, method.reg = "Deming",na.rm = TRUE)
str(dem.reg)
dem.reg@para

demreg.c1 <- mcreg(yycor$p_mn,yycor$cr_mean, method.reg = "Deming", error.ratio = 7.076414e-05,na.rm = TRUE)

ggplot(yycor, aes(x =abs(p_mn) , y = cr_mean)) +
  geom_errorbar(aes(ymin = cr_mean-cr_std, ymax = cr_mean+cr_std), width=.0, size=1.1, alpha = 0.8) + 
  theme_bw() + geom_point(size=2.5) + theme_bw() + 
  geom_abline(intercept=demreg.c1@para[1], slope=demreg.c1@para[2], colour="black") +
  scale_x_continuous(name="Drought tolerance [-MPa]") + scale_y_continuous(name="Drought-growth correlation")


ggsave("E:\\DTR\\figp50crn.tiff",width = 8, height = 6,dpi = 300)


p <- p + geom_abline(intercept=demreg.c1@para[1], slope=demreg.c1@para[2], colour="black") 



p <- p + geom_abline(intercept=demreg.c1.n@para[1], slope=demreg.c1.n@para[2], colour="blue") 
p + geom_abline(intercept=demreg.c1.b@para[1], slope=demreg.c1.b@para[2], colour="red") 

#Light frost
p <- ggplot(tolerance, aes(x = Tlp_mean, y = LF_FT_mean, col=Leaf_type)) +
  geom_errorbar(aes(ymin = LF_FT_mean-LF_FT_se, ymax = LF_FT_mean+LF_FT_se), width=.0, size=1.1, alpha = 0.8) + 
  geom_errorbar(aes(xmin = Tlp_mean-Tlp_se, xmax = Tlp_mean+Tlp_se), width=.0, size=1.1, alpha = 0.8)+ 
  theme_bw() + geom_point(size=2.5) + theme_bw() + 
  scale_x_continuous(name="Turgor Loss Point [-MPa]") + scale_y_continuous(name="Frost Tolerance [%]") + ggtitle("Tolerance to Light Frost vs. Drought by Leaf Type")
p <- p + geom_abline(intercept=demreg.c2@para[1], slope=demreg.c2@para[2], colour="black") 
p <- p + geom_abline(intercept=demreg.c2.n@para[1], slope=demreg.c2.n@para[2], colour="blue") 
p + geom_abline(intercept=demreg.c2.b@para[1], slope=demreg.c2.b@para[2], colour="red") 
