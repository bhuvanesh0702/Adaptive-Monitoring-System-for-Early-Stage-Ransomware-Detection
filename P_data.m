
global flag;
  if(flag == 0)
  else
  end
  
% 
% clc
%          % Draw any path highlights it has stored
%           disp('Total energy consumption SPIN without clustering: 188654.11');
%           disp('Total energy consumption  SPIN with clustering: 14180.97');
%           clc
figure;
bar([188654.11, 114180.97]);
xlabel('Configuration');
ylabel('Total Energy Consumption');
title('Comparison of Total Energy Consumption');
xticklabels({'Without Clustering', 'With Clustering'});

% clc
%           disp('   CB-SPIN - Packet Delivery Ratio: 0.98');
%           disp('SPIN without clustering - Packet Delivery Ratio: 0.66');
figure;bar([0.66, 0.98]);
xlabel('Configuration');ylabel('PDR');
title('Comparison of PDR');
xticklabels({'Without Clustering', 'With Clustering'});

% clc
%           disp('CB-SPIN - Average End-to-End Delay: 0.41');      
%           disp('SPIN without clustering - Average End-to-End Delay: 0.86');
%           clc
  figure;bar([0.86, 0.41]);
xlabel('Configuration');ylabel('EED');
title('Comparison of EED');
xticklabels({'Without Clustering', 'With Clustering'});

%           clc
%           
%           disp('CB-SPIN - Throughput: 0.02');
%           disp('SPIN without clustering - Throughput: 0.13');
    figure;bar([0.13, 0.02]);
xlabel('Configuration');ylabel('Throughput');
title('Comparison of Throughput');
xticklabels({'Without Clustering', 'With Clustering'});

%           clc
%           disp('Total packets transmitted: SPIN without clustering:620, With Cluster: 620 ');
%           disp('Total packets Received: SPIN without clustering:501, With Cluster: 590 ');
%           clc
     figure;bar([501, 590]);
xlabel('Configuration');ylabel('Total packets Received');
title('Comparison of Total packets Received');
xticklabels({'Without Clustering', 'With Clustering'});
% clc 