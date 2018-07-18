%% This function creates the tetrahedra for a landmark or observation complex
% Input Parameters:
% R = Radius of distance
% X = Landmarks (or Observations)
% Y = Observations (or Landmarks)

function tetra_list = complexTetra(R,X,Y)

X_dist = pdist2(X,Y);

[row, col] = find(X_dist < R);

Z = [row,col];

tetra_list = [];

for i = 1:length(Z)
    
    for j = i+1:length(Z)
        
        for k = j+1:length(Z)
            
            for l = k+1:length(Z)
        
                if (Z(i,2) == Z(j,2)) && (Z(j,2) == Z(k,2) && (Z(k,2) == Z(l,2)))
                    
                    % If four landmarks share an observation point, add the
                    % tetrahedra to tetra_list
                    
                    current_tetra = [Z(i,1), Z(j,1), Z(k,1), Z(l,1)];
            
                    if isempty(tetra_list)
                
                        tetra_list = current_tetra;
                
                    else
                
                        tetra_list = [tetra_list; current_tetra];
                        
                    end;
                
                end;
                
            end;
            
        end;
            
    end;
    
end;

% Remove redundancies
tetra_list = unique(tetra_list, 'rows');








    