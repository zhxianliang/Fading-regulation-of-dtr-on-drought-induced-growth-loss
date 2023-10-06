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
load spec2.mat
load('tree_age_4516.mat')
%load('tage.mat')
specc=unique(spec);
sssp=specc(numb>50);
for ss=1:23
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec2));
    lllon=llon(m);
    lllat=llat(m);
    nb=numm(:,m+1);
    age=treeage(m);
   for jj=1:size(m,1)
 %    for jj=1:40  
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
    
    end
        %%
nyear=80;
nb1=nb(1:nyear,:);
pdsi1=pddp(1:nyear,:);
dtr1=dtrp(1:nyear,:);
tmax1=tmxx(1:nyear,:);
tmin1=tmnn(1:nyear,:);
agem=repmat(age',[nyear 1]);
nb1(agem<140)=nan;
nb1(agem>1000)=nan;
dtr1(agem<140)=nan;
dtr1(agem>1000)=nan;
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
tmean=nanmean(tmax1+tmin1);
dtrm(dtrm<4)=nan;
for pp=1:1000
    indd=randperm(numel(dtrm),30);
dddtr=dtrm(indd);
nnnbr=nbr(indd);
cc1=corrcoef(dddtr,nnnbr,'rows','complete');
%ccc1(ss)=cc1(1,2);
cccc1(pp)=cc1(1,2);
end
ccc1(ss)=mean(cccc1);
std1(ss)=std(cccc1);
cc2=corrcoef(dtrm,nbrm,'rows','complete');
ccc2(ss)=cc2(1,2);
cc3=corrcoef(dtrm,nbpdm,'rows','complete');
ccc3(ss)=cc3(1,2);
cc4=corrcoef(tmaxm,nbrm,'rows','complete');
ccc4(ss)=cc4(1,2);
cc5=corrcoef(tminm,nbrm,'rows','complete');
ccc5(ss)=cc5(1,2);
cc6=corrcoef(tmean,nbrm,'rows','complete');
ccc6(ss)=cc6(1,2);
mlat(ss)=mean(lllat);
slat(ss)=std(lllat);
clear  pdsi1 pdsid dtr1 dtrd pddp dtrp tmaxm tminm tmax1 tmin1 tmxx tmnn
end
ccc1=ccc1';
ccc2=ccc2';
ccc3=ccc3';
ccc4=ccc4';
ccc5=ccc5';
ccc6=ccc6';
load p50.mat
corrcoef(p50,ccc1,'rows','complete')