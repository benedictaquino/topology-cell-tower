function [edge_list,vx,vy] = VR_skeleton(R,X)

%% This function takes as its input a two colum matirx of coordinates
%% of vertices in the plane and a radius R for use in building a Cech
%% complex.
%%
%% The output is the list of edges for the complex in the form of a
%% two column matrix.  Each entry of the edge_list matrix referst to
%% a row of the matrix X.
%%
%% The function also produces two 2-row matrices, vx and vy which 
%% contain the coordinates of the vertices of the edges in edge_list.
%% These can be used in a plot command to plot the 1-cells of the
%% Cech or Vietoris-Rips comple

X_dist = pdist(X);

Sq = squareform(X_dist);

%% filter_values = (edge_lengths(2:end) + edge_lengths(1:end-1))./2;



    [row, col] = find(Sq < R);

    edge_list = [row(row - col >0),col(row-col>0)];



    vx= [X(edge_list(:,1),1)';X(edge_list(:,2),1)'];
    vy= [X(edge_list(:,1),2)';X(edge_list(:,2),2)'];

    plot(vx,vy);

end









    