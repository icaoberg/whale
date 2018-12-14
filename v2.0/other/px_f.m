%Whale Group at MTBI
%This function corresponds to the paired females
%for the Whale Group (also know as the Whale Watchers :P )
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%x = single females
%y = single males

function sm = px_f( epsilon, muj, mux, muy, x, y, k )

sm = ( 1 - epsilon ) * muj^k * mux * muy * x * y / ( mux * x + muy * y );