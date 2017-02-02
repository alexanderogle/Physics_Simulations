% find the position and average position squared of 1D random walkers

clear all
% total number of steps (in time) = nsteps
nsteps = 1000;
step = [1:1:nsteps];

% total number of random walkers = nwalkers
nwalkers = 500;
% initialize variables
r = 0.0;
x2=0.0;
for i = 1:nsteps
    x2a(i)=0.0;
    for j=1:nwalkers
    x(i,j)=0.0;
    end;
end;    

% perform random walk, find positions at each step,
% calculate the average of position squared for the group
for i = 2:nsteps
    x2=0.0;
    for j=1:nwalkers
    r=rand;
    if (r<0.5) 
        x(i,j) = x(i-1,j)-1.0;
    else
        x(i,j) = x(i-1,j)+1.0;
    end;            
    x2=x2+(x(i,j)).^2;    %add up all of the x^2 of each walker        
    end;
    x2a(i)=x2/nwalkers;
end;    
    
% plot data
subplot(2,1,1); plot(step, x2a, 'ks')
subplot(2,1,2); plot(step,x(:,2),'r+')
hold on
plot(step,x(:,100),'b+')
xlabel('time t');
ylabel('displacement (x)');
plot(step,x(:,266),'g+')

