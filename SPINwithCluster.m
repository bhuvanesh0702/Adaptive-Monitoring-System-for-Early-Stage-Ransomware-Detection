numNodes = 50;
commRange = 20;
nodePositions = rand(numNodes, 2) * 100;
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


for t = 1:100 % Run for 100 time steps
    % Broadcast data to cluster heads
    for i = 1:size(clusterHeads, 1)
        clusterMembers = clusters{i};
        for j = 1:size(clusterMembers, 1)
            % Simulate data transmission
            % (Here, you can implement data aggregation if needed)
            fprintf('Node at (%.2f, %.2f) broadcasts data to cluster head at (%.2f, %.2f) at time %d\n', ...
                clusterMembers(j, 1), clusterMembers(j, 2), clusterHeads(i, 1), clusterHeads(i, 2), t);
        end
    end
    
    % Cluster heads transmit aggregated data to the sink
    for i = 1:size(clusterHeads, 1)
        % Simulate data transmission to the sink
        fprintf('Cluster head at (%.2f, %.2f) transmits aggregated data to sink at time %d\n', ...
            clusterHeads(i, 1), clusterHeads(i, 2), t);
    end
    
    % Update any necessary parameters or states
    
    % Pause for visualization (optional)

end
