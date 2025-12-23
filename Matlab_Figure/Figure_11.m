clc;clear
currentpath = pwd;

addpath('tools','-end');
%addpath('tools/kakearney-legendflex-pkg-f29cb4e','-end')
data=load('./Data/Sediments_transport/staout_1');
data2=load('./Data/Sediments_transport/staout_7');
gradh10 = load('./Data/Sediments_transport/gradient1_0.txt');
gradh20 = load('./Data/Sediments_transport/gradient1_3.txt');
gradh30 = load('./Data/Sediments_transport/gradient1_6.txt');
gradm10 = load('./Data/Sediments_transport/gradient1_1.txt');
gradm20 = load('./Data/Sediments_transport/gradient1_4.txt');
gradm30 = load('./Data/Sediments_transport/gradient1_7.txt');
gradl10 = load('./Data/Sediments_transport/gradient1_2.txt');
gradl20 = load('./Data/Sediments_transport/gradient1_5.txt');
gradl30 = load('./Data/Sediments_transport/gradient1_8.txt');
span = 1195:2463;
span2 = span-1194;
u=data2(span,2);du=diff(u);
time=(load('./Data/Sediments_transport/time1.txt')+1370)/3600;
time = time(span2);dt=1;

hl30 = load('./Data/Sediments_transport/hl30.txt');
hl20 = load('./Data/Sediments_transport/hl20.txt');
hl10 = load('./Data/Sediments_transport/hl10.txt');
hl30 = hl30(span2);
hl20 = hl20(span2);
hl10 = hl10(span2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calculate velocity gradient use central Difference method
eta=data(span,2);
v=u*0;
v(1)=(u(2)-u(1))/dt;
v(end)=(u(end)-u(end-1))/dt;
ndx=2:length(v)-1;
v(ndx)=(u(ndx+1)-u(ndx-1))/(2*dt);
d50 = 0.00025;
n=0.315;
e = n/(1-n);
d_1=d50;
d_2=d50;
d_3=d50;
rho_sat = 2160;
rho_w = 1000;
rho_s = (rho_sat-n*rho_w)/(1-n);
CD = (0.4./(1+log((d50/12)./eta))).^2;
tau=rho_w.*CD.*abs(u).*(u);
k_1=10^(-4);
k_2=10^(-5);
k_3=10^(-6);
vis=0.89*0.001;
K_1=k_1*vis/(1000*9.81);
K_2=k_2*vis/(1000*9.81);
K_3=k_3*vis/(1000*9.81);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%Calculate sleath number and gamma and gamma_mod
g=9.81;
S=rho_w.*v./(rho_s-rho_w)*g;


shields_h = tau./(g*d50*(rho_s-rho_w));
shields_hh = abs(tau)./(g*d50*(rho_s-rho_w));

gamma1=abs(-S-shields_h);
gamma2=gamma1;
shields_h1 = tau./(g*hl10*(rho_s-rho_w));
shields_h2 = tau./(g*hl20*(rho_s-rho_w));
shields_h3 = tau./(g*hl30*(rho_s-rho_w));

gamma31=abs(-S-shields_h1);
gamma32=abs(-S-shields_h2);
gamma33=abs(-S-shields_h3);


K_f = 0.58;
h=d50;

q= gradh10(span2,20)*rho_w*K_f/(rho_s-rho_w);
q2=gradh20(span2,40)*rho_w*K_f/(rho_s-rho_w);
q3=gradh30(span2,60)*rho_w*K_f/(rho_s-rho_w);
q4=gradm10(span2,20)*rho_w*K_f/(rho_s-rho_w);
q5=gradm20(span2,40)*rho_w*K_f/(rho_s-rho_w);
q6=gradm30(span2,60)*rho_w*K_f/(rho_s-rho_w);
q7=gradl10(span2,20).*rho_w.*K_f./(rho_s-rho_w);
q8=gradl20(span2,40).*rho_w.*K_f./(rho_s-rho_w);
q9=gradl30(span2,60).*rho_w.*K_f./(rho_s-rho_w);



gamma_mod_h10 = gamma1 + q;
gamma_mod_h20 = gamma1 + q2;
gamma_mod_h30 = gamma1 + q3;
gamma_mod_m10 = gamma2 + q4;
gamma_mod_m20 = gamma2 + q5;
gamma_mod_m30 = gamma2 + q6;
gamma_mod_l10 = gamma31 + q7;
gamma_mod_l20 = gamma32 + q8;
gamma_mod_l30 = gamma33 + q9;


x_wide=6.5;y_wide=7.5;x_num=1;y_num=5;flag_colorbar=0;x_gap=0.5;y_gap=1.2;c_gap=0.1;c_wide=3;
x_border=0.5;y_border=1.5;
[P_subplot,P_fig,P_colorbar,imode_axis] = ...
    subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border);

figure(1)
LW = 1.0; %Lineweight
Font = 10; %Font size
hh = hl10.*0+h;
tt = [time(883) time(883)];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{1});
plot(time,S,'k-',tt,[-0.05,0.01],'k-.','LineWidth',LW);
ylabel('S','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
% legend('d_{50}(1)','d_{50}(2)','d_{50}(3)','Location','best')
% legend('boxoff')
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'XTickLabel',[]);
annotation('textbox',[0.66,0.93,0,0],'string','start of draw-down','Edgecolor','none','FontSize',8,'FontName', 'Times New Roman');
annotation('textbox',[0.64,0.91,0,0],'string','\leftarrow ','Edgecolor','none','FontSize',8,'FontName', 'Times New Roman');

xlim([time(1) time(end)]);
ylim([-0.05 0.01]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{2});

plot(time,hh,'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
plot(time,hh,'-.','Color',"#00bfff",'LineWidth',LW);
plot(time,hh,'-.','Color',"#3cb371",'LineWidth',LW);
plot(time,hh,':','Color',"#ff7f50",'LineWidth',LW);
plot(time,hh,':','Color',"#00bfff",'LineWidth',LW);
plot(time,hh,':','Color',"#3cb371",'LineWidth',LW);
plot(time,hl10,'-','Color',"#ff7f50",'LineWidth',LW);
plot(time,hl20,'-','Color',"#00bfff",'LineWidth',LW);
plot(time,hl30,'-','Color',"#3cb371",'LineWidth',LW);
plot(tt,[0,20],'k-.','LineWidth',0.6)

hold on
qw{1} = plot(nan, 'k-.');
qw{2} = plot(nan, 'k:');
qw{3} = plot(nan, 'k-');
qw{4} = plot(nan, '-','Color',"#ff7f50",'LineWidth',LW); % You can add an extra element too
qw{5} = plot(nan, '-','Color',"#00bfff",'LineWidth',LW); % You can add an extra element too
qw{6} = plot(nan, '-','Color',"#3cb371",'LineWidth',LW); % You can add an extra element too
qw{7} = plot(nan, 'r--','LineWidth',0.6); 

lgd2 = legend([qw{1},qw{4},qw{2},qw{5},qw{3},qw{6}], {'$$k = 10^{-4}$$','h = 10 m','$$k = 10^{-5}$$', 'h = 20 m', '$$k = 10^{-6}$$', 'h = 30 m'},...
      'Interpreter','latex', 'FontSize',8,'FontName', 'Times New Roman');
lgd2.NumColumns =4;
lgd2.Position = [0.65,0.75,0,0];




ylabel('h$_{b}$ (m)','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')

set(gca,'XTickLabel',[]);
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
 xlim([time(1) time(end)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{3});

plot(time,q,'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
plot(time,q2,'-.','Color',"#00bfff",'LineWidth',LW);
plot(time,q3,'-.','Color',"#3cb371",'LineWidth',LW);
plot(time,q4,':','Color',"#ff7f50",'LineWidth',LW);
plot(time,q5,':','Color',"#00bfff",'LineWidth',LW);
plot(time,q6,':','Color',"#3cb371",'LineWidth',LW);
plot(time,q7,'-','Color',"#ff7f50",'LineWidth',LW);
plot(time,q8,'-','Color',"#00bfff",'LineWidth',LW);
plot(time,q9,'-','Color',"#3cb371",'LineWidth',LW);
plot(tt,[0,0.4],'k-.','LineWidth',0.6)


ylabel('X','FontSize',Font,'FontName', 'Times New Roman')

set(gca,'XTickLabel',[]);
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
 xlim([time(1) time(end)]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{4});

semilogy(time,gamma1,'r-.','LineWidth',LW);
hold on
semilogy(time,shields_hh,'b--','LineWidth',LW);

semilogy(time,time*0+0.3712,'k--',tt,[10e-6,10],'k-.','LineWidth',0.4);



ylabel('$$|\Upsilon|; \theta$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')

% legendflex(gca, {'a','b','c','d','e','f','g','h','i'},'buffer', [-10 -10],'ncol',9,'nrow',1,...
%    'xscale', 0.3,'box','off','fontsize',10)
%ylim([10e-6 100]);
legend('|\Upsilon|',' \theta','|\Upsilon| threshold: 0.37','Location','southwest','FontSize',Font,'FontName', 'Times New Roman')
%legend box off
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'XTickLabel',[]);
xlim([time(1) time(end)]);
ylim([10^(-5),10]);
set(gca,'YTick',10.^(-5:0));
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{5});
semilogy(time,time*0+0.3712,'k--',tt,[10e-6,10],'k-.','LineWidth',0.4);
hold on
semilogy(time,gamma_mod_h10,'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
semilogy(time,gamma_mod_h20,'-.','Color',"#00bfff",'LineWidth',LW);
semilogy(time,gamma_mod_h30,'-.','Color',"#3cb371",'LineWidth',LW);
semilogy(time,gamma_mod_m10,':','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,gamma_mod_m20,':','Color',"#00bfff",'LineWidth',LW);
semilogy(time,gamma_mod_m30,':','Color',"#3cb371",'LineWidth',LW);
semilogy(time,gamma_mod_l10,'-','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,gamma_mod_l20,'-','Color',"#00bfff",'LineWidth',LW);
semilogy(time,gamma_mod_l30,'-','Color',"#3cb371",'LineWidth',LW);

legend('|\Upsilon| threshold: 0.37','Location','southwest','FontSize',Font,'FontName', 'Times New Roman')

ylabel('$$\Upsilon^\prime$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman');

ylim([10^(-5),10]);
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'YTick',10.^(-5:0));
 xlim([time(1) time(end)]);
%set(gca,'XTickLabel',[]);
annotation('textbox',[0.0,0.97,0,0],'string','(a)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.79,0,0],'string','(b)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.60,0,0],'string','(c)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.42,0,0],'string','(d)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.23,0,0],'string','(e)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');

ww=7;
yy=8.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,yy])
print('./Figures/fig11','-depsc','-r600')

% aa = 324;
% logshields1 = [gamma_mod_l30(aa) gamma_mod_l20(aa) gamma_mod_l10(aa) gamma_mod_m30(aa) gamma_mod_m20(aa) gamma_mod_m10(aa) gamma_mod_h30(aa) gamma_mod_h20(aa) gamma_mod_h10(aa)];
% aa=996;
% logshields2 = [gamma_mod_l30(aa) gamma_mod_l20(aa) gamma_mod_l10(aa) gamma_mod_m30(aa) gamma_mod_m20(aa) gamma_mod_m10(aa) gamma_mod_h30(aa) gamma_mod_h20(aa) gamma_mod_h10(aa)];
% aa =1269;
% logshields3 = [gamma_mod_l30(aa) gamma_mod_l20(aa) gamma_mod_l10(aa) gamma_mod_m30(aa) gamma_mod_m20(aa) gamma_mod_m10(aa) gamma_mod_h30(aa) gamma_mod_h20(aa) gamma_mod_h10(aa)];
% dlmwrite('upsilon1dot.txt',logshields1);
% dlmwrite('upsilon2dot.txt',logshields2);
% dlmwrite('upsilon3dot.txt',logshields3);
% 
% dlmwrite('S1.txt',gamma_mod_l30)
% dlmwrite('S2.txt',gamma_mod_l20)
% dlmwrite('S3.txt',gamma_mod_l10)
% dlmwrite('S4.txt',gamma_mod_m30)
% dlmwrite('S5.txt',gamma_mod_m20)
% dlmwrite('S6.txt',gamma_mod_m10)
% dlmwrite('S7.txt',gamma_mod_h30)
% dlmwrite('S8.txt',gamma_mod_h20)
% dlmwrite('S9.txt',gamma_mod_h10)
