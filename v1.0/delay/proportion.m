%Whale Group at MTBI
%created by Ivan E. Cao-Berg
%"And you take YOUR LIFE in your hands.
%And what happens?
%SOMETHING TERRIBLE!!!!
%No one else to blame.
%-Erica Jong

%This function creates a population proportion plot for each cycle and another plot of population sizes of those cycles
function proportion( epsilon, px0, x0, y0, c, px1, px2, px3, px4, px5, px6, px7, px8, px9, px10 )

%Constants
muj = 0.955;
mux = 0.925;
muy = 0.94;
muj = 0.957;
betax = 0.5;
betay = 0.5;

if nargin == 0
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

if nargin == 0
%Initial Conditions
epsilon = input('Please type the value for epsilon ( no noise -> epsilon = 0 ) :')
px0 = input('Please type the value for P_0 :')
x0 = input('Please type the value for x_0 :')
y0 = input('Please type the value for y_0 :')
px(2) = input('Please type the value for px2 :');
px(3) = input('Please type the value for px3 :');
px(4) = input('Please type the value for px4 :');
px(5) = input('Please type the value for px5 :');
px(6) = input('Please type the value for px6 :');
px(7) = input('Please type the value for px7 :');
px(8) = input('Please type the value for px8 :');
px(9) = input('Please type the value for px9 :');
px(10) = input('Please type the value for px10 :');
end

%Initial Conditions = First Generation
x(11)=x0;
y(11)=y0;
px(1)=px0;

%Recursion Formula
for t = 12:c %Counter for number of generations
    x(t) = x_f( epsilon, betax, mux, muj, muy, x(t-1), y(t-1), px(t-1), px(t-10) ); 
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-10) );
    px(t) = px_f( epsilon, muj, mux, muy, x(t-1), y(t-1));
    propx(t) = ppx( x(t-1), y(t-1), px(t-1));
    propy(t) = ppy( x(t-1), y(t-1), px(t-1));
    propp(t) = ppp( x(t-1), y(t-1), px(t-1));
    time(t) = t-1; 
end

%Divides the plot into four subplots
%First subplot : Time vs. Proportion of Single Females
subplot(2,2,1)
plot(propx,'r-.o')
xlabel('Time')
ylabel('Single Females')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for ' num2str(c) ' generations.'])
legend([num2str(propx(c-1))])

%Second subplot : Time vs. Proportion of Single Males
subplot(2,2,2)
plot(propy,'m:v')
xlabel('Time')
ylabel('Single Males')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for ' num2str(c) ' generations.'])
legend([num2str(propy(c-1))])

%Third subplot : Time vs. Proportion of Paired Females
subplot(2,2,3)
plot(propp,'g-^')
xlabel('Time')
ylabel('Paired females')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for ' num2str(c) ' generations.'])
legend([num2str(propp(c-1))])

%Fourth subplot :  : Time vs. Whale Population Size
subplot(2,2,4)
hold on
plot(x,'r-.o')
plot(y,'m:v')
plot(px,'g-^')
xlabel('Time')
ylabel('Whale Population')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for t <' num2str(c) '.'])
hold off