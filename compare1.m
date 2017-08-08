function datacluster
disp('Ncut Clustering demo');

%% make u a point data set
caseid = 6;
[data,size_cluster] = build_scene(caseid)
figure(1);clf;
plot(data(1,:),data(2,:),'kx');  
hold on; 

disp('This is the input data points to be clustered, press Enter to continue...');
pause; 
 
disp('Compute clustering...');

% compute similarity matrix
[W,Dist] = compute_relation(data);

% clustering graph in
nbCluster = 2;
tic;

d = sum(W,2);

D= 1./sqrt(d);
P = diag(D)*W*diag(D);

P2=diag(d)-W;

P3=W;

%[vbar,s]=eigs_new(@mex_w_times_x_symmetric,size(P,1),2,'LA',,tril(P))
[vbar,s] = eigs(P,2,'LR');

s = real(diag(s));
[x,y] = sort(-s); 
Eigenvalues = -x;
vbar = vbar(:,y);
Eigenv1 = vbar(:,1);
Eigenv2 = vbar(:,2);

figure(2);clf;
plot(Eigenv1,'k^')

figure(3);clf;
plot(Eigenv2,'k^')

%%
[vbar,s] = eigs(P2,2,'LR');

s = real(diag(s));
[x,y] = sort(-s); 
Eigenvalues = -x;
vbar = vbar(:,y);
Eigenv1 = vbar(:,1);
Eigenv2 = vbar(:,2);

figure(4);clf;
plot(Eigenv1,'k^')

figure(5);clf;
plot(Eigenv2,'k^')


%%
[vbar,s] = eigs(P3,2,'LA');

s = real(diag(s));
[x,y] = sort(-s); 
Eigenvalues = -x;
vbar = vbar(:,y);
Eigenv1 = vbar(:,1);
Eigenv2 = vbar(:,2);

figure(6);clf;
plot(Eigenv1,'k^')

figure(7);clf;
plot(Eigenv2,'k^')


