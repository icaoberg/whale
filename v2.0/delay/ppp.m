%Whale Group at MTBI
%This function corresponds to the proportion of paired females
%for the Whale Group (also know as the Whale Watchers :P )
%x = single females
%y = single males
%px = paired females

function pf = ppp( x, y, px )

pf = px / ( x + y + px ); 