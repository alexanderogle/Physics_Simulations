function[psi,i] = calculate_psi(psi,N,delta_x,E,b,V)
%This function calculates psi
%Make psi_prime(0) = 0 for an even parity solution

for i=2:N-1;
    psi(i+1)=2*psi(i)-psi(i-1)-2*(E(V(i))*delta_x^2*psi(i);
    if abs(psi(i+1)) > b %if psi is diverging, exit the loop;
        return
    end
end