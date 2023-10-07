%% distribution of used sample sites
userpath('E:\DTR\')
clc
clear
load('cord.mat', 'txt')
load('crn_all.mat')
load('crulatlon.mat')
load('metadata.mat')
load('dtr_gs.mat')
load('pdsi_gs.mat')
load('spe_num.mat')
load('tc8.mat')
tc8(tc8<20)=nan;
tc8(tc8>20)=1;

specc=unique(spec);
sssp=specc(numb>50);
nnn=numb(numb>50);

h1=axesm('MapProjection','miller','Grid','on','MapLatLimit',[-80,80],'MapLonLimit',[-180 180]);
framem('on'); gridm('on'); mlabel('south'); plabel('west');
setm(gca,'MLineLocation',30)%设置经度间隔为5
setm(gca,'PLineLocation',10)%设置经度间隔为10
setm(gca,'MLabelLocation',30)%设置经度标签为每隔5度
setm(gca,'PLabelLocation',10)%设置纬度标签为每隔10度
load coast
load ccmap.mat
[lati longi] = meshgrid(-89.89:0.0833:90,-179.79:0.0833:180);
%pcolorm(lati,longi,tc8);

plotm(lat,long,'black')
%colormap([0.5 0.5 0.5])
hold on
%cmap=colormap(jet(23));

for ss=[1,2,17,3,4,5,18,6:14,19:23,15,16]
    ll=sssp(ss);
    [m,n]= find(strcmp(ll,spec));
    lllon=llon(m);
    lllat=llat(m);

   s1= scatterm(lllat,lllon,10,cmap(ss,:),'filled');
%   distfromzero = sqrt(lllat.^2 + lllon.^2);
%   s1.AlphaData = distfromzero;
%   s1.MarkerFaceAlpha = 0.1;
    
end
colormap(cmap)
colorbar('YTickLabel',{'ABAL','ABLA','LADE','LAGM','LASI','PCAB','PCEN','PCGL','PCMA','PIED','PINI','PIPO','PISY','PSME','TSCA','TSME','FASY','NOPU','QUAL','QUMA','QURO','QUSP','QUST' });
cb = colorbar;
yticks = get(cb,'YTick');
ytickss=[0.02:1/23:1];
set(cb,'YTick',ytickss,'YTickLabel',{'ABAL','ABLA','LADE','LAGM','LASI','PCAB','PCEN','PCGL','PCMA','PIED','PINI','PIPO','PISY','PSME','TSCA','TSME','FASY','NOPU','QUAL','QUMA','QURO','QUSP','QUST'})
%set(cb,'YTick',ytickss,'YTickLabel',{'ABAL','ABLA','FASY','LADE','LAGM','LASI','NOPU','PCAB','PCEN','PCGL','PCMA','PIED','PINI','PIPO','PISY','PSME','QUAL','QUMA','QURO','QUSP','QUST','TSCA','TSME' })
