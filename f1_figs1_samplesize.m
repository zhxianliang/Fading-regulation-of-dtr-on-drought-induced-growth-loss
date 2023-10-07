%% sample depth of different tree species
userpath('E:\DTR\')
clc
clear
load('cord.mat', 'txt')
load('crn_all.mat')
load('crulatlon.mat')
load('metadata.mat')
load('spe_num.mat')

specc=unique(spec);
sssp=specc(numb>50);
ss=1;
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    nb=numm(:,m+1);
    nbbb=nanmean(nb(1:110,:));
    num=find(~isnan(nbbb));
    nbb1=nb(:,num); 
    nnm=num';
    ts=ones(size(nnm));
    spec_num(ss)=size(ts,1);


for ss=2:23
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    nb=numm(:,m+1);
    nbbb=nanmean(nb(1:110,:));
    num=find(~isnan(nbbb));
    nbba=nb(:,num);
    nbb1=[nbb1,nbba];
    nnm=num';
    ts1=ss*ones(size(nnm));
    ts=[ts;ts1];
    
    clear nbba nb nbbb num
    spec_num(ss)=size(ts1,1);
end
   tss=ts';
   
for ii=1:120
    tt1=nbb1(ii,:);
    for jj=[1,2,17,3,4,5,18,6:14,19:23,15,16]
        tt2=tt1(tss==jj);
        [m1,n1]=find(~isnan(tt2));
        ssize(ii,jj)=length(n1);
    end
end
    bar(ssize,'stacked')
    load ccmap.mat
    colormap(cmap)
    