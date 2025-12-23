clc;clear;

Japanspec = load('./Data/Earthquake_input/Japanvelospectrum.dat');
portland = load('./Data/Earthquake_input/portlandvelospectrum.dat');
seattle = load('./Data/Earthquake_input/seattlevelospectrum.dat');
newport = load('./Data/Earthquake_input/newportvelospectrum.dat');
sPeriod = 0.01:0.01:20;
LW = 1.5;
Font = 12;
figure(1)
loglog(sPeriod,Japanspec,'k-',sPeriod,newport,'k:',sPeriod,portland,'k--',sPeriod,seattle,'k-.','LineWidth',LW)

legend({'MYG013','Newport','Cannon Beach','Seattle'},'Location','southeast','FontName', 'Times New Roman');
legend('boxoff');
% 
ylabel('Velocity Response (cm/s)','FontSize',Font,'FontName', 'Times New Roman')
xlabel('Period (s)','FontSize',Font)
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([0 20]);
%ylim([-25 25]);
box on
grid on
annotation('textbox',[0.0 0.9 0.1 0.1],'String','(a)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
ww=5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,ww/1.3])
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

print('./Figures/figS4a','-depsc','-r600')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = load('./Data/Earthquake_input/CombinedSeismograms_6.dat');

spec = load('./Data/Earthquake_input/CombinedResponseSpectra_6.dat');
spec2 = load('./Data/Earthquake_input/CombinedResponseSpectra_8.dat');
spec3 = load('./Data/Earthquake_input/CombinedResponseSpectra_119.dat');
Japanspec = load('./Data/Earthquake_input/Japanspectrum.dat');
data2 = data(1760001:1760001+20000,:);
dataspec = spec(176089:176089+1999,:);
dataspec2 = spec2(58030:58030+1999,:);
dataspec3 = spec3(44023:44023+1999,:);

LW = 1.5;
Font = 12;
figure(2)
loglog(dataspec(:,1),Japanspec./980,'k-',dataspec(:,1),dataspec(:,2),'k:',dataspec2(:,1),dataspec2(:,2),'k--',dataspec3(:,1),dataspec3(:,2),'k-.','LineWidth',LW)

legend({'MYG013','Newport','Cannon Beach','Seattle'},'Location','southwest','FontName', 'Times New Roman');
legend('boxoff');
% 
ylabel('Acceleration Response (g)','FontSize',Font)
xlabel('Period (s)','FontSize',Font)
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([0 20]);
%ylim([-25 25]);
box on
grid on
annotation('textbox',[0.0 0.9 0.1 0.1],'String','(b)','EdgeColor','none','FontSize',Font,'FontName', 'Times New Roman');
ww=5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,ww/1.3])
set(gca,'FontSize',Font,'FontName', 'Times New Roman');

print('./Figures/figS4b','-depsc','-r600')