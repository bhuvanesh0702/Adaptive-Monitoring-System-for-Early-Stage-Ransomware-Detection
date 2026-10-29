
global totalEnergy_noCluster;
global totalEnergy_cluster;


% Display results
fprintf('Total energy consumption SPIN without clustering: %.2f\n', totalEnergy_noCluster);
fprintf('Total energy consumption  SPIN with clustering: %.2f\n', totalEnergy_cluster);
 
% figure(1);
bar([totalEnergy_noCluster, totalEnergy_cluster]);
xlabel('Configuration');
ylabel('Total Energy Consumption');
title('Comparison of Total Energy Consumption');
xticklabels({'Without Clustering', 'With Clustering'});