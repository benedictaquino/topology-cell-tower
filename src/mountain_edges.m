%% This function computes whether a mountain range is obstructing the connection between
%% a landmark and a cell tower

% Input Parameters:
% X = Landmarks (or Observations, dependent on which complex is used)
% list1 = edge list
% M = convex hull points of mountain ranges

function list1= mountain_edges(X, list1, M)

intersect = [];

% This nested for loop determines if an edge intersects the convex hull of
% the mountain range and creates a list of which rows in the list of edges
% intersect with the mountain range
for i = 1:length(M)-1
    
    for j = 1:length(list1)

        x = [X(list1(j,1),1), X(list1(j,2),1), M(i,1), M(i+1,1)];

        y = [X(list1(j,1),2), X(list1(j,2),2), M(i,2), M(i+1,2)];

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

% Remove edges
for i = length(intersect):-1:1
    
    list1(intersect(i),:) = [];
    
end
