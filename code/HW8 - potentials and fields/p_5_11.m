clear all;

L = 10;
dz = 0.01;
dx = 0.1;
z = [-L:dz:L];
x_i = 10;
x = [0:0.5*dz:x_i];


%Using Standard Integration 
for j=1:length(x)
B(j)=0;   
for i=1:length(z)
    dB(i)= (x(j)*dz)/(((x(j)^2)+(z(i)^2))^(3/2));
    B(j) = B(j) + dB(i);
end
end

% A(1) = 0;
% dx1(1) = 0;
% dx2(1)
% dx3(1)
% dx4(1)
% 
% 
% %Using Simpson's Rule  
% for j=1:length(x)+4   
% for i=1:length(z)
%     B(j) = (x(j)*dz)/(((x(j)^2)+(z(i)^2))^(3/2));
%     B(j+1) = (x(j+1)*dz)/(((x(j+1)^2)+(z(i)^2))^(3/2));
%     B(j) = (x(j)*dz)/(((x(j)^2)+(z(i)^2))^(3/2));
%     B(j) = (x(j)*dz)/(((x(j)^2)+(z(i)^2))^(3/2));
%     
% end
% end


plot(x, B)
xlabel('Distance (m)');
ylabel('B Field (T)');
axis([0 1 0 50])
title('B Field for a point above a line of charge');
