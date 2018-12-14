%Whale Group at MTBI
%created by Ivan E. Cao-Berg
%"And you take YOUR LIFE in your hands.
%And what happens?
%SOMETHING TERRIBLE!!!!
%No one else to blame.
%-Erica Jong

%This program generates individuals proportions plots with noise for single males

function noisepopdad(epsilon1,epsilon2,epsilon3,px0,x0,y0,c)

%Inputs for constants
mux = 0.925
muy = 0.94
muj = 0.94
betax = 0.5
betay = 0.5

if nargin == 0
%Noise
epsilon1 = input('Please type the value for epsilon(magenta) :')
epsilon2 = input('Please type the value for epsilon(green) :')
epsilon3 = input('Please type the value for epsilon(cyan) :')
%Initial Conditions
px0 = input('Please type the value for P_0 :')
x0 = input('Please type the value for x_0 :')
y0 = input('Please type the value for y_0 :')
%Number of iterations = numbers of generations
c = input('For how many generations do you want to run the simulation? :')
end

%Zero matrixes, they reserve the space for the variables
%For the first set of equations
x = zeros(1,c);
y = zeros(1,c);
px = zeros(1,c);
propx = zeros(1,c);
propy = zeros(1,c);
propp = zeros(1,c);

%For the first set of equations
x1 = zeros(1,c);
y1 = zeros(1,c);
px1 = zeros(1,c);
propx1 = zeros(1,c);
propy1 = zeros(1,c);
propp1 = zeros(1,c);

%For the first set of equations
x2 = zeros(1,c);
y2 = zeros(1,c);
px2 = zeros(1,c);
propx2 = zeros(1,c);
propy2 = zeros(1,c);
propp2 = zeros(1,c);

%For the first set of equations
x3 = zeros(1,c);
y3 = zeros(1,c);
px3 = zeros(1,c);
propx3 = zeros(1,c);
propy3 = zeros(1,c);
propp3 = zeros(1,c);

%Initial Conditions
%For the first set of equations
x(1)=x0;
y(1)=y0;
px(1)=px0;

%For the first set of equations
x1(1)=x0;
y1(1)=y0;
px1(1)=px0;

%For the first set of equations
x2(1)=x0;
y2(1)=y0;
px2(1)=px0;

%For the first set of equations
x3(1)=x0;
y3(1)=y0;
px3(1)=px0;


for t = 2:c %Counter for number of generations
    %First set of equations without noise
    px(t) = px_f( mux, muy, x(t-1), y(t-1));
    x(t) = x_f( betax, mux, muy, x(t-1), y(t-1), px(t-1));  
    y(t) = y_f( betay, mux, muy, y(t-1));
    propx(t) = ppx( x(t-1), y(t-1), px(t-1) );
    propy(t) = ppy( x(t-1), y(t-1), px(t-1) );
    propp(t) = ppp( x(t-1), y(t-1), px(t-1) );  
    
    %Second set of equations with noise    
    px1(t) = px_fnoise( epsilon1, mux, muy, x1(t-1), y1(t-1) );
    x1(t) = x_f( betax, mux, muy, x1(t-1), y1(t-1), px1(t-1) );  
    y1(t) = y_f( betay, mux, muy, px1(t-1), y1(t-1) );
    propx(t) = ppx( x1(t-1), y1(t-1), px1(t-1) );
    propy(t) = ppy( x1(t-1), y1(t-1), px1(t-1) );
    propp(t) = ppp( x1(t-1), y1(t-1), px1(t-1) );
    
    %Third set of equations with noise    
    px2(t) = px_fnoise( epsilon2, mux, muy, x2(t-1), y2(t-1) );   
    x2(t) = x_f( betax, mux, muy, x2(t-1), y2(t-1), px2(t-1) );  
    y2(t) = y_f( betay, mux, muy, px2(t-1), y2(t-1) );
    propx(t) = ppx( x2(t-1), y2(t-1), px2(t-1) );
    propy(t) = ppy( x2(t-1), y2(t-1), px2(t-1) );
    propp(t) = ppp( x2(t-1), y2(t-1), px2(t-1) );
        
    %Fourth set of equations with noise
    px3(t) = px_fnoise( epsilon3, mux, muy, x3(t-1), y3(t-1) );   
    x3(t) = x_f( betax, mux, muy, x3(t-1), y3(t-1), px3(t-1) );  
    y3(t) = y_f( betay, mux, muy, y3(t-1), px3(t-1) );
    propx(t) = ppx( x3(t-1), y3(t-1), px3(t-1) );
    propy(t) = ppy( x3(t-1), y3(t-1), px3(t-1) );
    propp(t) = ppp( x3(t-1), y3(t-1), px3(t-1) );
    
    %Time Vector
    time(t)=t-1;
end

%Divides the plot into four parts
%First subplot
subplot(2,2,1)
hold on
plot(time,y,'ro:');
plot(time,y1,'mx:');
plot(time,y2,'g+:');
plot(time,y3,'cs:');
xlabel('Time');
ylabel('Single males');
title(['Single males.'])
legend('epsilon=0', 'epsilon1', 'epsilon2', 'epsilon3')
hold off

%Second subplot
subplot(2,2,2)
hold on
plot(time,x,'ro:');
plot(time,x1,'mx:');
plot(time,x2,'g+:');
plot(time,x3,'cs:');
xlabel('Time');
ylabel('Single females');
title(['Single females.'])
legend('epsilon=0', 'epsilon1', 'epsilon2', 'epsilon3')
hold off

%Third subplot
subplot(2,2,3)
hold on
plot(time,px,'ro:');
plot(time,px1,'mx:');
plot(time,px2,'g+:');
plot(time,px3,'cs:');
xlabel('Time');
ylabel('Paired females');
title(['Paired females.'])
legend('epsilon=0', 'epsilon1', 'epsilon2', 'epsilon3')
hold off

%Fourth subplot
subplot(2,2,4)
hold on
plot(time,propp,'ro:');
plot(time,propp1,'mx:');
plot(time,propp2,'g+:');
plot(time,propp3,'cs:');
xlabel('Time');
ylabel('Paired females');
title(['Proportion of Paired females'])
legend('epsilon=0', 'epsilon1', 'epsilon2', 'epsilon3')
hold off









