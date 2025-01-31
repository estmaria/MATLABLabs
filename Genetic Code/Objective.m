%%function z = Objective(x)
    %%z = sum(x.^2);
%%end
function z = Objective(x)
    z=0;
    for i=1:100   %CAMBIAR DEPENDE DEL RANGE DE i
        z=i*x(i)+z;  %CAMBIAR DEPENDE DE LA FUNCION
    end
end