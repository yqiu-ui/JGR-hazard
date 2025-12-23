close all
clear all
clc
data2=load('./Data/VeloJapan311.txt');
%% method for peer data
LW = 0.8; %Lineweight
Font = 12; %Font size
%% method for K-NET data
[a,b]=size(data2);
time=0:0.01:0.01*(a-1);
time2=0:0.01:0.01*(a-2);
% acce=data(:,2);
velo=data2(:,2);
% disp=data3(:,2);

% maxacce=round(max(abs(acce)),1);
maxvelo=round(max(abs(velo)),1);
% maxdisp=round(max(abs(disp)),1);
% fileID = fopen('earthquakevelo.txt','w');
%  fprintf(fileID, '%f ', velo/100);
 
l1=[-1 1];
l2=[-50 50];
l3=[-20 20];
t=[175 175];
tt=[36 36];

figure(1)

plot(time,velo,'k',t,l2,'k',tt,l2,'k','LineWidth',LW);

yticks([-50 -25 0 25 50])

ylabel('Velocity (cm/s)','FontSize',Font,'FontName', 'Times New Roman');
BB=sprintf('Peak velocity= %.1f (cm/s)', maxvelo);
text(178,25,BB,'FontSize',Font,'FontName', 'Times New Roman')
ax = gca;
ax.FontSize = Font; 

grid on

hold on
plot(t,l3,'k',tt,l3,'k','LineWidth',LW);
 xlabel('Time (s)','FontSize',Font,'FontName', 'Times New Roman');

 text(175,-40,'\leftarrow Bound b','FontSize',Font,'FontName', 'Times New Roman')
 text(36,-40,'\leftarrow Bound a','FontSize',Font,'FontName', 'Times New Roman')

ww=7.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,ww/3.5])
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

print('./Figures/fig5','-depsc','-r600')