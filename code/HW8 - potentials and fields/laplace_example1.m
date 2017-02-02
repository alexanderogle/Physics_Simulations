% find the electrostatic potential inside a square box with vertical conducting walls at -1 and +1 volts
% Figure 5.2 in Computational Book
% in other words, solve laplace's equation for the boundary conditions
% described above

clear all

dx = 1/250;
x = [-1:dx:1];
y = [-1:dx:1];
x_in = [-0.6:dx:0.6];
y_in = [-0.6:dx:0.6];
Vo = zeros(length(x),length(y));
%matrix for inner prism 
Vo_in = zeros(length(x_in), length(y_in));
%starting positions to translate this matrix into Vo later
x_b = length(x) - length(x_in);
y_b = length(y) - length(y_in);
%initial conditions for inner prism
%the "ones" matrix function could be used, but then the value for the prism
%voltage could not be arbitrarily adjusted later
dim_Vo_in = size(Vo_in);
for i = 1:dim_Vo_in(2)
   for j = 1:dim_Vo_in(2)
       Vo_in(i,j) = 1;
   end
end
%The outer boundary conditions
Vo(1,:) = 0;
Vo(end,:) = 0;
Vo(:,1) = 0;
Vo(:,end) = 0;
%The metallic prism initial conditions

%calculate the length of the sides of the prism
% side_l = ((0.6*length(x))/dx) - mod((0.6*length(x))/dx,2);
% %find the starting points for the prism in the matrix of Vo
% xp_b = 0.5*(length(x)-side_l);
% xp_e = xp_b + side_l - 1;
% yp_b = 0.5*(length(y)-side_l);
% yp_e = yp_b + side_l - 1;
% %put in the boundary conditions
% Vo(xp_b:xp_e, yp_b) = 1;
% Vo(xp_b:xp_e, yp_e) = 1;
% Vo(xp_b,yp_b:yp_e) = 1;
% Vo(xp_e,yp_b:yp_e) = 1;


Vn=Vo;

for k=1:20;
    for i=2:length(x)-1;
        for j=2:length(y)-1;
        Vn(i,j)=(1/4)*(Vo(i+1,j)+Vo(i-1,j)+Vo(i,j+1)+Vo(i,j-1));
        end
    end
    Vo=Vn;
    Vo(:,1) = -1;
    Vo(:,length(y)) = 1;
end

mesh(x,y,Vn)
title('Electric potential inside a box with walls held at opposite potentials')
xlabel('x position')
ylabel('y position')
zlabel('Potential')