%Whale Group at MTBI
%This function corresponds to the paired females
%for the Whale Group (also know as the Whale Watchers :P )
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%x = single females
%y = single males

function pf = px_fosc( epsilon, muj, mux, muy, x, y, t )

pf = 1/2 * ( 1 - (-1)^t * epsilon ) * mux * muy * x * y / ( mux * x + muy * y );