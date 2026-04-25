
clc; clear;

% Objective function coefficients
C = [20 18 3 10];   % [W X Y Z]

% Constraints (A * x <= b)
A = [
    15 15 3.75 3;
    5 8 4 5;
    6 1 2 5
];

b = [30; 40; 10];

n = length(C);

% Generate binary solution space
binary_space = generate_binary_space(n);

best_val = -inf;
best_sol = [];

for i = 1:size(binary_space,1)
    
    x = binary_space(i,:);
    
    % Check constraints
    if all(A * x' <= b)
        
        val = evaluate_objective(C, x);
        
        if val > best_val
            best_val = val;
            best_sol = x;
        end
    end
end

disp('Best Solution:')
disp(best_sol)

disp('Maximum Value:')
disp(best_val)
