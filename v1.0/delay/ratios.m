%Whale Group at MTBI
%created by Ivan E. Cao-Berg
%"And you take YOUR LIFE in your hands.
%And what happens?
%SOMETHING TERRIBLE!!!!
%No one else to blame.
%-Erica Jong

function ratios(px0,x0,y0,c)

%Constants
mux = 0.925;
muy = 0.94;
muj = 0.957;
betax = 0.5;
betay = 0.5;

if nargin == 0
%Initial Conditions
px0 = input('Please type the value for P_0 :')
x0 = input('Please type the value for x_0 :')
y0 = input('Please type the value for y_0 :')

%Number of iterations = numbers of generations
c = input('For how many generations do you want to run the simulation? :')
end

%Zero matrixes, they reserve the space for the variables
x = zeros(1,c);
y = zeros(1,c);
px = zeros(1,c);
time = zeros(1,c);
propx = zeros(1,c);
propy = zeros(1,c);
propp = zeros(1,c);
maleratio = zeros(1,c);
femaleratio = zeros(1,c);
pairedratio = zeros(1,c);

x(1)=x0;
y(1)=y0;
px(1)=px0;

for t = 2:c %Counter for number of generations
    x(t) = x_f( betax, mux, muy, x(t-1), y(t-1), px(t-1) );
    y(t) = y_f( betay, mux, muy, y(t-1), px(t-1) );
    px(t) = px_f( mux, muy, x(t-1), y(t-1) );
    propx(t) = ppx( x(t-1), y(t-1), px(t-1) );
    propy(t) = ppy( x(t-1), y(t-1), px(t-1) );
    propp(t) = ppp( x(t-1), y(t-1), px(t-1) );  
    maleratio(t) = rmp( y, px );
    femaleratio(t) = rfp( y, px );
    time(t)=t-1;
end

%Divides the plot into four parts
%First subplot
subplot(2,2,1)
plot(time,femaleratio,'r-.o')
xlabel('Time')
ylabel('Single Females Ratio')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for t <' num2str(c) '.'])

%Second subplot
subplot(2,2,2)
plot(time,maleratio,'m:v')
xlabel('Time')
ylabel('Single Males Ratio')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for t <' num2str(c) '.'])

%Third subplot
subplot(2,2,3)
hold on
plot(time,x,'r-.o')
plot(time,y,'m:v')
plot(time,px,'g-^')
xlabel('Time')
ylabel('Whale Population Size')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for t <' num2str(c) '.'])
hold off

%Fourth subplot
subplot(2,2,4)
hold on
plot(time,propx,'r-.o')
plot(time,propy,'m:v')
plot(time,propp,'g-^')
xlabel('Time')
ylabel('Whale Population Proportion')
title(['Px(0) = ' num2str(px0) ', x(0) = ' num2str(x0) ', y(0) = ' num2str(y0) ' for t <' num2str(c) '.'])
hold off

    
