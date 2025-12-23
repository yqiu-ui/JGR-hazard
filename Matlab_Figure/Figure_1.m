clc;clear;
currentpath = pwd;

addpath('tools','-end');
  LW = 0.8; %Lineweight
  Font = 11; %Font size
  mesh=readGR3('./Data/hgridlarge.gr3');  % read the model grid and bed elevation info
  %tri=[mesh.elems.node1-1 mesh.elems.node2-1 mesh.elems.node3-1];
  tri=[mesh.elems.node1 mesh.elems.node2 mesh.elems.node3];
  bed1=readGR3('./Data/bdefsin.gr3');
  bed2=readGR3('./Data/bdefs.gr3');
  xx=load('./Data/lonl.txt');
  yy=load('./Data/latl.txt'); 
%   
% 
figure(1)
  trisurf(tri,xx,yy,-mesh.nodes.data)  % this plots output time step 30
xlabel('Longitude (\circ W)','FontSize',Font,'FontName', 'Times New Roman')
ylabel('Latitude (\circ N)','FontSize',Font,'FontName', 'Times New Roman')
  cb1 = colorbar('north');
  set(cb1,'position',[0.38 0.08 0.3 0.01])
  ylabel(cb1,'Elevation (m)','FontSize',Font,'FontName', 'Times New Roman');
% %   xlabel(h,'Water elevation (m)','FontSize',Font);
  colormap parula
  grid off
  box on
  annotation('textbox',[0.01 0.78 0.1 0.1],'String','(a)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  hold on
  scatter(-124.065912,44.602396,180,'filled','p','MarkerFaceColor','k');
  caxis([min(-mesh.nodes.data) max(-mesh.nodes.data)])
  view(2)
  shading flat
  axis equal tight
  set(gca,'FontSize',Font);
  set(gcf, 'Units','Inches', 'Position', [1, 1,2, 6.5])
  set(gca, 'FontName', 'Times New Roman')

print('./Figures/fig1a','-depsc','-r600')

figure(2)
  trisurf(tri,xx,yy,bed1.nodes.data)  % this plots output time step 30
xlabel('Longitude (\circ W)','FontSize',Font)
ylabel('Latitude (\circ N)','FontSize',Font)
  cb1 = colorbar('north');
  set(cb1,'position',[0.38 0.08 0.3 0.01])
  ylabel(cb1,'Deformation (m)','FontSize',Font,'FontName', 'Times New Roman');
% %   xlabel(h,'Water elevation (m)','FontSize',Font);
  colormap jet
  grid off
  box on
  annotation('textbox',[0.01 0.78 0.1 0.1],'String','(b)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.25 0.5 0.2 0.2],'String','A','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.35 0.2 0.2 0.2],'String','B','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  hold on
  scatter(-124.065912,44.602396,180,'filled','p','MarkerFaceColor','k');
  caxis([min(bed2.nodes.data) max(bed2.nodes.data)])
  view(2)
  shading flat
  axis equal tight
  set(gca,'FontSize',Font);
  set(gcf, 'Units','Inches', 'Position', [1, 1,2, 6.5])
set(gca, 'FontName', 'Times New Roman')
print('./Figures/fig1b','-depsc','-r600')

figure(3)
  trisurf(tri,xx,yy,bed2.nodes.data)  % this plots output time step 30
xlabel('Longitude (\circ W)','FontSize',Font)
ylabel('Latitude (\circ N)','FontSize',Font)
  cb1 = colorbar('north');
  set(cb1,'position',[0.38 0.08 0.3 0.01])
  ylabel(cb1,'Deformation (m)','FontSize',Font,'FontName', 'Times New Roman');
% %   xlabel(h,'Water elevation (m)','FontSize',Font);
  colormap jet
  grid off
  box on
  annotation('textbox',[0.01 0.78 0.1 0.1],'String','(c)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.25 0.5 0.2 0.2],'String','A','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.3 0.32 0.2 0.2],'String','B','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.3 0.15 0.2 0.2],'String','C','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  annotation('textbox',[0.34 0.05 0.2 0.2],'String','D','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
  hold on
  scatter(-124.065912,44.602396,180,'filled','p','MarkerFaceColor','k');
  caxis([min(bed2.nodes.data) max(bed2.nodes.data)])
  view(2)
  shading flat
  axis equal tight
  set(gca,'FontSize',Font);
  set(gcf, 'Units','Inches', 'Position', [1, 1,2, 6.5])
set(gca, 'FontName', 'Times New Roman')
print('./Figures/fig1c','-depsc','-r600')

