%Whale Group at MTBI
%This function corresponds to the proportion of single females
%for the Whale Group (also know as the Whale Watchers :P )
%x = single females
%y = single males
%px = paired females

function propx = ppx( x, y, px )

propx = x / ( x + y + px );