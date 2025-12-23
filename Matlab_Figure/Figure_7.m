
clc;clear;
%% Load all the data
depth10=load('./Data/Multihazard_results/depth1.txt');
depth20=load('./Data/Multihazard_results/depth4.txt');
depth30=load('./Data/Multihazard_results/depth7.txt');


gradient1_h_10=load('./Data/Multihazard_results/gradient1_0.txt');
gradient1_h_20=load('./Data/Multihazard_results/gradient1_3.txt');
gradient1_h_30=load('./Data/Multihazard_results/gradient1_6.txt');
gradient1_l_10=load('./Data/Multihazard_results/gradient1_2.txt');
gradient1_l_20=load('./Data/Multihazard_results/gradient1_5.txt');
gradient1_l_30=load('./Data/Multihazard_results/gradient1_8.txt');
gradient1_m_10=load('./Data/Multihazard_results/gradient1_1.txt');
gradient1_m_20=load('./Data/Multihazard_results/gradient1_4.txt');
gradient1_m_30=load('./Data/Multihazard_results/gradient1_7.txt');
start = 1370;
time1=(load('./Data/Multihazard_results/time1.txt')+start)/3600;

LW = 0.8; %Lineweight
Font = 11; %Font size
aa = -0.1;
bb = 1.16;

% Define the number of color levels (e.g., 256)
N = 256; 

% Create a custom blue-white-red colormap
% The matrix dimensions must be N-by-3
% Blue at low values, white in the center, red at high values
custom_map = [linspace(0, 1, N/5), linspace(1, 0, N/5)]'; % Red channel (example approach)
% ... (define Green and Blue channels similarly for smooth transition)

% More robust custom creation example:
% Create an RGB matrix for a blue-white-red map
R = [linspace(0, 1, 86.2), linspace(1, 1, 1000)]';
G = [linspace(0, 1, 86.2), linspace(1, 0, 1000)]';
B = [linspace(1, 1, 86.2), linspace(1, 0, 1000)]';
custom_map = [R, G, B];
custom_map(custom_map > 1) = 1; % Clamp values to [0, 1]
custom_map(custom_map < 0) = 0;




%% Plot 
w =6.5;
y = 4.5;
pos1 = [0.1 0.7 0.25 0.25];
pos2 = [0.37 0.7 0.25 0.25];
pos3 = [0.64 0.7 0.25 0.25];
pos4 = [0.1 0.4 0.25 0.25];
pos5 = [0.37 0.4 0.25 0.25];
pos6 = [0.64 0.4 0.25 0.25];
pos7 = [0.1 0.1 0.25 0.25];
pos8 = [0.37 0.1 0.25 0.25];
pos9 = [0.64 0.1 0.25 0.25];
figure(1)

%subplot(3,3,1)
subplot('position',pos1);
contourf(time1,depth10',gradient1_h_10',100,'edgecolor','none');
hold on
contourf(time1,depth10',gradient1_h_10',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
ylabel('Z','FontSize',Font,'FontName', 'Times New Roman')
set(get(gca,'ylabel'),'rotation',0);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

% subplot(3,3,2)
subplot('position',pos2);
contourf(time1,depth20',gradient1_h_20',100,'edgecolor','none');
hold on
contourf(time1,depth20',gradient1_h_20',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,3)
subplot('position',pos3);
contourf(time1,depth30',gradient1_h_30',100,'edgecolor','none');
hold on
contourf(time1,depth30',gradient1_h_30',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,4)
subplot('position',pos4);
contourf(time1,depth10',gradient1_m_10',100,'edgecolor','none');
hold on
contourf(time1,depth10',gradient1_m_10',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
ylabel('Z','FontSize',Font,'FontName', 'Times New Roman')
set(get(gca,'ylabel'),'rotation',0);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,5)
subplot('position',pos5);
contourf(time1,depth20',gradient1_m_20',100,'edgecolor','none');
hold on
contourf(time1,depth20',gradient1_m_20',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,6)
subplot('position',pos6);
contourf(time1,depth30',gradient1_m_30',100,'edgecolor','none');
hold on
contourf(time1,depth30',gradient1_m_30',[1.15 1.15],'LineColor','w')
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
set(gca,'FontSize',Font,'FontName', 'Times New Roman');


%subplot(3,3,7)
subplot('position',pos7);
contourf(time1,depth10',gradient1_l_10',100,'edgecolor','none');
hold on
contourf(time1,depth10',gradient1_l_10',[1.15 1.15],'LineColor','w')
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
 xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman')
 ylabel('Z','FontSize',Font,'FontName', 'Times New Roman')
 set(get(gca,'ylabel'),'rotation',0);
 set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,8)
subplot('position',pos8);
contourf(time1,depth20',gradient1_l_20',100,'edgecolor','none');
hold on
contourf(time1,depth20',gradient1_l_20',[1.15 1.15],'LineColor','w')
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
clim([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
 xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman')
 set(gca,'FontSize',Font,'FontName', 'Times New Roman');

%subplot(3,3,9)
subplot('position',pos9);
contourf(time1,depth30',gradient1_l_30',100,'edgecolor','none');
hold on
contourf(time1,depth30',gradient1_l_30',[1.15 1.15],'LineColor','w')
set(gca,'YTickLabel',[]);
ylim([-1 0]);
yticks([-1 -0.5 0]);
colormap(custom_map)
shading flat
caxis([aa bb]);
xlim([start/3600 time1(end)]);
%xticks([0.42 0.81 1.21 1.61]);
 xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman')

annotation('textbox',[0.3,0.77,0,0],'string','(a)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.57,0.77,0,0],'string','(b)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.84,0.77,0,0],'string','(c)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.3,0.47,0,0],'string','(d)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.57,0.47,0,0],'string','(e)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.84,0.47,0,0],'string','(f)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.3,0.17,0,0],'string','(g)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.57,0.17,0,0],'string','(h)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.84,0.17,0,0],'string','(i)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');

annotation('textbox',[0.1,1.00,0,0],'string','$$h = 10 m; k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.38,1.00,0,0],'string','$$h = 20 m; k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.65,1.00,0,0],'string','$$h = 30 m; k = 10^{-4} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.1,0.7,0,0],'string','$$h = 10 m; k = 10^{-5} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.38,0.7,0,0],'string','$$h = 20 m; k = 10^{-5} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.65,0.7,0,0],'string','$$h = 30 m; k = 10^{-5} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.1,0.4,0,0],'string','$$h = 10 m; k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.38,0.4,0,0],'string','$$h = 20 m; k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.65,0.4,0,0],'string','$$h = 30 m; k = 10^{-6} m/s$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');

%annotation('textbox',[0.68,0.3,0,0],'\leftarrow 99% Liquefaction','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
text(0.48,-0.4,'\leftarrow 99%\newline Liquefaction','FontSize',10,'FontName', 'Times New Roman')

set(gcf, 'Units','Inches', 'Position', [1, 1, w, y]);

c=contourcbar('Position',[0.90 0.28 0.01 0.5]);
c.Ticks = [-0.1 0 0.2 0.4 0.6 0.8 1.0 1.16];
%c.AxisLocation = 'in'
c.Label.Interpreter = 'latex';
c.Label.String = '$$\delta h_{e}/\delta z$$';
c.Label.FontSize = 11;
set(gca,'FontSize',Font,'FontName', 'Times New Roman');
set(gcf,'Renderer','painters');
print('./Figures/fig7','-depsc','-r600')




