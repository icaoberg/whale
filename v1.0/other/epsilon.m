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
    %Initial Conditions
    px0 = input('Please type the value for P_0 :')
    x0 = input('Please type the value for x_0 :')
    y0 = input('Please type the value for y_0 :')
    step = input('Please type the step size for the epsilon interval (0 < step <= 1) :')
    c = input('Please type the number of generations you wish to run :')
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

%Initial Conditions
x(1)=x0;
y(1)=y0;
px(1)=px0;
counter=0;

for epsilon = 0:step:1
%Recursion Formula
for t = 2:c %Counter for number of generations
    x(t) = x_f( betax, mux, muy, x(t-1), y(t-1), px(t-1) );
    y(t) = y_f( betax, mux, muy, y(t-1), px(t-1) );
    px(t) = px_f( epsilon, mux, muy, x(t-1), y(t-1) );
    propx(t) = ppx( x(t-1), y(t-1), px(t-1) );
    propy(t) = ppy( x(t-1), y(t-1), px(t-1) );
    propp(t) = ppp( x(t-1), y(t-1), px(t-1) );
end
%counter = 1:1/step;
counter=counter+1;
epsilonx( counter ) = propx(c);
epsilony( counter ) = propy(c);
epsilonpx( counter ) = propp(c);
end

%Plots epsilon through time
hold on
plot(epsilonx,'xg:')
plot(epsilony,'om:')
plot(epsilonpx,'vc:')
title(['Epsilon vs Population Proportions with an epsilon step of = ' num2str(step) ' for ' num2str(c) ' generations.'])
legend('Single Females','Single Males', 'Paired Females')
orient tall
hold off