function list = intersect(X,list,M)

M_list = nchoosek(1:length(M),2);

intersect = [];

for i = 1:length(M_list)
    
    for j = 1:length(list)

        x = [X(list(j,1),1) X(list(j,2),1) M(M_list(i,1),1) M(M_list(i,2),1)];

        y = [X(list(j,1),2) X(list(j,2),2) M(M_list(i,1),2) M(M_list(i,2),2)];


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

intersect = unique(intersect);

for i = length(intersect):-1:1
    
    list(intersect(i),:) = [];
    
end;

