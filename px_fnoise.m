%This function corresponds to the single females nonlinear difference equation
%for the Whale Group (also know as the Whale Watchers :P )

function sm = px_fnoise( epsilon, mux, muy, x, y )

sm = ( 1 - epsilon ) * mux * muy * x * y / ( mux * x + muy * y );