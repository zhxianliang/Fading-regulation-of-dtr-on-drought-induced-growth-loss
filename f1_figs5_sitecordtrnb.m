%% tree growth comparison for large DTR sites and small DTR sites during dry years and wet years
clc
clear
load('cord.mat', 'txt')
load('crn_all.mat')
load('crulatlon.mat')
load('metadata.mat')
load('dtr_gs.mat')
load('spei_gs.mat')
load('spe_num.mat')
load('E:\DTR\tmax_tmin_gs.mat')
specc=unique(spec);
sssp=specc(numb>50);
ss=1;
ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    lllon=llon(m);
    lllat=llat(m);
    nbt=numm(:,m+1);
    num=find(~isnan(nanmean(nbt)));
    mm=m(num);
    nb=numm(:,mm+1);
    for jj=1:size(mm,1)
    ll1=lllon(jj);
    ll2=lllat(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);
    pp=dtr_gs(lonch11,latch11,1:115);
    dtrp(:,jj)=reshape(pp,115,1);
    pdd=spei_gs(lonch11,latch11,1:115);
    pddp(:,jj)=reshape(pdd,115,1);
    tmaxx=tmax_gs(lonch11,latch11,1:115);
    tmxx(:,jj)=reshape(tmaxx,115,1);
    tminn=tmin_gs(lonch11,latch11,1:115);
    tmnn(:,jj)=reshape(tminn,115,1); 
    end
        %%
nyear=80;
nb1=nb(1:nyear,:);
pdsi1=pddp(1:nyear,:);
dtr1=dtrp(1:nyear,:);
tmax1=tmxx(1:nyear,:);
dtr11=dtr1;
dtr21=dtr1;
dtr22=dtr1;
nb11=nb1;
nb12=nb1;
nb21=nb1;
nb22=nb1;
tmax11=tmax1;
tmax12=tmax1;
dtrm=nanmean(dtr1);
dtrmm=repmat(dtrm,[80,1]);

nb11(dtr1>dtrmm)=nan; % small dtr
nb12(dtr1<dtrmm)=nan; % large dtr


nbb1=nanmean(nb11);
nbb2=nanmean(nb12);

nb21(pdsi1>0.5)=nan; % dry years
nb22(pdsi1<-0.5)=nan; % wet years


nbb3=nanmean(nb21);
nbb4=nanmean(nb22);

for i=1:size(nb1,2)
  nb33=nb21(:,i);
  pd3=dtr21(:,i);
  nb44=nb22(:,i);
  pd4=dtr22(:,i);
  tmaxx1=tmax11(:,i);
  tmaxx2=tmax12(:,i);
  if sum(pd3)==0
      ccc11(i,1)=nan;
  else
  ccc11(i,1)=partialcorr(nb33,pd3,tmaxx1,'rows','complete');
  end
  if sum(pd4)==0
      ccc21(i,1)=nan;
  else
  ccc21(i,1)=partialcorr(nb33,pd4,tmaxx1,'rows','complete');
  end
end

clear  pdsi1 pdsid dtr1 dtrd pddp dtrp dtr11 dtrmm ind* b
cccc1=ccc11;
cccc2=ccc21;
ssss=ones(size(ccc11));
%% 2£º23
for ss=2:23;
ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    lllon=llon(m);
    lllat=llat(m);
    nbt=numm(:,m+1);
    num=find(~isnan(nanmean(nbt)));
    mm=m(num);
    nb=numm(:,mm+1);
    for jj=1:size(mm,1)
    ll1=lllon(jj);
    ll2=lllat(jj);
    latcha=latt-ll2;
    loncha=lonn-ll1;
    latch1=find(abs(latcha)==min(abs(latcha)));
    lonch1=find(abs(loncha)==min(abs(loncha)));
    latch11=latch1(1,1);
    lonch11=lonch1(1,1);
    pp=dtr_gs(lonch11,latch11,1:115);
    dtrp(:,jj)=reshape(pp,115,1);
    pdd=spei_gs(lonch11,latch11,1:115);
    pddp(:,jj)=reshape(pdd,115,1);
    tmaxx=tmax_gs(lonch11,latch11,1:115);
    tmxx(:,jj)=reshape(tmaxx,115,1);
    tminn=tmin_gs(lonch11,latch11,1:115);
    tmnn(:,jj)=reshape(tminn,115,1); 
    end
    
        %%
nyear=80;
nb1=nb(1:nyear,:);
pdsi1=pddp(1:nyear,:);
dtr1=dtrp(1:nyear,:);
tmax1=tmxx(1:nyear,:);
dtr11=dtr1;
dtr21=dtr1;
dtr22=dtr1;
nb11=nb1;
nb12=nb1;
nb21=nb1;
nb22=nb1;
tmax11=tmax1;
tmax12=tmax1;
dtrm=nanmean(dtr1);
dtrmm=repmat(dtrm,[80,1]);
%nb11((pdsi1<1)&(dtr1>dtrmm))=nan;
%nb12((pdsi1<1)&(dtr1<dtrmm))=nan;
nb11(dtr1>dtrmm)=nan; % dtrs small DTR
nb12(dtr1<dtrmm)=nan; %dtrl  large DTR
nbb1=nanmean(nb11);
nbb2=nanmean(nb12);

%nb21((pdsi1>-1)&(dtr1>dtrmm))=nan;
%nb22((pdsi1>-1)&(dtr1<dtrmm))=nan;
nb21(pdsi1>0.5)=nan; %pdsi xiao
nb22(pdsi1<-0.5)=nan; %pdsi large


nbb3=nanmean(nb21);
nbb4=nanmean(nb22);
%boxplot([nbb1;nbb2;nbb3;nbb4]')
for i=1:size(nb1,2)
  nb33=nb21(:,i);
  pd3=dtr21(:,i);
  nb44=nb22(:,i);
  pd4=dtr22(:,i);
  tmaxx1=tmax11(:,i);
  tmaxx2=tmax12(:,i);

  if sum(pd3)==0||sum(isnan(nb33))==size(nb33,1)
      ccc31(i,1)=nan;
  else
  ccc31(i,1)=partialcorr(nb33,pd3,tmaxx1,'rows','complete');
  end
  if sum(pd4)==0||sum(isnan(nb44))==size(nb44,1)
      ccc32(i,1)=nan;
  else
  ccc32(i,1)=partialcorr(nb33,pd4,tmaxx1,'rows','complete');
  end
  

end



clear  pdsi1 pdsid dtr1 dtrd pddp dtrp dtr11 dtrmm ind* b ccc5 ccc6
sss2=ss*ones(size(ccc31));
dtrs_cr=[cccc1;ccc31]; % small DTR sites
dtrl_cr=[cccc2;ccc32]; % large DTR sites

end
