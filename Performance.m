% Parameters
numNodes = 100; % Number of nodes
maxX = 100; % Maximum x-coordinate of the area
maxY = 100; % Maximum y-coordinate of the area
baseStation = [maxX/2, maxY+10]; % Base station position
thresholdDistance = 20; % Threshold distance for transmission

% Generate random node positions
nodes = rand(numNodes, 2) .* [maxX maxY];

% Data transmission
packetCount = 0; % Counter for transmitted packets
receivedCount = 0; % Counter for received packets
totalDelay = 0; % Accumulator for total delay

for i = 1:numNodes
    % Calculate distance from node to base station
    distance = norm(nodes(i,:) - baseStation);
    
    if distance <= thresholdDistance % Within transmission range
        % Simulate data transmission to base station
        packetCount = packetCount + 1;
        receivedCount = receivedCount + 1; % Assume no packet loss
        % Calculate delay (assuming constant transmission time)
        totalDelay = totalDelay + distance / thresholdDistance; 
    else
        % Node out of range
        % Packet loss occurs
    end
end

% Calculate packet delivery ratio
deliveryRatio = receivedCount / packetCount;

% Calculate average end-to-end delay
avgDelay = totalDelay / receivedCount;

% Calculate throughput (assuming all packets are of equal size)
transmissionRange = pi * thresholdDistance^2; % Circular coverage area
totalArea = maxX * maxY; % Total area
throughput = receivedCount * transmissionRange / totalArea;

% Error rate (for simplicity, assume no errors in transmission)

% Display results
disp('Results:');
fprintf('Packet Delivery Ratio: %.2f\n', deliveryRatio);
fprintf('Average End-to-End Delay: %.2f\n', avgDelay);
fprintf('Throughput: %.2f\n', throughput);




% Data transmission for SPIN without clustering
packetCount_SPIN = 0; % Counter for transmitted packets (SPIN)
receivedCount_SPIN = 0; % Counter for received packets (SPIN)
totalDelay_SPIN = 0; % Accumulator for total delay (SPIN)

for i = 1:numNodes
    % Calculate distance from node to base station
    distance = norm(nodes(i,:) - baseStation);
    
    % CB-SPIN
    if distance <= thresholdDistance % Within transmission range
        packetCount_CB = packetCount_CB + 1;
        receivedCount_CB = receivedCount_CB + 1; % Assume no packet loss
        % Calculate delay (assuming constant transmission time)
        totalDelay_CB = totalDelay_CB + distance / thresholdDistance;
    else
        % Node out of range
        % Packet loss occurs
    end
    
    % SPIN without clustering
    if distance <= thresholdDistance % Within transmission range
        packetCount_SPIN = packetCount_SPIN + 1;
        receivedCount_SPIN = receivedCount_SPIN + 1; % Assume no packet loss
        % Calculate delay (assuming constant transmission time)
        totalDelay_SPIN = totalDelay_SPIN + distance / thresholdDistance;
    else
        % Node out of range
        % Packet loss occurs
    end
end

% Calculate packet delivery ratio for CB-SPIN
deliveryRatio_CB = receivedCount_CB / packetCount_CB;

% Calculate average end-to-end delay for CB-SPIN
avgDelay_CB = totalDelay_CB / receivedCount_CB;

% Calculate packet delivery ratio for SPIN without clustering
deliveryRatio_SPIN = receivedCount_SPIN / packetCount_SPIN;

% Calculate average end-to-end delay for SPIN without clustering
avgDelay_SPIN = totalDelay_SPIN / receivedCount_SPIN;

% Calculate throughput (assuming all packets are of equal size)
transmissionRange = pi * thresholdDistance^2; % Circular coverage area
totalArea = maxX * maxY; % Total area
throughput_CB = receivedCount_CB * transmissionRange / totalArea;
throughput_SPIN = receivedCount_SPIN * transmissionRange / totalArea;

% Error rate (for simplicity, assume no errors in transmission)
run('Analysis.m');
% Display results
disp('Results:');
fprintf('CB-SPIN - Packet Delivery Ratio: %.2f\n', deliveryRatio_CB);
fprintf('CB-SPIN - Average End-to-End Delay: %.2f\n', avgDelay_CB);
fprintf('CB-SPIN - Throughput: %.2f\n', throughput_CB);
fprintf('SPIN without clustering - Packet Delivery Ratio: %.2f\n', deliveryRatio_SPIN);
fprintf('SPIN without clustering - Average End-to-End Delay: %.2f\n', avgDelay_SPIN);
fprintf('SPIN without clustering - Throughput: %.2f\n', throughput_SPIN);
 