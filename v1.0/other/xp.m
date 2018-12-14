%Nate's Ratio Program
%Whale Group

 function xp( betax, mux, muj, step )
 
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
     step = input( 'Please input the step size you wish to use ( 0 < step < 1 ) : ');
 end
 
 k = 0:step:1; %defines the vector k
 ratiox = zeros( 1 , 1/step );
 ratiox = zeros( 1 , 1/step );
 
 for t = 1 : 1/step;
     ratiox(t) = ratioxp( betax, muj, mux, k(t) );
     ratioy(t) = ratioyp( betay, muj, mux, muy );
 end
 
 hold on
 plot(ratiox,'og')
 plot(ratioy,'vr')
 title('Ratios')
 legend('x(t)/p(t)','y(t)/p(t)')
 hold off