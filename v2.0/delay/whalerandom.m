%Random
%Whale Group at MTBI
%created by Ivan E. Cao-Berg
%"And you take YOUR LIFE in your hands.
%And what happens?
%SOMETHING TERRIBLE!!!!
%No one else to blame.
%-Erica Jong

%This function creates a population proportion plot for each cycle and another plot of population sizes of those cycles
function whalerandom( espilon, mux, muy, muj, px0, x0, y0, c )

if nargin == 0
     %For the parameters
     option = input( 'Do you want to work with fin whales (1), with right whales (2) or another whale (3)? : ' )
     if option == 1
         betax = 0.5;
         betay = 0.5;
         mux = 0.925;
         muy = 0.94;
         muj = 0.957;
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
epsilon = input('Please type the value for epsilon ( no noise -> epsilon = 0 ) :')
experiment = input('How many times do you wish to run this experiment? :')

%Number of iterations = numbers of generations
c = input('For how many generations do you want to run the simulation? :')

k = input('Please type the value for the delay :' )
end

%Zero matrixes for reserving space in memory
x = zeros(1,c);
y = zeros(1,c);
px = zeros(1,c);
time = zeros(1,c);
propx = zeros(1,c);
propy = zeros(1,c);
propp = zeros(1,c);

for counter = 1 : experiment
%Initial Conditions = First Generation
x(k+1)=rand;
y(k+1)=rand;
px(1)=rand;
for delay = 2 : k
    px(delay) = rand;
end

    
%Recursion Formula
for t = 12:c %Counter for number of generations
    x(t) = x_f( epsilon, betax, mux, muj, muy, x(t-1), y(t-1), px(t-1), px(t-k), k ); 
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-k) );
    px(t) = px_f( epsilon, muj, mux, muy, x(t-1), y(t-1));
    propx(t) = ppx( x(t-1), y(t-1), px(t-1));
    propy(t) = ppy( x(t-1), y(t-1), px(t-1));
    propp(t) = ppp( x(t-1), y(t-1), px(t-1));
end

subplot(1,2,1)
hold on
plot(x,'r-.')
plot(y,'m:')
plot(px,'g-')
xlabel('Time')
ylabel('Whale Population')
hold off

subplot(1,2,2)
hold on
plot(propx,'r-.')
plot(propy,'m:')
plot(propp,'g-')
xlabel('Time')
ylabel('Whale Population Proportion')
hold off
end