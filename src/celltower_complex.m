%% This function creates the edges for a landmark or observation complexes
% Input Parameters:
% R = Radius of distance
% X = Landmarks (or Observations)
% Y = Observations (or Landmarks)

function [edge_list, face_list, tetra_list] = celltower_complex(R,X,Y)

    X_dist = pdist2(X,Y);

    [row, col] = find(X_dist < R);

    edge_list = [];

    % Find which pairs of points in X are both in range of a point in Y
    for i = 1:length(row)
        Z = find(col == col(i));
        edge_list = unique([edge_list ; nchoosek(row(Z),2)],'rows');
    end

    face_list = [];
    
    % Find which threesomes of points in X are both in range of a point in Y
    for i = 1:length(row)
        for j = i+1: length(row)
            Z = find(col == col(i) == col(j));
            face_list = unique([face_list ; nchoosek(row(Z),3)],'rows');
        end
    end

    tetra_list = [];

    % Find which foursomes of points in X are both in range of a point in Y
    for i = 1:length(row)
        for j = i+1: length(row)
            for k = j+1:length(row)
                Z = find(col == col(i) == col(j) == col(k));
                tetra_list = unique([tetra_list ; nchoosek(row(Z),4)],'rows');
            end
        end
    end
    
end
