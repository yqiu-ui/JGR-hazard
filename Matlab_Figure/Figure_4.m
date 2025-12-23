
% clc;clear;
% currentpath = pwd;
% 
% addpath('tools','-end');
%  eta=ncread('./Data/3_elev_1.nc','elev');
%  eta2=ncread('./Data/5_elev_1.nc','elev');
%  eta3=ncread('./Data/3_elev_2.nc','elev');
%  eta4=ncread('./Data/5_elev_2.nc','elev');

x_wide=2;y_wide=3.5;x_num=4;y_num=1;flag_colorbar=0;x_gap=0;y_gap=1.2;c_gap=0.0;c_wide=0;
x_border=0.0;y_border=1.5;
[P_subplot,P_fig,P_colorbar,imode_axis] = ...
    subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border);

figure(1)
LW = 0.8; %Lineweight
Font = 16; %Font size
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ulimit = max([max(eta(:,195)),max(eta2(:,48)),max(eta3(:,409)),max(eta4(:,84))]);
llimit = min([min(eta(:,195)),min(eta2(:,48)),min(eta3(:,409)),min(eta4(:,84))]);

  mesh=readGR3('./Data/hgrid.gr3');  % read the model grid and bed elevation info
  tri=[mesh.elems.node1 mesh.elems.node2 mesh.elems.node3];

  xx=load('./Data/lon.txt');
  yy=load('./Data/lat.txt');
subplot('position',P_subplot{1});
  trisurf(tri,xx,yy,eta(:,195))  % this plots output time step 30
 
%   xlim([min(xx) -120])
%   ylim([min(yy) 45])
xlabel('Longitude (\circ W)','FontSize',Font,'FontName', 'Times New Roman')
ylabel('Latitude (\circ N)','FontSize',Font,'FontName', 'Times New Roman')

 cMap = turbo;
 dataMax = max(eta(:,195));
 dataMin = min(eta(:,195));
 centerPoint = -4;
 scalingIntensity = 4.5;
 x = 1:length(cMap); 
  x = x - (centerPoint-dataMin)*length(x)/(dataMax-dataMin);
  x = scalingIntensity * x/max(abs(x));
  x = sign(x).* exp(abs(x));
  x = x - min(x); x = x*90/max(x)+1; 
  newMap = interp1(x, cMap, 1:91);

  colormap(newMap)
  grid off
  box on
  annotation('textbox',[0.02 0.64 0.1 0.1],'String','(a)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  
  clim([llimit ulimit])
  view(2)
  shading flat
  axis equal tight
    hold on
   
  scatter3(-124.065912,44.602396,180,100,'k','filled','p');
  
   ylim([min(yy) 45.9])
  %set(gcf, 'Units','Inches', 'Position', [1, 1,2, 4.5])
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
subplot('position',P_subplot{2});
  trisurf(tri,xx,yy,eta2(:,48))  % this plots output time step 30
  xlim([min(xx) -120])
xlabel('Longitude (\circ W)','FontSize',Font,'FontName', 'Times New Roman')

  colormap(newMap)
  grid off
  box on
  annotation('textbox',[0.27 0.64 0.1 0.1],'String','(b)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'YTickLabel',[]);
  clim([llimit ulimit])
  view(2)
  shading flat
  axis equal tight
   hold on
  scatter3(-124.065912,44.602396,180,100,'k','filled','p');
ylim([min(yy) 45.9])
  %set(gcf, 'Units','Inches', 'Position', [1, 1,2, 4.5])
  set(gca,'FontSize',Font,'FontName', 'Times New Roman')
subplot('position',P_subplot{3});
  trisurf(tri,xx,yy,eta3(:,409))  % this plots output time step 30
  xlim([min(xx) -120])
xlabel('Longitude (\circ W)','FontSize',Font,'FontName', 'Times New Roman')


  colormap(newMap)
  grid off
  box on
  annotation('textbox',[0.52 0.64 0.1 0.1],'String','(c)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
 set(gca,'YTickLabel',[]);
  clim([llimit ulimit])
  view(2)
  shading flat
  axis equal tight
   hold on
  scatter3(-124.065912,44.602396,180,100,'k','filled','p');
ylim([min(yy) 45.9])
  %set(gcf, 'Units','Inches', 'Position', [1, 1,2, 4.5])
  set(gca,'FontSize',Font,'FontName', 'Times New Roman')
subplot('position',P_subplot{4});
  trisurf(tri,xx,yy,eta4(:,84))  % this plots output time step 30
  xlim([min(xx) -120])
xlabel('Longitude (\circ W)','FontSize',Font,'FontName', 'Times New Roman')
%ylabel('Latitude (\circ N)','FontSize',Font)
  cb1 = colorbar('north');
  set(cb1,'position',[0.38 0.15 0.3 0.02])
%cb1.Ticks = linspace(llimit, ulimit, 3) ; %Create 8 ticks from zero to 1
cb1.Ticks = [-25,-20,-15,-10,-5,0,5,10,15,20];

  ylabel(cb1,'Elevation (m)','FontSize',Font,'FontName', 'Times New Roman');
%   
  colormap(newMap)
  grid off
  box on
  annotation('textbox',[0.76 0.64 0.1 0.1],'String','(d)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  set(gca,'YTickLabel',[]);
  clim([llimit ulimit])
  view(2)
  shading flat
  axis equal tight
  hold on
  scatter3(-124.065912,44.602396,180,100,'k','filled','p');
ylim([min(yy) 45.9])
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
  %set(gcf, 'Units','Inches', 'Position', [1, 1,2, 4.5])
print('./Figures/fig4','-depsc','-r600')
% 
