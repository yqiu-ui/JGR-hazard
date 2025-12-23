clc;clear
addpath('tools','-end');
data=load('./Data/staout_1_1');
data2=load('./Data/staout_1_2');
data3=load('./Data/staout_7_1');
data4=load('./Data/staout_7_2');
u1_1=data(:,2);
u2_1=data3(:,2);

time=(1:5996)/3600;
LW = 0.8; %Lineweight
Font = 12; %Font size

u1_2=data2(:,2);
u2_2=data4(:,2);

x_wide=5.5;y_wide=6.5;x_num=1;y_num=2;flag_colorbar=0;x_gap=0.5;y_gap=1.2;c_gap=0.1;c_wide=1;
x_border=0.3;y_border=0.3;
[P_subplot,P_fig,P_colorbar,imode_axis] = ...
    subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border);

LW = 0.8; %Lineweight
Font = 12; %Font size



figure(1)
a=[0 0]; aa=[1195/3600 1195/3600];
b=[u1_1(2048) u1_1(2048)]; bb=[2048/3600 2048/3600];
c=[0 0]; cc=[2463/3600 2463/3600];
a2=[0 0]; aa2=[1409/3600 1409/3600];
b2=[u1_2(2084) u1_2(2084)]; bb2=[2084/3600 2084/3600];
c2=[0 0]; cc2=[2467/3600 2467/3600];

subplot('position',P_subplot{1});
plot(time,u1_1,'k-',time,u1_2,'k--',aa,a,'ko',bb,b,'ko',cc,c,'ko',aa2,a2,'ko',bb2,b2,'ko',cc2,c2,'ko','LineWidth',LW);
legend('Case A','Case B');
legend('boxoff');
set(gca,'XTickLabel',[]);
ylabel('$$\eta$$ (m)','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([0 time(end)]);
text(0.23,1,'a_{1}','FontSize',Font,'FontName', 'Times New Roman')
text(0.45,0,'b_{1}','FontSize',Font,'FontName', 'Times New Roman')
text(0.42,8,'a_{2}','FontSize',Font,'FontName', 'Times New Roman')
text(0.63,7,'b_{2}','FontSize',Font,'FontName', 'Times New Roman')
text(0.57,1,'a_{3}','FontSize',Font,'FontName', 'Times New Roman')
text(0.7,1,'b_{3}','FontSize',Font,'FontName', 'Times New Roman')
box on
grid on


subplot('position',P_subplot{2});
plot(time,u2_1,'k-',time,u2_2,'k--',aa,u2_1(aa.*3600),'ko',bb,u2_1(bb.*3600),'ko',cc,u2_1(cc.*3600),'ko',aa2,u2_2(aa2.*3600),'ko',bb2,u2_2(bb2.*3600),'ko',cc2,u2_2(cc2.*3600),'ko','LineWidth',LW);
legend('Case A','Case B');
legend('boxoff');
xlabel('Time (hrs)','Interpreter','latex','FontSize',Font)
ylabel('$$u$$ (m/s)','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([0 time(end)]);
box on
grid on

text(0.23,1,'a_{1}','FontSize',Font,'FontName', 'Times New Roman')
text(0.4,0,'b_{1}','FontSize',Font,'FontName', 'Times New Roman')
text(0.48,0,'a_{2}','FontSize',Font,'FontName', 'Times New Roman')
text(0.62,0,'b_{2}','FontSize',Font,'FontName', 'Times New Roman')
text(0.57,-1.7,'a_{3}','FontSize',Font,'FontName', 'Times New Roman')
text(0.75,-1.7,'b_{3}','FontSize',Font,'FontName', 'Times New Roman')

ww=5.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,ww])
print('./Figures/fig3','-depsc','-r600')

%dlmwrite('./Data/schismwaveshape1.txt',u1_1(1195:end));
%dlmwrite('./Data/schismwaveshape2.txt',u1_2(1409:end));

