%%Generating 3D Vector Fields

%Details of the plane
x(1) = 0;
y(1) = 0;
z(1) = 0;

%The smallest division of a unit of the map size
ds = 1;

dt = 0.1;
ft = 10;
t = (1:dt:ft);

%determine how large of a space should be generated
x_end = 7;
y_end = 7;
z_end = 7;

for i = 1:length(t)
   
end

%The X, Y, and Z arrays are used to generate a grid for the simulation
spacing = (x_end - (-x_end))/ds;
X = linspace(-x_end, x_end, spacing);
Y = linspace(-y_end, y_end, spacing);
Z = linspace(-z_end, z_end, spacing);

U = sin(X.^2 + Y.^2);
V = cos(Y.^2 + Z.^2);
W = Z.*0;

quiver3(X,Y,Z,U,V,W);
view(-35,45);
