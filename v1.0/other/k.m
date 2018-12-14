%Nate's Ratio Program
%Whale Group

 function k( betax, mux, muj, x0, y0, c )
 
 if nargin == 0
     option = input( 'Do you want to work with fin whales (1), with right whales (2) or another whale (3)? : ' )
     if option == 1
         betax = 0.5;
         betay = 0.5;
         mux = 0.955;
         muy = 0.965;
         muj = 0.96;
     end
     if option == 2
         betax = 0.5;
         betay = 0.5;
         mux = 0.925;
         muy = 0.94;
         muj = 0.957;
     end
     if option == 3
         betax = input( 'Please input a value for betax :' );
         betay = input( 'Please input a value for betay :' );
         mux = input( 'Please input a value for mux :' );
         muy = input( 'Please input a value for muy :' );
         muj = input( 'Please input a value for muj :' );
     end
 c = input( 'For many generations do you want run the simulation? :' );
 x0 = input('Please type the value for x_0 :')
 y0 = input('Please type the value for y_0 :')
 end
 
 x = zeros(1,c);
 y = zeros(1,c);
 k = zeros(1,c);
 
 x(1) = x0;
 y(1) = y0;
 k(1) = kfunc( mux, muy, x0, y0 )
 
 for t = 2:c
     k(t) = kfunc( mux, muy, x(t-1), y(t-1) );
 end
 
 plot(k)
 