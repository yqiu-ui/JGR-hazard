clc;clear

data=load('./Data/Six_hour_wave/staout_1_1');
data2=load('./Data/Six_hour_wave/staout_1_2');

u1_1=data(:,2);

time=(1:21600)/3600;
LW = 0.8; %Lineweight
Font = 12; %Font size

u1_2=data2(:,2);


LW = 1.3; %Lineweight
Font = 12; %Font size



figure(1)

plot(time,u1_1,'k-',time,u1_2,'k-.','LineWidth',LW);
legend('Case A','Case B','Location','northwest','FontName', 'Times New Roman');
legend('boxoff');

ylabel('$$\eta$$ (m)','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman')
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([0 time(end)]);
ylim([-25 25]);
box on
grid on

ww=6.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,ww/3])
print('./Figures/figS3','-depsc','-r600')
