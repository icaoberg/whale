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
epsilon = input('Please type the value for epsilon ( no noise -> epsilon = 0 ) :')
experiment = input('How many times do you wish to run this experiment? :')

%Number of iterations = numbers of generations
c = input('For how many generations do you want to run the simulation? :')
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
x(1)=rand;
y(1)=rand;
px(1)=rand;

%Recursion Formula
for t = 2:c %Counter for number of generations
    x(t) = x_f( betax, mux, muy, x(t-1), y(t-1), px(t-1) ); 
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-1) );
    px(t) = px_f( epsilon, mux, muy, x(t-1), y(t-1));
    propx(t) = ppx( x(t-1), y(t-1), px(t-1) );
    propy(t) = ppy( x(t-1), y(t-1), px(t-1) );
    propp(t) = ppp( x(t-1), y(t-1), px(t-1) );
    time(t) = t-1; 
end

figure(1)
%Divides the plot into four subplots
%First subplot : Time vs. Proportion of Single Females
subplot(2,2,1)
plot(time,propx,'r-.o')
xlabel('Time')
ylabel('Single Females')
legend([num2str(propx(c-1))])

%Second subplot : Time vs. Proportion of Single Males
subplot(2,2,2)
plot(time,propy,'m:v')
xlabel('Time')
ylabel('Single Males')
legend([num2str(propy(c-1))])

%Third subplot : Time vs. Proportion of Paired Females
subplot(2,2,3)
plot(time,propp,'g-^')
xlabel('Time')
ylabel('Paired females')
legend([num2str(propp(c-1))])

%Fourth subplot :  : Time vs. Whale Population Size
subplot(2,2,4)
hold on
plot(time,x,'r-.o')
plot(time,y,'m:v')
plot(time,px,'g-^')
xlabel('Time')
ylabel('Whale Population')
hold off

figure(2)
%Divides the plot into four subplots
%First subplot : Time vs. Population Size of Single Females
subplot(2,2,1)
plot(time,x,'r-.o')
xlabel('Time')
ylabel('Single Females')

%Second subplot : Time vs. Population Size of Single Males
subplot(2,2,2)
plot(time,y,'m:v')
xlabel('Time')
ylabel('Single Males')

%Third subplot : Time vs. Population Size of Paired Females
subplot(2,2,3)
plot(time,px,'g-^')
xlabel('Time')
ylabel('Paired females')

%Fourth subplot : Time vs. Whale Population Proportion
subplot(2,2,4)
hold on
plot(time,propx,'r-.o')
plot(time,propy,'m:v')
plot(time,propp,'g-^')
xlabel('Time')
ylabel('Whale Population Proportion')
hold off
end