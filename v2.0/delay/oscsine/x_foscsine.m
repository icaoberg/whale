%Whale Group at MTBI
%This function corresponds to the single females
%for the Whale Group (also know as the Whale Watchers :P )
%betax = birth rate of females
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%x = single females
%y = single males
%px1 = paired females at time t-1
%px10 = paired females at time t-10

function sf = x_fosc( epsilon, betax, mux, muj, muy, x, y, px, pxk, k, t )

sf = betax * mux * pxk * muj^k + mux * px + mux * x - 1/2 * ( 1 - sin( 2 * pi * t ) * epsilon ) * ( mux * muy * x * y ) / ( mux * x + muy * y );