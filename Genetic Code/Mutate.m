function y = Mutate(x, mu)
    nVar = numel(x);
    nmu = ceil(mu*nVar);
    j = randi([nmu,nVar]);
    y = x;
    y(j) = 1-x(j);
end