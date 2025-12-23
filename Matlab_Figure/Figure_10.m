clc;clear
currentpath = pwd;

addpath('tools','-end');
%addpath('tools/kakearney-legendflex-pkg-f29cb4e','-end')
data=load('./Data/Sediments_transport/staout_1_2');
data2=load('./Data/Sediments_transport/staout_7_2');
gradh10 = load('./Data/Sediments_transport/gradient2_0.txt');
gradh20 = load('./Data/Sediments_transport/gradient2_3.txt');
gradh30 = load('./Data/Sediments_transport/gradient2_6.txt');
gradm10 = load('./Data/Sediments_transport/gradient2_1.txt');
gradm20 = load('./Data/Sediments_transport/gradient2_4.txt');
gradm30 = load('./Data/Sediments_transport/gradient2_7.txt');
gradl10 = load('./Data/Sediments_transport/gradient2_2.txt');
gradl20 = load('./Data/Sediments_transport/gradient2_5.txt');
gradl30 = load('./Data/Sediments_transport/gradient2_8.txt');
span = 1409:2467;
for i = 1:length(gradh10(:,end))
    if gradh10(i,end)>1.16
        gradh10(i,end) = 1.16;
    end
    if gradh20(i,end)>1.16
        gradh20(i,end) = 1.16;
    end
    if gradh30(i,end)>1.16
        gradh30(i,end) = 1.16;
    end
    if gradm10(i,end)>1.16
        gradm10(i,end) = 1.16;
    end
    if gradm20(i,end)>1.16
        gradm20(i,end) = 1.16;
    end
    if gradm30(i,end)>1.16
        gradm30(i,end) = 1.16;
    end
    if gradl10(i,end)>1.16
        gradl10(i,end) = 1.16;
    end
    if gradl20(i,end)>1.16
        gradl20(i,end) = 1.16;
    end
    if gradl30(i,end)>1.16
        gradl30(i,end) = 1.16;
    end
end

 span2 = span-1408;       
eta=data(span,2);
u=data2(span,2);du=diff(u);
time=(load('./Data/Sediments_transport/time1_2.txt')+1584)/3600;
time = time(span2);
%time=((1192:2458)-1192)/3600;
dt=diff(time);
time2=time(2:end);
v=du(:,1)./dt(1,:)';
% % time2=1:5996;
% % SL=time2*0;
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
tau=rho_w.*CD.*(u.^2);
k_1=10^(-4);
k_2=10^(-5);
k_3=10^(-6);
vis=0.89*0.001;
K_1=k_1*vis/(1000*9.81);
K_2=k_2*vis/(1000*9.81);
K_3=k_3*vis/(1000*9.81);

% % v = 10^(-6);
 g = 9.81;
shields_1 = tau./(g*d_1*(rho_s-rho_w));
shields_2 = tau./(g*d_2*(rho_s-rho_w));
shields_3 = tau./(g*d_3*(rho_s-rho_w));


shields_m1 = tau.*(1-n)./(d_3*(g*(rho_sat-rho_w)-g*rho_w*gradl30(span2,60)));
shields_m2 = tau.*(1-n)./(d_3*(g*(rho_sat-rho_w)-g*rho_w*gradl20(span2,40)));
shields_m3 = tau.*(1-n)./(d_3*(g*(rho_sat-rho_w)-g*rho_w*gradl10(span2,20)));
shields_m4 = tau.*(1-n)./(d_2*(g*(rho_sat-rho_w)-g*rho_w*gradm30(span2,60)));
shields_m5 = tau.*(1-n)./(d_2*(g*(rho_sat-rho_w)-g*rho_w*gradm20(span2,40)));
shields_m6 = tau.*(1-n)./(d_2*(g*(rho_sat-rho_w)-g*rho_w*gradm10(span2,20)));
shields_m7 = tau.*(1-n)./(d_1*(g*(rho_sat-rho_w)-g*rho_w*gradh30(span2,60)));
shields_m8 = tau.*(1-n)./(d_1*(g*(rho_sat-rho_w)-g*rho_w*gradh20(span2,40)));
shields_m9 = tau.*(1-n)./(d_1*(g*(rho_sat-rho_w)-g*rho_w*gradh10(span2,20)));
% % S=rho_w*v/(rho_s-rho_w)*g;
% gamma=abs(-shields(2:end)-S);
% Threshold = 0.58*0.64*1+0.58*gradl30(:,300)/(rho_s-rho_w);
% % Re = abs(u.*d/v);
x_wide=6.5;y_wide=7.5;x_num=1;y_num=5;flag_colorbar=0;x_gap=0.5;y_gap=1.2;c_gap=0.1;c_wide=3;
x_border=0.5;y_border=1.5;
[P_subplot,P_fig,P_colorbar,imode_axis] = ...
    subplot_position(x_wide,y_wide,x_num,y_num,flag_colorbar,x_gap,y_gap,c_gap,c_wide,x_border,y_border);

figure(1)
LW = 1.0; %Lineweight
Font = 10; %Font size

tt = [time(678) time(678)];
subplot('position',P_subplot{1});
plot(time,u,'k-',tt,[-2,1],'k-.','LineWidth',LW)
% xlabel('Time (s)','Interpreter','latex','FontSize',Font)
ylabel('u (m/s)','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
% % legend('Wave height','Shoreline','Location','best')
% % legend('boxoff')
annotation('textbox',[0.62,0.87,0,0],'string','start of draw-down','Edgecolor','none','FontSize',8,'FontName', 'Times New Roman');
annotation('textbox',[0.60,0.85,0,0],'string','\leftarrow ','Edgecolor','none','FontSize',8,'FontName', 'Times New Roman');
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'XTickLabel',[]);
xlim([time(1) time(end)]);
% set(gca,'YTickLabel',[]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{2});
semilogy(time,shields_1,'k-','LineWidth',LW);
hold on
semilogy([0 time(end)],[0.05 0.05],'k--',time(1:50:end),time(1:50:end).*0+0.8,'m--',tt,[0.00001,10],'k-.','LineWidth',0.4);

% hold on
% qw{1} = plot(nan, 'k--','LineWidth',0.4);
% qw{2} = plot(nan, 'm--','LineWidth',0.4);
% lgd1 = legend([qw{1},qw{2}], {'Particle Motion Threshold: 0.05 ','Sheet Flow Threshold: 0.8'},'FontSize',8,'FontName', 'Times New Roman');
% lgd1.NumColumns =1;
% lgd1.Position = [0.28,0.1,0,0];

ylabel('$$\theta$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
legend('Shields Parameter','Particle Motion Threshold: 0.05 ','Sheet Flow Threshold: 0.8 ','Location','southwest','FontSize',8,'FontName', 'Times New Roman');
%legend('boxoff')
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'XTickLabel',[]);
ylim([0 10]);
xlim([time(1) time(end)]);
set(gca,'YTick',10.^(0:1));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{3});
plot(time,gradh10(span2,20),'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
plot(time,gradh20(span2,40),'-.','Color',"#00bfff",'LineWidth',LW);
plot(time,gradh30(span2,60),'-.','Color',"#3cb371",'LineWidth',LW);
plot(time,gradm10(span2,20),':','Color',"#ff7f50",'LineWidth',LW);
plot(time,gradm20(span2,40),':','Color',"#00bfff",'LineWidth',LW);
plot(time,gradm30(span2,60),':','Color',"#3cb371",'LineWidth',LW);
plot(time,gradl10(span2,20),'-','Color',"#ff7f50",'LineWidth',LW);
plot(time,gradl20(span2,40),'-','Color',"#00bfff",'LineWidth',LW);
plot(time,gradl30(span2,60),'-','Color',"#3cb371",'LineWidth',LW);
plot(time,time*0+1.16,'r--',tt,[0,1.5],'k-.','LineWidth',0.6)

ylabel('$$\partial h_{e}/\partial z$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')

%legendflex(gca, {'(a)','(b)','(c)','(d)','(e)','(f)','(g)','(h)','(i)'},'buffer', [-10 -5],'ncol',9,'nrow',1,...
 %  'xscale', 0.3,'box','off','fontsize',10,'FontName', 'Times New Roman')

hold on
qw{1} = plot(nan, 'k-.');
qw{2} = plot(nan, 'k:');
qw{3} = plot(nan, 'k-');
qw{4} = plot(nan, '-','Color',"#ff7f50",'LineWidth',LW); % You can add an extra element too
qw{5} = plot(nan, '-','Color',"#00bfff",'LineWidth',LW); % You can add an extra element too
qw{6} = plot(nan, '-','Color',"#3cb371",'LineWidth',LW); % You can add an extra element too
qw{7} = plot(nan, 'r--','LineWidth',0.6); 

lgd2 = legend([qw{1},qw{4},qw{2},qw{5},qw{3},qw{6},qw{7}], {'$$k = 10^{-4}$$','h = 10 m','$$k = 10^{-5}$$', 'h = 20 m', '$$k = 10^{-6}$$', 'h = 30 m','Liquefaction Criterion'},...
      'Interpreter','latex', 'FontSize',8,'FontName', 'Times New Roman');
lgd2.NumColumns =4;
lgd2.Position = [0.55,0.58,0,0];

ylim([-0.1 1.5]);
box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
set(gca,'XTickLabel',[]);
xlim([time(1) time(end)]);

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot('position',P_subplot{4});
semilogy(time,shields_m9,'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
semilogy(time,shields_m8,'-.','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m7,'-.','Color',"#3cb371",'LineWidth',LW);
semilogy(time,shields_m6,':','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,shields_m5,':','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m4,':','Color',"#3cb371",'LineWidth',LW);
semilogy(time,shields_m3,'-','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,shields_m2,'-','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m1,'-','Color',"#3cb371",'LineWidth',LW);
semilogy([0 time(end)],[0.05 0.05],'k--',tt,[0.00001,10^(20)],'k-.','LineWidth',0.4);

hold on
qw{1} = plot(nan, 'k--','LineWidth',0.4);

lgd3 = legend([qw{1}], {'Particle Motion Threshold: 0.05 '},'FontSize',8,'FontName', 'Times New Roman');
lgd3.NumColumns = 2;
lgd3.Position = [0.28,0.28,0,0];




ylabel('$$\theta^\prime$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')

box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([time(1) time(end)]);
ylim([0 10^5]);
set(gca,'XTickLabel',[]);
set(gca,'YTick',10.^(0:1:5))


subplot('position',P_subplot{5});
semilogy(time,shields_m9,'-.','Color',"#ff7f50",'LineWidth',LW);
hold on
semilogy(time,shields_m8,'-.','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m7,'-.','Color',"#3cb371",'LineWidth',LW);
semilogy(time,shields_m6,':','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,shields_m5,':','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m4,':','Color',"#3cb371",'LineWidth',LW);
semilogy(time,shields_m3,'-','Color',"#ff7f50",'LineWidth',LW);
semilogy(time,shields_m2,'-','Color',"#00bfff",'LineWidth',LW);
semilogy(time,shields_m1,'-','Color',"#3cb371",'LineWidth',LW);

semilogy([0 time(end)],[0.05 0.05],'k--',time(1:50:end),time(1:50:end).*0+0.8,'m--',tt,[0.00001,10^(20)],'k-.','LineWidth',0.4);

hold on
qw{1} = plot(nan, 'k--','LineWidth',0.4);
qw{2} = plot(nan, 'm--','LineWidth',0.4);
lgd4 = legend([qw{1},qw{2}], {'Particle Motion Threshold: 0.05 ','Sheet Flow Threshold: 0.8'},'FontSize',8,'FontName', 'Times New Roman');
lgd4.NumColumns =1;
lgd4.Position = [0.28,0.1,0,0];

ylabel('$$\theta^\prime$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman')
xlabel('Time (hrs)','FontSize',Font,'FontName', 'Times New Roman');

%legendflex(gca, {'(a)','(b)','(c)','(d)','(e)','(f)','(g)','(h)','(i)'},'buffer', [-10 -10],'ncol',9,'nrow',1,...
   %'xscale', 0.3,'box','off','fontsize',10)
ylim([0 10]);

box on
grid on 
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
xlim([time(1) time(end)]);
set(gca,'YTick',10.^(0:1));
annotation('textbox',[0.0,0.97,0,0],'string','(a)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.79,0,0],'string','(b)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.61,0,0],'string','(c)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.43,0,0],'string','(d)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
annotation('textbox',[0.0,0.24,0,0],'string','(e)','Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
ww=7;
yy=8.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,yy])
print('./Figures/fig10','-depsc','-r600')
% aa = 391;
% logshields1 = [shields_m1(aa) shields_m2(aa) shields_m3(aa) shields_m4(aa) shields_m5(aa) shields_m6(aa) shields_m7(aa) shields_m8(aa) shields_m9(aa)];
% aa=788;
% logshields2 = [shields_m1(aa) shields_m2(aa) shields_m3(aa) shields_m4(aa) shields_m5(aa) shields_m6(aa) shields_m7(aa) shields_m8(aa) shields_m9(aa)];
% aa =1081;
% logshields3 = [shields_m1(aa) shields_m2(aa) shields_m3(aa) shields_m4(aa) shields_m5(aa) shields_m6(aa) shields_m7(aa) shields_m8(aa) shields_m9(aa)];
% dlmwrite('shields1dot.txt',logshields1);
% dlmwrite('shields2dot.txt',logshields2);
% dlmwrite('shields3dot.txt',logshields3);
% 
% dlmwrite('shields1.txt',shields_m1);
% dlmwrite('shields2.txt',shields_m2);
% dlmwrite('shields3.txt',shields_m3);
% dlmwrite('shields4.txt',shields_m4);
% dlmwrite('shields5.txt',shields_m5);
% dlmwrite('shields6.txt',shields_m6);
% dlmwrite('shields7.txt',shields_m7);
% dlmwrite('shields8.txt',shields_m8);
% dlmwrite('shields9.txt',shields_m9);