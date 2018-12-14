%Whale Group at MTBI
%This function corresponds to the single females
%for the Whale Group (also know as the Whale Watchers :P )
%betay = birth rate of males
%mux = probability of surviving the single female cycle
%muy = probability of surviving the single male cycle
%y = single males
%px = paired females

function kfunction = kfunc( mux, muy, x, y )

kfunction = muy * y / ( mux * x + muy * y )