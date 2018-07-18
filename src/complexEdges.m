%% This function creates the edges for a landmark or observation complexes
% Input Parameters:
% R = Radius of distance
% X = Landmarks (or Observations)
% Y = Observations (or Landmarks)

function edge_list = complexEdges(R,X,Y)

X_dist = pdist2(X,Y);

[row, col] = find(X_dist < R);

edge_list = [];

for i = 1:length(row)
    Z = find(col == col(i));
    edge_list = unique([edge_list ; nchoosek(row(Z),2)],'rows');
end