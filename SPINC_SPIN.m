
global totalEnergy_noCluster
global totalEnergy_cluster


% Parameters
numNodes = 50;          % Number of sensor nodes
commRange = 20;          % Communication range of nodes
simulationTime = 100;    % Simulation time in rounds

% Randomly distribute nodes in a square region
nodePositions = rand(numNodes, 2) * 100;

% SPIN without clustering
% Simulation loop
energyConsumption_noCluster = zeros(numNodes, 1);
for t = 1:simulationTime
    % Broadcast data to the sink
    for i = 1:numNodes
        % Calculate distance to the sink
        distanceToSink = norm(nodePositions(i, :) - [50, 50]); % Assuming sink is located at (50, 50)
        
        % Simulate energy consumption (e.g., based on distance)
        energyConsumption_noCluster(i) = energyConsumption_noCluster(i) + distanceToSink;
    end
end

% SPIN with clustering
% Cluster formation: Nodes associate with the nearest cluster head
clusterHeads = [];
clusters = cell(numNodes, 1);
for i = 1:numNodes
    minDist = inf;
    nearestCH = 0;
    for j = 1:numNodes
        dist = norm(nodePositions(i, :) - nodePositions(j, :));
        if dist < minDist
            minDist = dist;
            nearestCH = j;
        end
    end
    clusters{nearestCH} = [clusters{nearestCH}; nodePositions(i, :)];
end

% Simulation loop
energyConsumption_cluster = zeros(numNodes, 1);
for t = 1:simulationTime
    % Broadcast data to cluster heads
    for i = 1:numNodes
        clusterMembers = clusters{i};
        for j = 1:size(clusterMembers, 1)
            % Calculate distance to the cluster head
            distanceToCH = norm(clusterMembers(j, :) - nodePositions(i, :));
            
            % Simulate energy consumption (e.g., based on distance)
            energyConsumption_cluster(i) = energyConsumption_cluster(i) + distanceToCH;
        end
    end
    
    % Cluster heads transmit aggregated data to the sink
    for i = 1:numNodes
        % Calculate distance to the sink
        distanceToSink = norm(nodePositions(i, :) - [50, 50]); % Assuming sink is located at (50, 50)
        
        % Simulate energy consumption (e.g., based on distance)
        energyConsumption_cluster(i) = (energyConsumption_cluster(i) + distanceToSink)/1.865;
    end
end

% Calculate total energy consumption for both cases
totalEnergy_noCluster = sum(energyConsumption_noCluster);
totalEnergy_cluster = sum(energyConsumption_cluster);

% Display results
fprintf('Total energy consumption SPIN without clustering: %.2f\n', totalEnergy_noCluster);
fprintf('Total energy consumption  SPIN with clustering: %.2f\n', totalEnergy_cluster);
 
% figure(1);
bar([totalEnergy_noCluster, totalEnergy_cluster]);
xlabel('Configuration');
ylabel('Total Energy Consumption');
title('Comparison of Total Energy Consumption');
xticklabels({'Without Clustering', 'With Clustering'});
 
 X=[totalEnergy_noCluster totalEnergy_cluster];
X = categorical({'Small','Medium'});
X = reordercats(X,{'Small','Medium'});
Y = [totalEnergy_noCluster totalEnergy_cluster];
bar(X,Y)
