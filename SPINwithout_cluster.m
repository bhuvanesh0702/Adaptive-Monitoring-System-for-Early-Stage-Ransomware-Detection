% SPIN without Clustering MATLAB Code for Wireless Sensor Networks

% Number of sensor nodes
numNodes = 50;

% Communication range of nodes
commRange = 20;

% Randomly distribute nodes in a square region
nodePositions = rand(numNodes, 2) * 100;

% SPIN protocol
% Each node periodically broadcasts its data to the sink

% Simulation loop
for t = 1:100 % Run for 100 time steps
    % Broadcast data to the sink
    for i = 1:numNodes
        % Simulate data transmission to the sink
        fprintf('Node at (%.2f, %.2f) broadcasts data to sink at time %d\n', ...
            nodePositions(i, 1), nodePositions(i, 2), t);
    end
    
    % Update any necessary parameters or states
    
    % Pause for visualization (optional)
    pause(1);
end
