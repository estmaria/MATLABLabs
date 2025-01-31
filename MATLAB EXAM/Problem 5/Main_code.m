clc;
clear;
close all;
%% Problem Definition
CostFunction = @(x) Objective(x);     % Cost Function
nVar = 1000;                           % Number of Decision Variables  CAMBIAR DEPENDE DE RANGE DE i
VarSize = [1 nVar];                   % Decision Variables Matrix 
VarMin = -1;                         % Lower Bound of Variables  CAMBIAR
VarMax = 1;                          % Upper Bound of Variables    CAMBIAR
%% GA Parameters
MaxIt = 500;                         % Maximum Number of Iterations
nPop = 200;                            % Population Size  
pc = 0.4;                             % Crossover Percentage
nc = 2*round(pc*nPop/2);              % Number of Offsprings (also Parents)
pm = 0.25;                             % Mutation Percentage
nm = round(pm*nPop);                  % Number of Mutants
mu = 0.01;                             % Mutation Rate
%% Initialization
empty_individual.Position = [];
empty_individual.Cost = [];
pop = repmat(empty_individual, nPop, 1);

for i = 1:nPop
    % Initialize Position
    pop(i).Position = randi([VarMin VarMax], VarSize);
    % Evaluation
    pop(i).Cost = CostFunction(pop(i).Position);
end
% Sort Population
Costs = [pop.Cost];
[Costs, SortOrder] = sort(Costs);
pop = pop(SortOrder);
%% Store Best Solution
BestSol = pop(1);
% Array to Hold Best Cost Values
BestCost = zeros(MaxIt, 1);
% Store Cost
WorstCost = pop(end).Cost;
%% Main Loop
for it = 1:MaxIt
    % Crossover
    popc = repmat(empty_individual,nc/2,2);
    for k = 1:nc/2
        i1 = randi([1 nPop]);
        i2 = randi([1 nPop]);
        % Select Parents
        p1 = pop(i1);
        p2 = pop(i2);
        % Perform Crossover
        [popc(k, 1).Position, popc(k, 2).Position] = Crossover(p1.Position, p2.Position);
        % Evaluate Offsprings
        popc(k, 1).Cost = CostFunction(popc(k, 1).Position);
        popc(k, 2).Cost = CostFunction(popc(k, 2).Position);
    end
    popc = popc(:);
    % Mutation
    popm = repmat(empty_individual, nm, 1);
    for k = 1:nm
        % Select Parent
        i = randi([1 nPop]);
        p = pop(i);
        % Perform Mutation
        popm(k).Position = Mutate(p.Position, mu);
        % Evaluate Mutant
        popm(k).Cost = CostFunction(popm(k).Position);
    end
    % Create Merged Population
    pop = [pop;popc;popm]; 
    % Sort Population
    Costs = [pop.Cost];
    [Costs, SortOrder] = sort(Costs);
    pop = pop(SortOrder);
    % Update Worst Cost
    WorstCost = max(WorstCost, pop(end).Cost);
    % Truncation
    pop = pop(1:nPop);
    Costs = Costs(1:nPop);
    % Store Best Solution Ever Found
    BestSol = pop(1);
    % Store Best Cost Ever Found
    BestCost(it) = BestSol.Cost;
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
end
%% Results
figure;
plot(BestCost, 'LineWidth', 2);
xlabel('Iteration');
ylabel('Cost');
grid on;
