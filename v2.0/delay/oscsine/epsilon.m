%Prints out epsilon vs population proportion
%Whale Group at MTBI
%created by Ivan E. Cao-Berg
%"And you take YOUR LIFE in your hands.
%And what happens?
%SOMETHING TERRIBLE!!!!
%No one else to blame.
%-Erica Jong

function epsilon( betax, betay, muj, mux, muy, px0, x0, y0, c, step )

if nargin == 0
    option = input( 'Do you want to work with fin whales (1), with right whales (2) or another whale (3)? : ' )
    if option == 1
         betax = 0.5;
         betay = 0.5;
         mux = 0.955;
         muy = 0.965;
         muj = 0.96;
    end
    if option == 2
         betax = 0.5;
         betay = 0.5;
         mux = 0.925;
         muy = 0.94;
         muj = 0.957;
    end
    if option == 3
         betax = input( 'Please input a value for betax :' );
         betay = input( 'Please input a value for betay :' );
         mux = input( 'Please input a value for mux :' );
         muy = input( 'Please input a value for muy :' );
         muj = input( 'Please input a value for muj :' );
    end
%Number of iterations = numbers of generations
c = input('Please type the number of generations you wish to run :')
k = input('Please type the value for the delay :' )
step = input('Please type the step size for the epsilon interval (0 < step <= 1) :')

while k > c
    c = input(' WARNING! k !> c. Please type the numbers of generations you wish to run :')
    k = input('Please type the value for the delay. ')
end
end

%Zero matrixes for reserving space in memory
x = zeros(1,c);
y = zeros(1,c);
px = zeros(1,c);
time = zeros(1,c);
propx = zeros(1,c);
propy = zeros(1,c);
propp = zeros(1,c);
epsilonx = zeros(1,1/step);
epsilony = zeros(1,1/step);
epsilonpx = zeros(1,1/step);
epsilong = 0 : step : 1;

%Initial Conditions
px0 = input('Please type the value for P_0 :')
x0 = input('Please type the value for x_0 :')
y0 = input('Please type the value for y_0 :')

%Initial Conditions
x(k+1)=x0;
y(k+1)=y0;
px(1)=px0;
counter=0;

%Options
option = input('Do you want p(0)=p(1)=p(2)...=p(k)? Yes=1 No=0 : ')
if option == 1 
    for delay = 2 : k
    px(delay)=px0;
    end
end

if option == 0
    for delay = 2 : k
    px(delay) = input('Please type the value for px() : ');
    end
end

for epsilon = 0:step:1
%Recursion Formula
for t = k+2:c %Counter for number of generations
    x(t) = x_foscsine( epsilon, betax, mux, muj, muy, x(t-1), y(t-1), px(t-1), px(t-k), k, t ); 
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-k) );
    px(t) = px_foscsine( epsilon, muj, mux, muy, x(t-1), y(t-1), t );
    propx(t) = ppx( x(t-1), y(t-1), px(t-1));
    propy(t) = ppy( x(t-1), y(t-1), px(t-1));
    propp(t) = ppp( x(t-1), y(t-1), px(t-1));
end
%counter = 1:1/step;
counter=counter+1;
epsilonx( counter ) = propx(c);
epsilony( counter ) = propy(c);
epsilonpx( counter ) = propp(c);
end

%Plots epsilon through time
hold on
plot(epsilong, epsilonx,'g-.')
plot(epsilong, epsilony,'m:')
plot(epsilong, epsilonpx,'c-')
xlabel('Epsilon')
ylabel('Proportion')
title(['Epsilon vs Population Proportions with an epsilon step of = ' num2str(step) ' for ' num2str(c) ' generations.'])
legend('Single Females','Single Males', 'Paired Females')
hold off