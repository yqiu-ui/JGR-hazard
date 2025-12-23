clc;clear;
sh1 = load('./Data/Sediments_transport/shields1.txt');
sh2 = load('./Data/Sediments_transport/shields2.txt');
sh3 = load('./Data/Sediments_transport/shields3.txt');
sh4 = load('./Data/Sediments_transport/shields4.txt');
sh5 = load('./Data/Sediments_transport/shields5.txt');
sh6 = load('./Data/Sediments_transport/shields6.txt');
sh7 = load('./Data/Sediments_transport/shields7.txt');
sh8 = load('./Data/Sediments_transport/shields8.txt');
sh9 = load('./Data/Sediments_transport/shields9.txt');

sh11 = load('./Data/Sediments_transport/shields11.txt');
sh21 = load('./Data/Sediments_transport/shields21.txt');
sh31 = load('./Data/Sediments_transport/shields31.txt');
sh41 = load('./Data/Sediments_transport/shields41.txt');
sh51 = load('./Data/Sediments_transport/shields51.txt');
sh61 = load('./Data/Sediments_transport/shields61.txt');
sh71 = load('./Data/Sediments_transport/shields71.txt');
sh81 = load('./Data/Sediments_transport/shields81.txt');
sh91 = load('./Data/Sediments_transport/shields91.txt');

s1 = load('./Data/Sediments_transport/S1.txt');
s2 = load('./Data/Sediments_transport/S2.txt');
s3 = load('./Data/Sediments_transport/S3.txt');
s4 = load('./Data/Sediments_transport/S4.txt');
s5 = load('./Data/Sediments_transport/S5.txt');
s6 = load('./Data/Sediments_transport/S6.txt');
s7 = load('./Data/Sediments_transport/S7.txt');
s8 = load('./Data/Sediments_transport/S8.txt');
s9 = load('./Data/Sediments_transport/S9.txt');

s11 = load('./Data/Sediments_transport/S11.txt');
s21 = load('./Data/Sediments_transport/S21.txt');
s31 = load('./Data/Sediments_transport/S31.txt');
s41 = load('./Data/Sediments_transport/S41.txt');
s51 = load('./Data/Sediments_transport/S51.txt');
s61 = load('./Data/Sediments_transport/S61.txt');
s71 = load('./Data/Sediments_transport/S71.txt');
s81 = load('./Data/Sediments_transport/S81.txt');
s91 = load('./Data/Sediments_transport/S91.txt');



Font =12;

label = ['i','h','g','f','e','d','c','b','a']
v =4;
xl = [v,v,v,v,v,v,v,v,v];
yl = [v,v,v,v,v,v,v,v,v];
case_depth = [30,30,30,20,20,20,10,10,10];
case_order = [6,6,6,5,5,5,4,4,4];


for ii =1:9
    ii = 10-ii;
    newstring = ['(',label(ii),')'];
figure(ii)

aa = eval(['sh' num2str(ii)]);
bb = eval(['s' num2str(ii)]);
cc = eval(['sh' num2str(ii) '1']);
dd = eval(['s' num2str(ii) '1']);
%ee = eval(['s' num2str(ii) 'm']);

plot(aa(1:853),bb(1:853),'bo',cc(1:675),dd(1:675),'ro',aa(853:end),bb(853:end),'b^',cc(675:end),dd(675:end),'r^')
%hold on
%plot(aa(1:853),ee(1:853),'go',aa(853:end),ee(853:end),'g^')
if ii == 1
   legend('drawdown-Case A','drawdown-Case B','runup-Case A','runup-Case B','Location','northeast','FontSize',Font,'FontName', 'Times New Roman')
end
% legend box off



xlabel('$$\theta^\prime$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
ylabel('$$\Upsilon^\prime$$','Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');
xlim([0 xl(10-ii)])
ylim([0.3 yl(10-ii)])

annotation('textbox',[0.32,1.00,0,0],'string',sprintf('$h = %d m; k = 10^{-%d} m/s$', case_depth(ii),case_order(ii)),'Interpreter','latex','FontSize',Font,'FontName', 'Times New Roman');

box on
grid on 
annotation('textbox',[0.0,1,0,0],'string',newstring,'Edgecolor','none','FontSize',Font,'FontName', 'Times New Roman');
set(gca,'FontSize',Font,'FontName', 'Times New Roman')
ww=4;
yy=3.5;
set(gcf, 'Units','Inches', 'Position', [1, 1, ww,yy])
print(['./Figures/fig13' num2str(label(ii))],'-depsc','-r600')
end
