function constantg = g_f(mux, muy, x, y, epsilon)

constantg= 1 - (muy*y/(mux*x+muy*y))*(1-epsilon);

