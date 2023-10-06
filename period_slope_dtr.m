load('dtr_temporal.mat')
load('tmax_tmin_trend.mat')
load('period_cr.mat', 'cccc')
load('ccc.mat')
for nnn=1:9
    nyear=40+5*(nnn-1);
    ni=1+5*(nnn-1);
    xx=[ones(40,1),[1:40]'];
    for mmm=1:23
    yy=dtrtt(mmm,ni:nyear);
    
    rr=regress(yy',xx);
    bb(mmm,nnn)=rr(2,1);
    end
end

for mmm=1:23
xx=[ones(80,1),[1:80]'];
 yy=dtrtt(mmm,1:80);
 rr=regress(yy',xx);
 bbb(mmm)=rr(2,1);
end


for i=1:14
    ccp=corrcoef(bb(:,i),cccc(:,i),'rows','complete');
    ccp1(i)=ccp(1,2);
   ccd=corrcoef(bb(:,i),cccc1(:,i),'rows','complete');
    ccd1(i)=ccd(1,2);
    ccn=corrcoef(bb(:,i),cccc2(:,i),'rows','complete');
    ccn1(i)=ccn(1,2);
end


for mmm=1:23
xx=[ones(80,1),[1:80]'];
 yy=tmintt(mmm,1:80);
 rr=regress(yy',xx);
 bbb(mmm)=rr(2,1);
end