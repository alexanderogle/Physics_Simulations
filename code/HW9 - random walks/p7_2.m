% find the position and average position squared of 1D random walkers

clear all
% total number of steps (in time) = nsteps
nsteps = 3000;
dx = 1;
step = [1:dx:nsteps];

% total number of random walkers = nwalkers
nwalkers = 100;
% initialize variables
r = 0.0;

%for the x dimension
x2=0.0;
for i = 1:nsteps
    x2a(i)=0.0;
    for j=1:nwalkers
    x(i,j)=0.0;
    end;
end;    

%for the y dimension 
y2=0.0;
for i = 1:nsteps
    y2a(i)=0.0;
    for j=1:nwalkers
    y(i,j)=0.0;
    end;
end;   

%for the z dimension 
z2=0.0;
for i = 1:nsteps
    z2a(i)=0.0;
    for j=1:nwalkers
    z(i,j)=0.0;
    end;
end;   

% perform random walk, find positions at each step,
% calculate the average of position squared for the group

%for x
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
    

%for y
for i = 2:nsteps
    y2=0.0;
    for j=1:nwalkers
    r=rand;
    if (r<0.5) 
        y(i,j) = y(i-1,j)-1.0;
    else
        y(i,j) = y(i-1,j)+1.0;
    end;            
    y2=y2+(y(i,j)).^2;    %add up all of the x^2 of each walker        
    end;
    y2a(i)=y2/nwalkers;
end;    

%for z
for i = 2:nsteps
    z2=0.0;
    for j=1:nwalkers
    r=rand;
    if (r<0.5) 
        z(i,j) = z(i-1,j)-1.0;
    else
        z(i,j) = z(i-1,j)+1.0;
    end;            
    z2=z2+(z(i,j)).^2;    %add up all of the x^2 of each walker        
    end;
    z2a(i)=z2/nwalkers;
end;  

for i = 1:nsteps
    r2a(i) = sqrt(x2a(i)^2 + y2a(i)^2 + z2a(i)^2);
end

subplot(2,1,1); plot(step, r2a, 'ks');
subplot(2,1,2);
for i = 1:nwalkers
    scatter3(x(:,i),y(:,i),z(:,i));
    hold on;
end
axis([-100 100 -100 100 -100 100]);
% % plot x data
% subplot(6,1,1); plot(step, x2a, 'ks')
% subplot(6,1,2); plot(step,x(:,2),'r+')
% hold on
% plot(step,x(:,100),'b+')
% xlabel('time t');
% ylabel('displacement (x)');
% plot(step,x(:,266),'g+')
% 
% %plot the y data
% subplot(6,1,3); plot(step, x2a, 'ks')
% subplot(6,1,4); plot(step,x(:,2),'r+')
% hold on
% plot(step,x(:,100),'b+')
% xlabel('time t');
% ylabel('displacement (x)');
% plot(step,x(:,266),'g+')
% 
% %plot the z data
% subplot(6,1,5); plot(step, x2a, 'ks')
% subplot(6,1,6); plot(step,x(:,2),'r+')
% hold on
% plot(step,x(:,100),'b+')
% xlabel('time t');
% ylabel('displacement (x)');
% plot(step,x(:,266),'g+')

