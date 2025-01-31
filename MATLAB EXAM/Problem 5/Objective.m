%%function z = Objective(x)
    %%z = sum(x.^2);
%%end
function z = Objective(x)
    z=0;
    for i=1:1000   %CAMBIAR DEPENDE DEL RANGE DE i
        z=-(i*cos(i*x(i))+2*i+sin(i)+z);  %CAMBIAR DEPENDE DE LA FUNCION
    end
end