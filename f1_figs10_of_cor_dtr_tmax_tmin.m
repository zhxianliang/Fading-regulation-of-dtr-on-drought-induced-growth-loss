%% correlation between DTR and Tmax/Tmin
load('dtr_gs.mat')
load tmax_tmin_gs.mat
load tem_pre_gs.mat
load('tree_latlon.mat')
load('crulatlon.mat')

for jj=1:2636
    
    ll1=lllon(jj);
    ll2=lllat(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);

        dt=dtr_gs(lonch11,latch11,1:80);
        tma=tmax_gs(lonch11,latch11,1:80);
        tmi=tmin_gs(lonch11,latch11,1:80);
        pp=pre_gs(lonch11,latch11,1:80);
        cc1=corrcoef(dt,tma);
        cc2=corrcoef(dt,tmi);
        cc3=corrcoef(dt,pp);
        cc4=corrcoef(tma,tmi);
        cor_tmax_dtr(jj,1)=cc1(1,2);
        cor_tmin_dtr(jj,1)=cc2(1,2);
        cor_pp_dtr(jj,1)=cc3(1,2);
        cor_tmax_tmin(jj,1)=cc4(1,2);

end

%huatu

h1=axesm('MapProjection','miller');
framem('on'); gridm('on'); 
mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,20,cor_tmin_dtr,'filled');
colormap(hot(11))
aa=colormap;
%aa(5,:)=1;
colormap(flipud(aa))
caxis([-1 1])
caxis([0 1])

h1=axesm('MapProjection','miller');
framem('on'); gridm('on'); 
mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,20,cor_tmax_dtr,'filled');
colormap(hot(11))
aa=colormap;
%aa(5,:)=1;
colormap(flipud(aa))
caxis([-1 1])
caxis([0 1])

h1=axesm('MapProjection','miller');
framem('on'); gridm('on'); 
mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,20,cor_tmax_tmin,'filled');
colormap(hot(11))
aa=colormap;
%aa(5,:)=1;
colormap(flipud(aa))
caxis([-1 1])
caxis([0 1])


h1=axesm('MapProjection','miller');
framem('on'); gridm('on'); 
mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,20,cor_pp_dtr,'filled');
colormap(hot(11))
aa=colormap;
%aa(5,:)=1;
colormap(flipud(aa))
caxis([-1 1])
caxis([0 1])