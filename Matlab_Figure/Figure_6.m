
clc;clear; 
addpath('tools','-end');
 pm10=load('./Data/Earthquake_results/gradient_1.txt');
 pm20=load('./Data/Earthquake_results/gradient_4.txt');
 pm30=load('./Data/Earthquake_results/gradient_7.txt');
 pl10=load('./Data/Earthquake_results/gradient_2.txt');
 pl20=load('./Data/Earthquake_results/gradient_5.txt');
 pl30=load('./Data/Earthquake_results/gradient_8.txt');
 ph10=load('./Data/Earthquake_results/gradient_0.txt');
 ph20=load('./Data/Earthquake_results/gradient_3.txt');
 ph30=load('./Data/Earthquake_results/gradient_6.txt');
% 
 time=load('./Data/Earthquake_results/time1.txt');
 depth10=load('./Data/Earthquake_results/depth1.txt');
 depth20=load('./Data/Earthquake_results/depth4.txt');
 depth30=load('./Data/Earthquake_results/depth7.txt');
% %
 l2=[-50 50];
 t=[175 175];
 tt=[36 36];


 x_wide=1.5;y_wide=3.5;x_num=1;y_num=1;flag_colorbar=0;x_gap=0.3;y_gap=0.5;c_gap=0.1;c_wide=3;
  x_border=0.1;y_border=0.5;
 [P_subplot,P_fig,P_colorbar,imode_axis] = ...
      subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border);

LW = 0.8; %Lineweight
Font = 10; %Font size

aa = -0.1;
bb = 1.16;
ww=3.5;
yy=2;

% Define the number of color levels (e.g., 256)
N = 256; 

% Create a custom blue-white-red colormap
% The matrix dimensions must be N-by-3
% Blue at low values, white in the center, red at high values
custom_map = [linspace(0, 1, N/2), linspace(1, 0, N/2)]'; % Red channel (example approach)
% ... (define Green and Blue channels similarly for smooth transition)

% More robust custom creation example:
% Create an RGB matrix for a blue-white-red map
R = [linspace(0, 1, 86.2), linspace(1, 1, 1000)]';
G = [linspace(0, 1, 86.2), linspace(1, 0, 1000)]';
B = [linspace(1, 1, 86.2), linspace(1, 0, 1000)]';
custom_map = [R, G, B];
custom_map(custom_map > 1) = 1; % Clamp values to [0, 1]
custom_map(custom_map < 0) = 0;


%%%%%%%%%%%%%%%%%%%%%%%

figure(1)
% subplot('position',P_subplot{1});
contourf(time,depth10',ph10',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(a)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 10 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6a','-depsc','-r600')
%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
% subplot('position',P_subplot{1});
contourf(time,depth20',ph20',100,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(b)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 20 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6b','-depsc','-r600')
% % %%%%%%%%%%%%%%%%%%%%%%%%
% % 
figure(3)
% subplot('position',P_subplot{1});
contourf(time,depth30',ph30',100,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(c)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 30 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6c','-depsc','-r600')
% %%%%%%%%%%%%%%%%%%%%%%%%
% % 
figure(4)
% subplot('position',P_subplot{1});
contourf(time,depth10',pm10',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(d)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 20 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6d','-depsc','-r600')
% %%%%%%%%%%%%%%%%%%%%%%%%
% % 
figure(5)
% subplot('position',P_subplot{1});
contourf(time,depth20',pm20',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(e)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 20 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-5} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6e','-depsc','-r600')
% %%%%%%%%%%%%%%%%%%%%%%%%
% % 
figure(6)
% subplot('position',P_subplot{1});
contourf(time,depth30',pm30',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(f)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 30 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-5} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6f','-depsc','-r600')
% % %%%%%%%%%%%%%%%%%%%%%%%%
% % 
figure(7)
% subplot('position',P_subplot{1});
contourf(time,depth10',pl10',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(g)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 10 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6g','-depsc','-r600')
% %%%%%%%%%%%%%%%%%%%%%%%%
% % % 
figure(8)
% subplot('position',P_subplot{1});
contourf(time,depth20',pl20',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(h)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 20 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6h','-depsc','-r600')
% % %%%%%%%%%%%%%%%%%%%%%%%%
% % % % 
figure(9)
% subplot('position',P_subplot{1});
contourf(time,depth30',pl30',1000,'edgecolor','none');
xlim([0 300]);
colormap(custom_map);
shading flat
caxis([aa bb]);
ylabel('Z','Interpreter','latex','FontSize',Font)
set(get(gca,'ylabel'),'rotation',0);
xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman')
box on
ylim([-1 0]);
yticks([-1 -0.5 0]);
annotation('textbox',[0.0,0.92,0.1,0.1],'String','(i)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')

%c=contourcbar('Position',[0.8 0.28 0.05 0.5]);
c=colorbar;
c.Ticks = [-0.1 0 0.5 1.0 1.16];
c.Label.Interpreter = 'latex';
 c.Label.String = '$$\delta h_{e}/\delta z$$';

 c.Label.FontSize = Font;
set(gcf, 'Units','Inches', 'Position', [1,1, ww,yy]);

text(195,-0.8,'$$h = 30 m$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
text(195,-0.9,'$$k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
print('./Figures/fig6i','-depsc','-r600')
% % 
