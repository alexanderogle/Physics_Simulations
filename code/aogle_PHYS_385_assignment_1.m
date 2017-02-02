clear 

%PHYS 385 Assignment #1

%generate array, set value of kT
v = [0.0:0.1:5];
kT = 200; 

%constants used in the equation
%c = speed of light
c = 1; %299792458;
%k = Boltzman's constant.
k = 1.3806488e-23;
%planck's constant
h = 1; %6.62606957e-34;

%The equation for the Rayleigh-Jeans model 
u_RJ = v.^2;  %((v.^2)*((8*pi)/(c^3))*kT);

%The equation for the Planck model
p_term1 = (v.^2)*(1); %1 should actually be (8*pi)/(c^3)
exp_term = ((h*v))/(kT);
p_term2 = ((h*v)/(exp(exp_term)-1));
u_P = (v.^3)./(exp(v)-1); 

%plot the functions together
plot(v,u_RJ,'--mo',v,u_P,':r*')
title('Models for Specftrum of Blackbody Radiation')
xlabel('Frequency (v)') % x-axis label
ylabel('Spectral Density (u)') % y-axis label
legend('Rayleigh Jeans Model','Planck Model')



