%Whale Group at MTBI
%This function corresponds to the single females
%for the Whale Group (also know as the Whale Watchers :P )
%betax = birth rate of females
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%x = single females
%y = single males
%px = paired females

function sf = x_f( epsilon, betax, mux, muy, x, y, px )

sf = betax * mux * px + mux * px + mux * x - ( 1 - epsilon ) * ( mux * muy * x * y ) / ( mux * x + muy * y );