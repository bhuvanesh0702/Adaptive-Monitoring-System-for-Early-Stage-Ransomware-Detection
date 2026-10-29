numNodes = 10;
commRange = 10;
initialEnergy = 1000; % Initial energy level for each node
nodePositions = rand(numNodes, 2) * 100;
nodeEnergy = initialEnergy * ones(numNodes, 1); % Initialize energy for each node
clusterHeads = [];
for i = 1:numNodes
    if rand < 0.2 
        clusterHeads = [clusterHeads; nodePositions(i, :)];
    end
end

clusters = cell(size(clusterHeads, 1), 1);
for i = 1:numNodes
    minDist = inf;
    nearestCH = 0;
    for j = 1:size(clusterHeads, 1)
        dist = norm(nodePositions(i, :) - clusterHeads(j, :));
        if dist < minDist
            minDist = dist;
            nearestCH = j;
        end
    end
    clusters{nearestCH} = [clusters{nearestCH}; nodePositions(i, :)];
end

totalPacketsTransmitted = 0;
totalPacketsReceived = 0;
aliveNodes = numNodes;
totalEnergyConsumption = 0;

for t = 1:100 % Run for 100 time steps
    % Broadcast data to cluster heads
    for i = 1:size(clusterHeads, 1)
        clusterMembers = clusters{i};
        for j = 1:size(clusterMembers, 1)
            % Simulate data transmission
            % Deduct energy for transmission
            nodeEnergy(i) = nodeEnergy(i) - energyConsumed(clusterMembers(j,:), clusterHeads(i,:));
            totalPacketsTransmitted = totalPacketsTransmitted + 1;
            fprintf('Node at (%.2f, %.2f) broadcasts data to cluster head at (%.2f, %.2f) at time %d\n', ...
                clusterMembers(j, 1), clusterMembers(j, 2), clusterHeads(i, 1), clusterHeads(i, 2), t);
        end
    end
    
    % Cluster heads transmit aggregated data to the sink
    for i = 1:size(clusterHeads, 1)
        % Simulate data transmission to the sink
        % Deduct energy for transmission
        nodeEnergy(i) = nodeEnergy(i) - energyConsumed(clusterHeads(i,:), sinkPosition);
        totalPacketsTransmitted = totalPacketsTransmitted + 1;
        fprintf('Cluster head at (%.2f, %.2f) transmits aggregated data to sink at time %d\n', ...
            clusterHeads(i, 1), clusterHeads(i, 2), t);
    end
    
    % Update metrics
    % Here you can update metrics like total packets received, alive nodes,
    % and average energy consumption
    
    % Pause for visualization (optional)

end

