%% Begin Simulation

%clear everything before beginning the run
clear all

%Politely ask user which simulation they would like to run
prompt = {'Run 1.1 Simulation? (1=yes, 0=no)','Run 1.2 Simulation? (1=yes, 0=no)','Run 1.4 Simulation? (1=yes, 0=no)','Run 1.5 Simulation? (1=yes, 0=no)'};
dlg_title = 'Input';
num_lines = 1;
def = {'0','0','0','1'};
begin = inputdlg(prompt,dlg_title,num_lines,def);

for i = 1:length(begin)
    if(str2double(begin(i)) == 1)
       run(i) = 1; 
    else
       run(i) = 0;
    end
end

run1_1 = run(1);
run1_2 = run(2);
run1_4 = run(3);
run1_5 = run(4);

%% Problem 1.1
if(run1_1)

%Request information from user
prompt = {'Step size? (dx):','dx/dt:','Offset?'};
dlg_title = 'Input';
num_lines = 1;
def = {'0.1','5','0'};
answer = inputdlg(prompt,dlg_title,num_lines,def);

% define the step size
dx = str2double(answer(1));

%initialize array of x values
x = (0.0:dx:10);

%define dydx
dydx = str2double(answer(2));

%define the offset 
c = str2double(answer(3));

%begin Euler's method for calculation, store in new array
for i = 1:length(x)
    %define initial conditions, initialize y array
    if(i == 1)
       a(i) = 0.0 + c; 
    else
    a(i) = a(i-1)-dydx*dx + c;
    end
end

clc
disp('Simulation 1.1 completed.')

plot(x,a,'+');
hold on
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Velocity of Free Falling Object')

end

%% Problem 1.2
if(run1_2)


%Request information from user
prompt = {'Step size? (dx):','dx/dt:','Offset?'};
dlg_title = 'Input';
num_lines = 1;
def = {'0.1','5','0'};
answer = inputdlg(prompt,dlg_title,num_lines,def);

% define the step size
dx = str2double(answer(1));

%initialize array of x values
x = (0.0:dx:10);

%define dydx
dydx = str2double(answer(2));

%define the offset 
c = str2double(answer(3));

%begin Euler's method for calculation, store in new array
for i = 1:length(x)
    %define initial conditions, initialize y array
    if(i == 1)
       a(i) = 0.0 + c; 
    else
    a(i) = a(i-1)+dydx*dx + c;
    end
end

clc
disp('Simulation 1.2 completed.')

clf
plot(x,a,'+');
hold on
xlabel('Time (s)')
ylabel('Position (m/s)')
title('Object With Constant Velocity')

end

%% Problem 1.4

if(run1_4)    

%Request information from user
prompt = {'Step size? (dt):','dNa/dt:','dNb/dt','Initial # of A  Isotopes','Decay Rate of A?','Initial # of B  Isotopes','Decay Rate of B?','Total Time?'};
dlg_title = 'Input';
num_lines = 1;
def = {'0.1','5','5','15e2','12.56','2e2','22.72','100'};
answer = inputdlg(prompt,dlg_title,num_lines,def);

%Define initial variables
dt = str2double(answer(1)); %step size
dnadt = str2double(answer(2)); %rate of change for A isotopes
dnbdt = str2double(answer(3)); %rate of change for B isotopes
Na = str2double(answer(4)); %number of initial A isotopes
ta = str2double(answer(5)); %decay rate of A
Nb = str2double(answer(6)); %number of initial B isotopes
tb = str2double(answer(7)); %decay rate of B
ft = str2double(answer(8)); %total simulated time

%Create an array for the time variable (independent variable)
t = (0.0:dt:ft);

%Loop for calculating the decay of alpha particle
for i = 1:length(t)
    %define initial conditions, initialize y array
    if(i == 1)
       a(i) = Na; 
       b(i) = Nb;
       dnadt = -Na/ta;
       dnbdt = -Nb/tb;
    else
        %calculate the number of isotopes after next dt
        a(i) = a(i-1)+dnadt*dt;
        dnadt = -a(i)/ta;  
    
        %calculate the number of isotopes after next dt
        b(i) = b(i-1)+dnbdt*dt;
        dnbdt = a(i)/ta - b(i)/tb;
    end
end

clc
disp('Simulation 1.4 completed.');

clf
plot(t,a,'ok');
hold on;
plot(t,b,'xr');
hold on;
legend('A','B')
xlabel('Time (s)')
ylabel('Nuclei Population (n)')
title('Decaying System of Radioactive Nuclei')

end

%% Simulation 1.5

if(run1_5)

%This simulation is very similar to 1.4, except the system is more
%representative of a resonance between two states, A and B.
    
%Request information from user
prompt = {'Step size? (dt):','dNa/dt:','dNb/dt','Initial # of A  Isotopes','Decay Rate of A?','Initial # of B  Isotopes','Decay Rate of B?','Total Time?'};
dlg_title = 'Input';
num_lines = 1;
def = {'0.5','0','0','15e5','10','12.2e4','12.56','75'};
answer = inputdlg(prompt,dlg_title,num_lines,def);

%Define initial variables
dt = str2double(answer(1)); %step size
dnadt = str2double(answer(2)); %rate of change for A isotopes
dnbdt = str2double(answer(3)); %rate of change for B isotopes
Na = str2double(answer(4)); %number of initial A isotopes
ta = str2double(answer(5)); %decay rate of A
Nb = str2double(answer(6)); %number of initial B isotopes
tb = str2double(answer(7)); %decay rate of B
ft = str2double(answer(8)); %total simulated time

%Create an array for the time variable (independent variable)
t = (0.0:dt:ft);

%Loop for calculating the decay of alpha particle
for i = 1:length(t-1)
    %define initial conditions, initialize a and b array
    if(i == 1)
       a(1) = Na; 
       b(1) = Nb;
       dnadt = Na/ta;
       dnbdt = Nb/tb;
       tN(1) = Na + Nb;
    else
        %calculate the rates of change after next dt
        dnadt = a(i-1)/ta; 
        dnbdt = b(i-1)/tb;
        
        %calculate the number of isotopes after next dt
        a(i) = a(i-1) - dnadt*dt + dnbdt*dt;
        b(i) = b(i-1) - dnbdt*dt + dnadt*dt;
        
        %create array that counts total particles over time
        %This can be plotted to ensure the "conservation of particles" 
        %in this closed system.
        tN(i) = a(i) + b(i);      
    end
end

clc
disp('Simulation 1.5 completed.');

clf
plot(t,a,'+r');
hold on;
plot(t,b,'*b');
hold on;
legend('A','B')
xlabel('Time (s)')
ylabel('Nuclei Population (n)')
title('Dampened System of Mutually Decaying Nuclei')
end

%% No Simulation Selected Error Message

%Tells the user that no simulation was selected. Will make message more
%sassy at a later date.
if(~run1_1 && ~run1_2 && ~run1_4 && ~run1_5)
    disp('Error occured with running simulation; No simulation was selected to be run');
end
    