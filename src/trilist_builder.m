function [trilist] = trilist_builder(edge_list)

%% This function takes as it's input an edge list for a complex. It finds triples
%% of edges that connect three vertices--so make a triangle.
%%
%% The out put is the three column matrix of triangles that can be use for plotting purposes.
%%
%% Note that it produces a non-redundant list of triangles. 

trilist = [ ];

for i = 1:length(edge_list)
    
    for j=i:length(edge_list-i+1)
        
        [a1 , b1] = find(edge_list == edge_list(j,1));

        A1=zeros(1,length(a1));
        
        for k=1:length(a1)
    
            A1(k) = edge_list(a1(k),3-b1(k));
            
        end;
        
        [a2, b2] = find(edge_list == edge_list(j,2));

        A2=zeros(1,length(a2));
        
        for k=1:length(a2)
   
            A2(k) = edge_list(a2(k),3-b2(k));
            
        end;
    
        B = intersect(A1,A2); 
        
        for k=1:length(B)
            
            current_tri = [edge_list(j,:),B(k)];
            
            current_tri = intersect(current_tri,current_tri);
            
            if isempty(trilist)
                
                trilist = current_tri;
                
            else

                [ t_row t_col ] = size(trilist);

                Q = ones(t_row,1)* current_tri - trilist;

                if min(sum((Q.*Q)')) > 0 

                    trilist = [trilist; current_tri];

                end;
            end;
            
        end;
    end;
        
end;