%This function corresponds to the single females nonlinear difference equation
%for the Whale Group (also know as the Whale Watchers :P )

function sm = px_fnoiseosc( t, epsilon, mux, muy, x, y )

sm = ( 1/2 * ( 1 - epsilon * ( -1 )^t ) ) * mux * muy * x * y / ( mux * x + muy * y );