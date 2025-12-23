function z=sigma2z(h,eta,sigma,h_c,h_s,theta_b,theta_f)
%
% z=sigma2z(h,eta,sigma,h_c,theta_b,theta_f)
%
% transformation from sigma coords to z levels, eqn (3.1) on pg. 14 of schism manual
%

C=(1-theta_b)*sinh(theta_f*sigma)/sinh(theta_f) ...
  + theta_b*(tanh(theta_f*(sigma+1/2))-tanh(theta_f/2))/(2*tanh(theta_f/2));
hbar=min(h,h_s);
z=eta*(1+sigma)+h_c*sigma+(hbar-h_c)*C;
