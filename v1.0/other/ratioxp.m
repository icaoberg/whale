%Whale Group

function rxp = ratioxp( betax, muj, mux, k )

rxp = ( betax * mux * muj^10 + mux ) / ( 1 - mux * k )