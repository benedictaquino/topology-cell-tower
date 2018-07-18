R = 35
X = Towns
Y = SPRINT_Towers

edge_list = complexEdges(R,X,Y);
face_list = complexFaces(R,X,Y);
tetra_list = comlexTetra(R,X,Y);

vx = [X(edge_list(:,1),1)';X(edge_list(:,2),1)'];
vy = [X(edge_list(:,1),2)';X(edge_list(:,2),2)'];
vz = [0'; 

plot3(vx,vy,vz);
    
patch('Faces',face_list,'Vertices',X,'FaceColor','b');

alpha(0.15);