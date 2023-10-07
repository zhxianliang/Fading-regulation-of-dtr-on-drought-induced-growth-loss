% warming rate of Tmax and Tmin
load('E:\DTR\tmax_tmin_gs.mat')
load('E:\DTR\tree_latlon.mat')
load('E:\DTR\crulatlon.mat')

for jj=1:2636
    ll1=lllon(jj);
    ll2=lllat(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);
    tmaxx=tmax_gs(lonch11,latch11,1:115);
    tmxx(:,jj)=reshape(tmaxx,115,1);
    tminn=tmin_gs(lonch11,latch11,1:115);
    tmnn(:,jj)=reshape(tminn,115,1); 
end

        xx1=[1:80]';
        xx2=ones(80,1);
        xx=[xx1,xx2];
for i=1:2636
         tt=tmxx(1:80,i);
         tt2=tmnn(1:80,i);
        if isnan(nanmean(tt))
           trend_tmax(i)=nan;
         
       else
        p = regress(tt,xx);
           trend_tmax(i)=p(1);
        end
     if isnan(nanmean(tt2))
           trend_tmnn(i)=nan;
         
       else
        p1 = regress(tt,xx);
           trend_tmnn(i)=p1(1);
     end
end


