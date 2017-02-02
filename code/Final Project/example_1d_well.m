clear all;

N = 200;
delta_x = 0.01;
E_initial = 1.879;
delta_E = 0.1;
x = (delta_x:delta_x:N*delta_x);

%create half the potential well

V = zeros(1,N);
V(100:N) = 1000;


b = 1.5;
last_diverge = 0;

minimum_delta_E = 0.005;

E = E_initial;

while (abs(delta_E)>minimum_delta_E);
    psi = zeros(1,N);
    psi(1) = 1;
    psi(2) = 1;
    
    [psi,i] = calculate_psi(psi,N,delta_x,E,b,V);
    
    plot(x,psi,'r');
    title('Square Well');
    axis([0 2 -2 2]);
    xlabel('Distance');
    ylabel('Wavefunction');
    
end
    