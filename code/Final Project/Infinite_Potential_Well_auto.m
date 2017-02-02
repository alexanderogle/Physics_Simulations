%%Chapter 10.2: One Dimension - Shooting and Matching Methods
clear all;

prompt = {'Initial Energy Guess:','minimum dE:'};
dlg_title = 'Input';
num_lines = 1;
def = {'10','0.00001'};
input = inputdlg(prompt,dlg_title,num_lines,def)';

V_max = 1000;

N = 100; %number of the spatial grids
dx = 0.01; %size of the spatial grids
x = (dx:dx:N*dx);

%Initial guess for the increment dE
color = 'm';
E = str2double(input(1));
dE = 0.5*E;
min_dE = str2double(input(2));
%cutoff parameter
b = 1.5;
keep_going = true;

%Wave Amplitude
L = (0.5*length(x)*dx);
A = L^(-0.5);

%colors for graphing
c = ['r','g','b','y','m','k'];

%Generate the potential for the "infinite" potential well
V = zeros(1,length(x));
V(1) = V_max;
V(length(x)) = V_max;

%Settings for an even parity solution

last_diverge = 0;

%Find the solutions for even energy levels




while (abs(dE) > min_dE && keep_going);

%initial conditions    
Psi_x(1) = 1;
Psi_x(2) = 1;

%calculate the wave equation

    for j = 2:N-1
   
%     if(mod(n,2) == 0)    
%     k = ((n*pi)/L);
%     Psi_x(j) = A*sin(k*x(j));
%     end
%     if(mod(n,2) == 1)
%     k = (((2*n-1)*pi)/(2*L));
%     Psi_x(j) = A*cos(k*x(j));
%     end

    Psi_x(j+1) = 2*Psi_x(j) - Psi_x(j-1) - 2*(E-V(j))*(dx^2)*Psi_x(j);
    
        if(abs(Psi_x(j+1)) > b);
            %assume P_x is diverging
            j = (N);
        end
     
    end

    if(sign(Psi_x(end))~=sign(last_diverge));
    dE = -0.5*dE; 
    end
    E = E + dE;
    last_diverge = sign(Psi_x(end));
    disp(dE);
    
end

%now we need to mirror the shooting solution for the wave to the other side
%as well
Psi_x_right = Psi_x;
for i = 1:length(Psi_x)
    x_left(i) = -(x(end+1-i));
    Psi_x_left(i) = Psi_x_right(end+1-i);
end
%Then we put it into a single array
Psi_x_total = [Psi_x_left, Psi_x_right];
x_total = [x_left, x];


plot(x_total,Psi_x_total,color);
hold on;
xlabel('Distance')
ylabel('Wavefunction')
axis([-(0.2*N*dx+N*dx) (0.2*N*dx+N*dx) -2 2]);
disp(E);


