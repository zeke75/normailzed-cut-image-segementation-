 function [W,distances] = compute_relation(data,scale_sig,order)
%
%      [W,distances] = compute_relation(data,scale_sig) 
%       Input: data= Feature_dimension x Num_data
%       ouput: W = pair-wise data similarity matrix
%              Dist = pair-wise Euclidean distance
%
%
% Jianbo Shi, 1997 


distances = zeros(length(data),length(data));
for j = 1:length(data),
  distances(j,:) = (sqrt((data(1,:)-data(1,j)).^2 +...
                (data(2,:)-data(2,j)).^2));
         
end

% distances = X2distances(data');

%%if (~exist('scale_sig')),
%%    scale_sig = 0.05*max(distances(:));
%%end

%%if (~exist('order')),
  %order = 2;
%end

tmp = (distances.^2)/5;

%W = exp(-tmp);
W=1-distances;  


%W=exp(-distances.^2/0.01);

%for i=1:length(data)
 %  for j=1:length(data)
 %        if distances(i,j)>=3,
 %          W(i,j)=0;
 %        end
 % end
%end
         


