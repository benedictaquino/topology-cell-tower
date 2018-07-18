%% This function creates the faces for a landmark or observation complexes
% Input Parameters:
% R = Radius of distance
% X = Landmarks (or Observations)
% Y = Observations (or Landmarks)

function face_list = complexFaces(R,X,Y)

X_dist = pdist2(X,Y);

[row, col] = find(X_dist < R);

Z = [row,col];

face_list = [];

for i = 1:length(Z)
    
    for j = i+1:length(Z)
        
        for k = j+1:length(Z)
        
            if (Z(i,2) == Z(j,2)) && (Z(j,2) == Z(k,2))
            
                % If three landmarks share an observation point, then add a
                % face to face_list
                
                current_face = [Z(i,1), Z(j,1), Z(k,1)];
            
                if isempty(face_list)
                
                    face_list = current_face;
                
                else
                
                    face_list = [face_list; current_face];
                
                end;
                
            end;
            
        end;
            
    end;
    
end;

% Remove redundancies
face_list = unique(face_list, 'rows');











    