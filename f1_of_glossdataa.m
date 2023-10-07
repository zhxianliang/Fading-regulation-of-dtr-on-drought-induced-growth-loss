clc
clear
load('cord.mat', 'txt')
load('crn_all.mat')
load('crulatlon.mat')
load('metadata.mat')
load('dtr_gs.mat')
load('pdsi_gs.mat')
load('spe_num.mat')
load('tmax_tmin_gs.mat')
load tem_pre_gs.mat
specc=unique(spec);
sssp=specc(numb>50);

for ss=1:23
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    lllon=llon(m);
    lllat=llat(m);
    nb=numm(:,m+1);
    for jj=1:size(m,1)
%    for jj=1:50  
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
    pdd=pdsi_gs(lonch11,latch11,1:115);
    pddp(:,jj)=reshape(pdd,115,1);
    tmaxx=tmax_gs(lonch11,latch11,1:115);
    tmxx(:,jj)=reshape(tmaxx,115,1);
    tminn=tmin_gs(lonch11,latch11,1:115);
    tmnn(:,jj)=reshape(tminn,115,1);   
    temm=tem_gs(lonch11,latch11,1:115);
    teme(:,jj)=reshape(temm,115,1);
    pree=pre_gs(lonch11,latch11,1:115);
    pren(:,jj)=reshape(pree,115,1);
    end
        %%
      
nyear=80;
ni=1;
nb1=nb(ni:nyear,:);
pdsi1=pddp(ni:nyear,:);
dtr1=dtrp(ni:nyear,:);
tmax1=tmxx(ni:nyear,:);
tmin1=tmnn(ni:nyear,:);
pre1=pren(ni:nyear,:);
tem1=teme(ni:nyear,:);
speciesid=ss*ones(size(nb1));
nb11=nb1;
pdsi11=pdsi1;
nb11(pdsi1>-0.5)=nan;
pdsi11(pdsi1>-0.5)=nan;
nb11(pdsi1<-3)=nan;
nbpd=nb11./pdsi11;
nbpdm=nanmean(nbpd);
nbm=nanmean(nb11);
pdmm=nanmean(pdsi11);
nb12=nb1;
nb12(pdsi1<0.5)=nan;
nb12(pdsi1>2)=nan;
nbmm=nanmean(nb12);
nbr=(nbmm-nbm)./nbmm;
nbrm=nbr./abs(pdmm);

dtr11=dtr1;
%dtr11(pdsi1>0)=nan;
dtrm=nanmean(dtr11);
tmaxm=nanmean(tmax1);
tminm=nanmean(tmin1);
pdsim=nanmean(pdsi1);
temmm=nanmean(tem1);
prem=nanmean(pre1);
specm=nanmean(speciesid);
dtrm(dtrm<4)=nan;
cc1=corrcoef(pdsim,nbr,'rows','complete');
ccc1(ss)=cc1(1,2);
cc2=corrcoef(dtrm,nbrm,'rows','complete');
ccc2(ss)=cc2(1,2);
cc3=corrcoef(dtrm,nbpdm,'rows','complete');
ccc3(ss)=cc3(1,2);
cc4=corrcoef(tmaxm,nbr,'rows','complete');
ccc4(ss)=cc4(1,2);
cc5=corrcoef(tminm,nbr,'rows','complete');
ccc5(ss)=cc5(1,2);
mlat(ss)=mean(lllat);
slat(ss)=std(lllat);

gloss=[nbr;pdsim;dtrm;tmaxm;tminm;temmm;prem;specm];
str={'gloss','pdsi','dtr','tmax','tmin','tem','pre','species'};
clear  pdsi1 pdsid dtr1 dtrd pddp dtrp tmaxm tminm tmax1 tmin1 tmxx tmnn temm prem tem1 pre1 teme pren speciesid specm
xlswrite('E:\DTR\r1_glossdata_sem.xls',str,ss,'A1');
xlswrite('E:\DTR\r1_glossdata_sem.xls',gloss',ss,'A2')

end



