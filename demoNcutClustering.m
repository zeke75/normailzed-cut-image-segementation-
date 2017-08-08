function demoNcutClustering;
% demoNcutClustering
% 
% demo for NcutClustering
% also initialize matlab paths to subfolders
% Timothee Cour, Stella Yu, Jianbo Shi, 2004.

disp('Ncut Clustering demo');

%% make u a point data set
caseid = 5;
[data,size_cluster] = build_scene(caseid)
figure(1);clf;
plot(data(1,:),data(2,:),'kx'); axis image; 
hold on; 

disp('This is the input data points to be clustered, press Enter to continue...');
pause; 
 
disp('Compute clustering...');

% compute similarity matrix
[W,Dist] = compute_relation(data);

% clustering graph in
nbCluster = 2;
tic;
[NcutDiscrete,NcutEigenvectors,NcutEigenvalues] = ncutW(W,nbCluster);
disp(['The computation took ' num2str(toc) ' seconds']);
figure(3);
plot(NcutEigenvectors);

% display clustering result
cluster_color = ['rgbmyc'];
cluster_shape = ['x' '^'];
figure(2);clf;
for j=1:nbCluster,
    id = find(NcutDiscrete(:,j));
    plot(data(1,id),data(2,id),cluster_shape(j), 'MarkerFaceColor',cluster_color(j),'MarkerSize',5); hold on; 
end
hold off; axis image;
disp('This is the clustering result');
disp('The demo is finished.');
