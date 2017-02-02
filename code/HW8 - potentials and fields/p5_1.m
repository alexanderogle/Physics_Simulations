% find the electrostatic potential inside a square box with vertical conducting walls at -1 and +1 volts
% Figure 5.2 in Computational Book
% in other words, solve laplace's equation for the boundary conditions
% described above

clear all

%The dimensions of the potential field
%currently, x and y must be equal to eachother.
x_d = 1;
y_d = x_d;
%the prism voltage
prism_v = 1;
%the length of the side of the prism, relative to the dimensions of the
%potential field
scale = 0.4;
prism_size_x = scale*x_d;
prism_size_y = scale*y_d;

dx = 1/20;
x = [-x_d:dx:x_d];
y = [-y_d:dx:y_d];
x_in = [-prism_size_x:dx:prism_size_x];
y_in = [-prism_size_x:dx:prism_size_x];
Vo = zeros(length(x),length(y));
%matrix for inner prism 
Vo_in = zeros(length(x_in), length(y_in));
%initial conditions for inner prism
dim_Vo_in = size(Vo_in);
%starting positions to translate this matrix into Vo later
x_b = (length(x) - length(x_in))*0.5;
y_b = (length(y) - length(y_in))*0.5;
x_e = x_b + dim_Vo_in(1);
y_e = y_b + dim_Vo_in(2);
%insert the prism matrix into the Vo matrix
for i = x_b:x_e
   for j = y_b:y_e
       Vo(i,j) = prism_v;
   end
end
%The outer boundary conditions
Vo(1,:) = 0;
Vo(end,:) = 0;
Vo(:,1) = 0;
Vo(:,end) = 0;
Vn=Vo;

for k=1:200;
    for i=2:length(x)-1;
        for j=2:length(y)-1;
        Vn(i,j)=(1/4)*(Vo(i+1,j)+Vo(i-1,j)+Vo(i,j+1)+Vo(i,j-1));
        end
    end
    Vo=Vn;
    Vo(1,:) = 0;
    Vo(end,:) = 0;
    Vo(:,1) = 0;
    Vo(:,end) = 0;
    for i = x_b:x_e
        for j = y_b:y_e
            Vo(i,j) = prism_v;
        end
    end
end

mesh(x,y,Vn)
title('Electric Potential of a Hollow Metallic Prism with Solid, Metallic Inner Conductor')
xlabel('x position')
ylabel('y position')
zlabel('Potential')