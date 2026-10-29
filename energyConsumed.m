function energy = energyConsumed(node1, node2)
    % Calculate energy consumed for transmitting data from node1 to node2
    distance = norm(node1 - node2);
    % For simplicity, let's assume energy consumption is proportional to the distance
    energy = distance;
end
