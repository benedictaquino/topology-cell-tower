%% This function computes whether a mountain range is obstructing the connection between
%% a landmark and a cell tower

% Input Parameters:
% X = Landmarks (or Observations, dependent on which complex is used)
% list1 = edge list
% list2 = face list
% list3 = tetrahedra list 

function [list1, list2, list3] = mountain(X, list1, list2, list3)

% Load mountain range coordinates
load('Mountain.mat');

% Find convex hull of Mountain range coordinates
M_hull = convhull(Mountain);

% Get (x,y) coordinates of the points in the convex hull
M = Mountain(M_hull,:);

intersect = [];

% This nested for loop determines if an edge intersects the convex hull of
% the mountain range and creates a list of which rows in the list of edges
% intersect with the mountain range
for i = 1:length(M)-1
    
    for j = 1:length(list1)

        x = [X(list1(j,1),1) X(list1(j,2),1) M(i,1) M(i+1,1)];

        y = [X(list1(j,1),2) X(list1(j,2),2) M(i,2) M(i+1,2)];

        dt1 = det([1,1,1;x(1),x(2),x(3);y(1),y(2),y(3)])...
            *det([1,1,1;x(1),x(2),x(4);y(1),y(2),y(4)]);
        
        dt2 = det([1,1,1;x(1),x(3),x(4);y(1),y(3),y(4)])...
            *det([1,1,1;x(2),x(3),x(4);y(2),y(3),y(4)]);

        if(dt1 <= 0 && dt2 <= 0)
            
            if isempty(intersect)
                
                intersect = [j];
                
            else 
                
                intersect = [intersect; j];
                
            end;

        end;

    end;
    
end;

% Remove redundancies
intersect = unique(intersect);

% Remove faces
for i = length(intersect):-1:1
    
    for j = length(list2):-1:1
        
        if list1(intersect(i),1) == list2(j,1) && list1(intersect(i),2) == list2(j,2)
            
            list2(j,:) = [];
            
        end
        
    end
    
end

% Remove tetrahedra
for i = length(intersect):-1:1
    
    [row, col] = size(list3);
    
    for j = row:-1:1
        
        if list1(intersect(i),1) == list3(j,1) && list1(intersect(i),2) == list3(j,2)
            
            list3(j,:) = [];
            
        end
        
    end
    
end

% Remove edges
for i = length(intersect):-1:1
    
    list1(intersect(i),:) = [];
    
end
