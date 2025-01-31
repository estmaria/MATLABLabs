fmax=0;
for x1=-2:0.1:4
    for x2=-1:0.1:1
        for x3=-1:0.1:1
            f=8*x1+4*x2^2-1.5*x3^2;
            if f>fmax
                fmax=f;
            end
        end
    end
end
disp(fmax);