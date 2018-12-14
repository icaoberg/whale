%Whale Group at MTBI
%created by Ivan E. Cao-Berg

%This function creates a population proportion plot for each cycle and another plot of population sizes of those cycles
function whaleosc2( epsilon, muj, mux, muy, px0, x0, y0, k )

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

%Initial Conditions
epsilon = input('Please type the value for epsilon ( no noise -> epsilon = 0 ) :')
px0 = input('Please type the value for P_0 :')
x0 = input('Please type the value for x_0 :')
y0 = input('Please type the value for y_0 :')
k = input('Please type the value for the delay :' )

%Options
option = input('Do you want p(0)=p(1)=p(2)...=p(k)? Yes=1 No=0 : ')
if option == 1 
    for delay = 1 : k
    px(delay)=px0;
    end
end

if option == 0
    for delay = 2 : k
    px(delay) = input('Please type the value for px() : ');
    end
end

%Initial Conditions = First Generation
x(k+1)=x0;
y(k+1)=y0;
px(1)=px0;

%Recursion Formula
for t = 12:c %Counter for number of generations
    x(t) = x_foscsine( epsilon, betax, mux, muj, muy, x(t-1), y(t-1), px(t-1), px(t-k), k, t); 
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-k) );
    px(t) = px_f( epsilon, muj, mux, muy, x(t-1), y(t-1));
    propx(t) = ppx( x(t-1), y(t-1), px(t-1));
    propy(t) = ppy( x(t-1), y(t-1), px(t-1));
    propp(t) = ppp( x(t-1), y(t-1), px(t-1));
end

%%%%%%%%%%%%%%%%%%%
% Figure Number 1 %
%%%%%%%%%%%%%%%%%%%
%Divides the plot into four subplots
%First subplot : Time vs. Proportion of Single Females
figure(1)
subplot(2,2,1)
plot(propx,'r-.')
xlabel('Time')
ylabel('Single Females')
title(['Population of ... with perturbation on the single female class of  ' num2str(epsilon) '.'])
legend([num2str(propx(c-1))])

%Second subplot : Time vs. Proportion of Single Males
subplot(2,2,2)
plot(propy,'m:')
xlabel('Time')
ylabel('Single Males')
legend([num2str(propy(c-1))])

%Third subplot : Time vs. Proportion of Paired Females
subplot(2,2,3)
plot(propp,'g-')
xlabel('Time')
ylabel('Paired females')
legend([num2str(propp(c-1))])

%Fourth subplot :  : Time vs. Whale Population Size
subplot(2,2,4)
hold on
plot(x,'r-.')
plot(y,'m:')
plot(px,'g-')
xlabel('Time')
ylabel('Whale Population')
hold off

%%%%%%%%%%%%%%%%%%%
% Figure Number 2 %
%%%%%%%%%%%%%%%%%%%
%Divides the plot into four subplots
%First subplot : Time vs. Population Size of Single Females
figure(2)
subplot(2,2,1)
plot(x,'r-.')
xlabel('Time')
ylabel('Single Females')
title(['Population of ... with perturbation on the single female class of  ' num2str(epsilon) '.'])

%Second subplot : Time vs. Population Size of Single Males
subplot(2,2,2)
plot(y,'m:')
xlabel('Time')
ylabel('Single Males')

%Third subplot : Time vs. Population Size of Paired Females
subplot(2,2,3)
plot(px,'g-')
xlabel('Time')
ylabel('Paired females')

%Fourth subplot : Time vs. Whale Population Proportion
subplot(2,2,4)
hold on
plot(propx,'r-.')
plot(propy,'m:')
plot(propp,'g-')
xlabel('Time')
ylabel('Whale Population Proportion')
legend('Single Females','Single Males','Females with Calves')
hold off