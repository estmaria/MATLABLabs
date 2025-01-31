%equation of ellipse-> (x'^2/8^2)+(y'^2/14^2)=1
%%Calculate the moment of inertia relative to the x' axis
Moment_Of_Inertia_Integrand=@(y_prime)y_prime^2*2*sqrt(8^2*(1-y_prime^2/14^2));
Ix_prime=integral(Moment_Of_Inertia_Integrand, -8, 8);
fprintf('\nThe moment of inertia relative to the x'' axis is %1.0f cm^4\n', Ix_prime);