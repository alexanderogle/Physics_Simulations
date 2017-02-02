
%Current issue: [5-4-15] Adding the planet now, the given conditions
%for the binary star system produce a stable orbit for the time interval of
%t = 100*pi. Took the plotting functions out of the for loop, added to the
%end of the code, has made the code run about 1000x faster now. 

clear all;
clear fig;

%planet stuff
%k ->mass ratio: (planet mass)/(earth mass)
%for our stars here, we'll use the mass of the sun in terms of # of earths
Ms1 = 331500;
Ms2 = 331500;
Mp1 = 1;
m_f = 30;
pm_f = 10;
%m_f = 30-46 produces a stable orbit for t = 2*pi
%note that 'stable' orbits are really only relative to some time scale

%controls the size of the dots in the scatter plots
dot_size = 1;
planet_dot_size = 1;

B = 2;

%star 1
x_s1(1) = 1*m_f;
y_s1(1) = 0*m_f;
v_xs1(1) = 0*m_f;
v_ys1(1) = 1.75*pi*m_f;

%star 2
x_s2(1) = -1/sqrt(2)*m_f;
y_s2(1) = 1/sqrt(2)*m_f;
v_xs2(1) = 0*m_f;
v_ys2(1) = -1.8*pi*m_f;

l = 2.5629;

%planet 1
x_p1(1) = 300*pm_f;
y_p1(1) = 0*pm_f;
v_xp1(1) = 0;
v_yp1(1) = l*pi*13;

dt = 0.0001;
ft = 100*pi;
t = [0:dt:ft+dt];

%Begin all necessary radii
r_s1s2(1) = sqrt(((x_s1(1) - x_s2(1))^2) + ((y_s1(1) - y_s2(1))^2));
r_s1p1(1) = sqrt(((x_s1(1) - x_p1(1))^2) + ((y_s1(1) - y_p1(1))^2));
r_s2p1(1) = sqrt(((x_s1(1) - x_s2(1))^2) + ((y_s1(1) - y_s2(1))^2));

%{
A(1) = 0;

theta1(1) = 0;
theta2(1) = 0;

%boolean for the first star
less_05_s1 = false;
more_05_s1 = false;
count_s1 = false;
cycles_s1 = 0;

%boolean for the second star
less_05_s2 = false;
more_05_s2 = false;
count_s2 = false;
cycles_s2 = 0;
%}

for i = 1:length(t)
    
    %find all the necessary radii
    r_s1s2(i) = sqrt(((x_s1(i) - x_s2(i))^2) + ((y_s1(i) - y_s2(i))^2));
    r_s1p1(i) = sqrt(((x_s1(i) - x_p1(i))^2) + ((y_s1(i) - y_p1(i))^2));
    r_s2p1(i) = sqrt(((x_s1(i) - x_p1(i))^2) + ((y_s1(i) - y_p1(i))^2));
    
    %Calculate stuff for the first star
    v_xs1(i+1) = v_xs1(i) - (((Ms1*4*pi^2)*x_s1(i))/((r_s1s2(i)^B)*r_s1s2(i)))*dt - (((Mp1*4*pi^2)*x_s1(i))/((r_s1p1(i)^B)*r_s1p1(i)))*dt;
    v_ys1(i+1) = v_ys1(i) - (((Ms1*4*pi^2)*y_s1(i))/((r_s1s2(i)^B)*r_s1s2(i)))*dt - (((Mp1*4*pi^2)*x_s1(i))/((r_s1p1(i)^B)*r_s1p1(i)))*dt;
    x_s1(i+1) = x_s1(i) + v_xs1(i+1)*dt;
    y_s1(i+1) = y_s1(i) + v_ys1(i+1)*dt;
    
    %calculate stuff for the second star
    
    v_xs2(i+1) = v_xs2(i) - (((Ms2*4*pi^2)*x_s2(i))/((r_s1s2(i)^B)*r_s1s2(i)))*dt - (((Mp1*4*pi^2)*x_s2(i))/((r_s2p1(i)^B)*r_s2p1(i)))*dt;
    v_ys2(i+1) = v_ys2(i) - (((Ms2*4*pi^2)*y_s2(i))/((r_s1s2(i)^B)*r_s1s2(i)))*dt - (((Mp1*4*pi^2)*x_s2(i))/((r_s2p1(i)^B)*r_s2p1(i)))*dt;
    x_s2(i+1) = x_s2(i) + v_xs2(i+1)*dt;
    y_s2(i+1) = y_s2(i) + v_ys2(i+1)*dt;
    
    %calculate stuff for the first planet
    v_xp1(i+1) = v_xp1(i) - (((Ms1*4*pi^2)*x_p1(i))/((r_s1p1(i)^B)*r_s1p1(i)))*dt - (((Ms2*4*pi^2)*x_p1(i))/((r_s2p1(i)^B)*r_s2p1(i)))*dt;
    v_yp1(i+1) = v_yp1(i) - (((Ms1*4*pi^2)*y_p1(i))/((r_s1p1(i)^B)*r_s1p1(i)))*dt - (((Ms2*4*pi^2)*x_p1(i))/((r_s2p1(i)^B)*r_s2p1(i)))*dt;
    x_p1(i+1) = x_p1(i) + v_xp1(i+1)*dt;
    y_p1(i+1) = y_p1(i) + v_yp1(i+1)*dt;
    
    
    %{
    theta1(i) = acos(x_s1(i)/r_s1s2(i));
    theta2(i) = acos(x_s2(i)/r_s1s2(i));
    
    %counting orbits for the first star
    if(theta1(i) < 0.5)
       less_05_s1 = true;
       more_05_s1 = false;
    end
    if(theta1(i) > 0.5)
        more_05_s1 = true;
        less_05_s1 = false;
        count_s1 = false;
    end
    
    if(~count_s1 && less_05_s1)
       cycles_s1 = cycles_s1 + 1; 
       count_s1 = true;
    end
    
      %counting orbits for the second star
    if(theta2(i) < 0.5)
       less_05_s2 = true;
       more_05_s2 = false;
    end
    if(theta1(i) > 0.5)
        more_05_s2 = true;
        less_05_s2 = false;
        count_s2 = false;
    end
    
    if(~count_s2 && less_05_s2)
       cycles_s2 = cycles_s2 + 1; 
       count_s2 = true;
    end
    %}
    
    %finding the area of the triangles created by each dt using Heron's
    %formula
    %{
    r_s1s2(i) = sqrt(x(i)^2 + y(i)^2);
    r(i+1) = sqrt(x(i+1)^2 + y(i+1)^2);
    a = r(i);
    b = r(i+1);
    c = sqrt((x(i+1)-x(i))^2 + (y(i+1)-y(i))^2);
    p = (r(i)+r(i+1)+c)/2;
    A(i) = sqrt(p*(p-a)*(p-b)*(p-c));
    %}
end

%{
% Calculate the variance of the areas created by the distance traveled by
% the orbit over some time interval

ave_A = mean(A);

for i=1:length(A)
   total_diff = (ave_A-A(i))^2;
   variance_A = total_diff/length(A);
   std_dev_A = sqrt(variance_A);
end

%Calculate the T^2/a^3 ratio;

%first star
T_s1 = ft/cycles_s1;
a_s1 = (1/2)*(min(r_s1s2)+max(r_s1s2));
K_3_s1 = T_s1^2/a_s1^3;


second star
T = ft/cycles_s2;
a = (1/2)*(min(r_s1s2)+max(r_s1s2));
K_3 = T^2/a^3;

%}

%plot the things
n = 40*m_f*pm_f;
m = n;

scatter(x_s1, y_s1, dot_size,'r');
hold on;
scatter(x_s2, y_s2, dot_size,'b');
hold on;
scatter(x_p1, y_p1, planet_dot_size,'g');
hold on;

% x = 0;
% y = 0;
% plot(x,y,'ro');
title('Orbital Motion, Binary Stars, Vyi_s1 = 1.75*pi, Vyi_s2 = -1.8*pi, dt = 0.01');
axis([-60, 60,-60,60]);
xlabel('X (AU)');
ylabel('Y (AU)');

%to add text into the graph
%{
txt1 = -n+0.5;
txt2 = -m+0.5;
T_constant = num2str(K_3);
T_graph = strcat('(T^2)/(a^3)',T_constant);
text(txt1,txt2,T_graph);
%}

%send results to the console
%disp(std_dev_A);
%disp(cycles);
%disp(K_3);
