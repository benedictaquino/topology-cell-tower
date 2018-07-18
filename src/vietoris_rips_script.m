
%% This is a sample script showing how to use two functions. 
%% 
%% The first computes the 1-cells of a Veitoris-Rips or Cech complex.
%% The input is the list of vertices and the radius R.

 X = ATT_landmarks;
 Y = [0 0; 0 15; 0 30; 0 45; 15 0; 15 15; 15 30; 15 45; 30 0; 30 15; 30 30; 
      30 45; 45 0; 45 15; 45 30; 45 45; 60 0; 60 15; 60 30; 60 45; 75 0; 
      75 15; 75 30; 75 45];
 
 R = 20;
 
 %% The function call is as follows: 
 
 [edge_list,vx,vy] = Landmark(R,X,Y);
 
 
 %% The output is the list of edges and the x and y coordinates
 %% of these edges. The function also plots these 1-cells using vx and vy.
 
%%
%% The second function computes the 2-simplices of the Vietoris-Rips 
%% of the vertex set. Notice the input is one of the outputs of the first function.
%% The output of this function is the three-column list of vertices. 

[trilist] = trilist_builder(edge_list); 