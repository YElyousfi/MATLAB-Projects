function[]=slope_field(h)
% 
% This function draws the slope field of
% dx/dt = 2*pi*x-4*pi*y
% dy/dt = 2*pi*x-2*pi*y
% 
% It also plots the Euler's approximation of the specific system with
% initial values included.


values=[-2:h:2]; %x and y domain
A=[2*pi -4*pi;2*pi -2*pi];

hold on
for i=1:length(values)
    for j=1:length(values)
        dY = A*[values(i);values(j)];
        unitV = dY/sqrt(dY(1)^2+dY(2)^2);
        plotV = (2*h/3)*unitV;
        plot([values(i),values(i)+plotV(1)],...
            [values(j),values(j)+plotV(2)],'k');       
    end
end

func1 = '2*pi*x-4*pi*y';
func2 = '2*pi*x-2*pi*y';

colors = ['r' 'b'];

hold on
for i=2:3 %this approximates using h^2 and h^3
    t1=[0:h^i:1];
    x_points = [];
    y_points = [];
    x_points(1)=1;
    y_points(1)=0;
    x=1;
    y=0;
    for j=2:1:length(t1)   
        yk=y+h^i*eval(func2); 
        xk=x+h^i*eval(func1);
        x=xk;
        y=yk;
        x_points(j)=xk; 
        y_points(j)=yk;
    end
    
    plot(x_points,y_points,colors(i-1));

end
end