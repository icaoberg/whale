%Whale Group at MTBI
%This function corresponds to the single females
%for the Whale Group (also know as the Whale Watchers :P )
%betax = birth rate of females
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%x = single females
%y = single males
%px = paired females

function sf = x_fdelay( epsilon, betax, mux, muj, muy, x, y, px, pxk, k )

sf = betax * mux * pxk * muj^k + mux * px + mux * x - ( 1 - epsilon ) * ( mux * muy * x * y ) / ( mux * x + muy * y );