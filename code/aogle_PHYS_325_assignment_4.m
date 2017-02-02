clear all; 
%% Problems 2.1, 2.2, and 2.4

%Run with or without air resistance? 1 is with and 0 is without
air = 1;
    
    

%Define initial variables
dt = 0.1; %time interval, s
ft = 100; %size of the time interval desired, s
P = 400; %Power of elite bicyclist, W
v_i = 4; %initial velocity of the bicyclist, m/s
m = 70; %mass of bicyclist and bicycle, kg
C = 0.5; %air resistance constant 
p = 1.225; %density of air, kg/m^3
A_n = 0.33; %frontal area, m^2
A_mid = 0.231; %frontal area for rider in the middle of a pack, m^2
theta = 0.111;

%Create an array for the time variable (independent variable)
t = (0.0:dt:ft+dt); %0 to ft seconds
%Create an array for the velocity variable (dependent variable)
v(1) = v_i; 
vt(1) = v_i;

if(~air)
%Loop for calculating the change in velocity of the bicycle
for i = 2:length(t)
      v(i) = v(i-1) + (P/(m*v(i-1)))*dt;  
      vt(i) = (v(i-1)^2 + (2*P*dt)/m)^(0.5) + 1;
end

clc
disp('Simulation 2.1 completed.');

clf
plot(t,v,'-');
hold on;
plot(t,vt,'-r');
hold on;
legend('Numerical Solution','Exact Solution');
xlabel('Time (s)')
ylabel('Bicycle Velocity (m/s)')
title('Bicycle Velocity Sans Air Resistance')

else
%Initial conditions, 5 different powers, 5 different frontal areas  
dp = 50;
da = 0.04125;
v_p1(1) = v_i;
v_p2(1) = v_i;
v_p3(1) = v_i;
v_p4(1) = v_i;
v_p5(1) = v_i;
v_p6(1) = v_i;
v_p7(1) = v_i;
v_p8(1) = v_i;
v_p9(1) = v_i;
v_p10(1) = v_i;

P_t = (0:dp:P+dp);
A_t = (0:da:A_n+dt);
%Loop for varying power and frontal area, with air resistance
for j = 1:length(A_t)
for i = 2:length(t)
       v_p1(i) = v_p1(i-1) + (P/(m*v_p1(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(1)*(v_p1(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p2(i) = v_p2(i-1) + (P/(m*v_p2(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(2)*(v_p2(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p3(i) = v_p3(i-1) + (P/(m*v_p3(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(3)*(v_p3(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p4(i) = v_p4(i-1) + (P/(m*v_p4(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(4)*(v_p4(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p5(i) = v_p5(i-1) + (P/(m*v_p5(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(5)*(v_p5(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p6(i) = v_p6(i-1) + (P/(m*v_p6(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(6)*(v_p6(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p7(i) = v_p7(i-1) + (P/(m*v_p7(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(7)*(v_p7(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p8(i) = v_p8(i-1) + (P/(m*v_p8(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(8)*(v_p8(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p9(i) = v_p9(i-1) + (P/(m*v_p9(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(9)*(v_p9(i-1)^2))/(2*m))*dt;
end
for i = 2:length(t)
       v_p10(i) = v_p10(i-1) + (P/(m*v_p10(i-1)))*dt + 9.8*sin(theta)*dt - ((C*p*A_t(10)*(v_p10(i-1)^2))/(2*m))*dt;
end
end



clc
disp('Simulation 2.2 completed');
clf
plot(t,v_p1,t,v_p2,t,v_p3,t,v_p4,t,v_p5,t,v_p6,t,v_p7,t,v_p8,t,v_p9,t,v_p10);
hold on;
xlabel('Time (s)')
ylabel('Bicycle Velocity (m/s)')
title('Bicycle Velocity With Air Resistance, Varying Frontal Area')

end

%% Problems 2.8, 2.9, 2.10

%Define initial variables
dt = 0.1; %time interval, s
ft = 10; %size of the time interval desired, s
G = 6.67384e-11; %gravitational constant
Me = 5.972e24; %mass of the earth
theta = pi/4; %angle at which the shell is fired
p_i = 0; %initial position of the shell
p_ix = p_i*cos(theta); %component forms
p_iy = p_i*sin(theta); %component forms
v_i = 100; %initial velocity of the shell
v_ix = v_i*cos(theta); %velocity in x direction
v_iy = v_i*sin(theta); %velocity in y direction
m = 70; %mass of shell
C = 0.5; %air resistance constant 
p = 1.225; %density of air, kg/m^3
A_n = 0.33; %frontal area, m^2


%Create an array for the time variable (independent variable)
t = (0.0:dt:ft+dt); %0 to ft seconds
%Create an array for the velocity variable (dependent variable)
p(1) = p_i;
p_x(1) = p_ix;
p_y(1) = p_iy;
v(1) = v_i;
v_x(1) = v_ix;
v_y(1) = v_iy;

%Loop for calculating the change in velocity of the bicycle
for i = 2:length(t)
      p_x(i) = p_x(i-1) + v_x(i-1)*dt;
      p_y(i) = p_y(i-1) + v_y(i-1)*dt;
      
      v_x(i) = v_x(i-1) - ((C*v(i-1)*v_x(i-1))/m)*dt;
      v_y(i) = v_y(i-1) - ((G*Me)/(p_y(i-1) + 6371000))*dt - ((C*v(i-1)*v_y(i-1))/m)*dt; 
      
      v(i) = sqrt(v_x(i)^2 + v_y(i)^2);
      if(p_y <= 0)
          i = length(t);
      end
end
clc
disp('Simulation 2.8 completed.');

clf
plot(p_x,p_y,'-');
hold on;
legend('Trajectory 1');
xlabel('Time (s)')
ylabel('Bicycle Velocity (m/s)')
title('Bicycle Velocity Sans Air Resistance')


