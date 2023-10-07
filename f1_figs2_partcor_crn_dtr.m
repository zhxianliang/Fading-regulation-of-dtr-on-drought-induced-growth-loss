%% partial correlation between tree growth and DTR during dry years
userpath('E:\DTR\')
clc
clear
load('nb2635.mat')
load('climatedata.mat')
dtrm=tmaxp-tminp;
for i=[1:328,330:331,333:361,363:448,450:2274,2276:2636]
    nb=nbc(1:80,i);
    pd=pdp(1:80,i);
    temm=temp(1:80,i);
    dtrr=dtrm(1:80,i);
    nb21=nb;
    nb22=nb;
    nb21(pd>-0.5)=nan; %pdsi small
    nb22(pd<0.5)=nan; %pdsi large
   cordry(i,1)=partialcorr(nb21,dtrr,temm,'rows','complete');
   corwet(i,1)=partialcorr(nb22,dtrr,temm,'rows','complete');

end

cordry(cordry==0)=nan;
load('tree_latlon.mat')
h1=axesm('MapProjection','miller','Grid','on');
framem('on'); gridm('on'); mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,abs(cordry)*150,cordry,'filled','MarkerEdgeColor',[0.5 .5 .5]);
colormap(jet(11))
aa=colormap;
aa(5:7,:)=1;
colormap(aa)
colorbar