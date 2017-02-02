clear all

dx = 0.0001*pi;
fx = 6*pi;

ft = 25*pi;
dt = (dx*ft)/(fx);

t = [0:dt:ft];
x = [0:dx:fx];

%Initialize video object
writerObj = VideoWriter('waves_6.avi');
open(writerObj);

for j = 1:length(t)
    T = t(j);
for i = 1:length(x)
    
   Px(i) = sin(x(i));
   P_t(i) = cos(x(i) + t(j)*1000);
   
   P_r(i) = Px(i) + P_t(i);
end
   plot(t,P_r,'g');
   axis([0,80,-10,10]);
   F(j) = getframe;
   writeVideo(writerObj,F(j));
end

close(writerObj);