%Whale Group at MTBI
%This function corresponds to the proportion of single males
%for the Whale Group (also know as the Whale Watchers :P )
%x = single females
%y = single males
%px = paired females

function propy = ppy( x, y, px )

propy = y / ( x + y + px );