function [Error]=euler(func1,func2,h,a,b,iVX,iVY)

% func is the function as a string
%h is the delta t
%a and b are the start and endpoints of the interval
%iV is the initial value

%The example I used : euler('2*x-1.2*x*y','-y+1.2*x*y',0.5,0,2,1.75,1)

t=[a:h:b];
x_points = [];
y_points = [];
x_points(1)=iVX;
y_points(1)=iVY;
x=iVX;
y=iVY;

for i=2:1:length(t)   %i=h:h:b
    yk=y+h*eval(func2); 
    xk=x+h*eval(func1);
    x=xk;
    y=yk;
    x_points(i)=xk; 
    y_points(i)=yk;
end

plot(x_points,y_points,'b');

end