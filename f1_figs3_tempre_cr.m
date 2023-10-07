%% correlation between tree growth indices and climate variables (temperature and precipitation)
clc
clear
load('cord.mat', 'txt')
load('crn_all.mat')
load('crulatlon.mat')
load('metadata.mat')
load('spe_num.mat')
load('tem_pre_gs.mat')

specc=unique(spec);
sssp=specc(numb>50);


   nnn=numb(numb>50);

    ll=sssp(1);
    [m,n]= find(strcmp(ll,spec));
    nbt=numm(:,m+1);
    nbbb=nanmean(nbt(1:115,:));
    num=find(~isnan(nbbb));
    mm=m(num);
    nb=numm(:,mm+1);
    lllon=llon(mm);
    lllat=llat(mm);
for jj=1:size(mm,1)
    ll1=lllon(jj);
    ll2=lllat(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);
    pp=tem_gs(lonch11,latch11,1:115);
    temp(:,jj)=reshape(pp,115,1);
    pdd=pre_gs(lonch11,latch11,1:115);
    prep(:,jj)=reshape(pdd,115,1);
    
end
    nyear=80;
nb1=nb(1:nyear,:);
pre1=prep(1:nyear,:);
tem1=temp(1:nyear,:);


for i=1:size(nb1,2)
  nb33=nb1(:,i);
  pd3=pre1(:,i);
  cc1=corrcoef(nb33,pd3,'rows','complete');
  
  if size(cc1,2)>1
  ccc5(i)=cc1(1,2);
  else 
  ccc5(i)=nan;
  end
  
  nb43=nb1(:,i);
  pd4=tem1(:,i);
  cc21=corrcoef(nb43,pd4,'rows','complete');
  
  if size(cc21,2)>1
  ccc25(i)=cc21(1,2);
  else 
  ccc25(i)=nan;
  end
  
end
ccc53=ccc5';
ccc253=ccc25';
clear  pdsi1 pdsid dtr1 dtrd pddp dtrp dtr11 dtrmm ind* b


for ss=2:23
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    nbt=numm(:,m+1);
    nbbb=nanmean(nbt(1:110,:));
    num=find(~isnan(nbbb));
    mm=m(num);
    nb=numm(:,mm+1);    
    lllon1=llon(mm);
    lllat1=llat(mm);
   
    lllon=[lllon;lllon1];
    lllat=[lllat;lllat1];
    
for jj=1:size(mm,1)
    ll1=lllon1(jj);
    ll2=lllat1(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);
    pp=tem_gs(lonch11,latch11,1:115);
    temp(:,jj)=reshape(pp,115,1);
    pdd=pre_gs(lonch11,latch11,1:115);
    prep(:,jj)=reshape(pdd,115,1);
    
end
    nyear=80;
nb1=nb(1:nyear,:);
pre1=prep(1:nyear,:);
tem1=temp(1:nyear,:);


for i=1:size(nb1,2)
  nb33=nb1(:,i);
  pd3=pre1(:,i);
  cc1=corrcoef(nb33,pd3,'rows','complete');
  
  if size(cc1,2)>1
  ccc51(i)=cc1(1,2);
  else 
  ccc51(i)=nan;
  end
  
  nb43=nb1(:,i);
  pd4=tem1(:,i);
  cc21=corrcoef(nb43,pd4,'rows','complete');
  
  if size(cc21,2)>1
  ccc251(i)=cc21(1,2);
  else 
  ccc251(i)=nan;
  end
  
end
   ccc52=ccc51';
   ccc252=ccc251';
   
clear  pdsi1 pdsid dtr1 dtrd pddp dtrp dtr11 dtrmm ind* b lllon1 lllat1 ccc51 ccc251
   
    ccc53=[ccc53;ccc52];    % correlation between PRE and growth
    ccc253=[ccc253;ccc252];  % correlation between TEM and growth
end
pre_crn_cr=ccc53;
tem_crn_cr=ccc253;

%% PRE_cr figure

h1=axesm('MapProjection','miller','Grid','on','MapLatLimit',[-90,90]);
framem('on'); gridm('on'); mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,abs(pre_crn_cr)*100,pre_crn_cr,'filled','MarkerEdgeColor',[0.5 .5 .5]);
colormap(jet(9))
caxis([-0.8 0.8])
aa=colormap;
aa(4:6,:)=1;
colormap(aa)

%% Tem_cr figure

h1=axesm('MapProjection','miller','Grid','on','MapLatLimit',[-90,90]);
framem('on'); gridm('on'); mlabel('south'); plabel('west');
load coast;
plotm(lat, long,'black');
scatterm(lllat, lllon,abs(tem_crn_cr)*100,tem_crn_cr,'filled','MarkerEdgeColor',[0.5 .5 .5]);
colormap(jet(9))
caxis([-0.8 0.8])
aa=colormap;
aa(4:6,:)=1;
colormap(aa)