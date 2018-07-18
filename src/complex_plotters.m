

for i = 0:2
    
    edge_list = complexEdges(15+10*i,X,Y);
    
    vx= [X(edge_list(:,1),1)';X(edge_list(:,2),1)'];
    vy= [X(edge_list(:,1),2)';X(edge_list(:,2),2)'];
    
    figure(100+i);

    plot(vx,vy);
    
    edge_list = intersect(X,edge_list,M);
    
    vx= [X(edge_list(:,1),1)';X(edge_list(:,2),1)'];
    vy= [X(edge_list(:,1),2)';X(edge_list(:,2),2)'];
    
    figure(200+i);

    plot(vx,vy);
    
    edge_list = complexEdges(15+10*i,Y,X);
    
    vx= [Y(edge_list(:,1),1)';Y(edge_list(:,2),1)'];
    vy= [Y(edge_list(:,1),2)';Y(edge_list(:,2),2)'];
    
    figure(110+i);
    
    plot(vx,vy);
    
    edge_list = intersect(Y,edge_list,M);
    
    vx= [Y(edge_list(:,1),1)';Y(edge_list(:,2),1)'];
    vy= [Y(edge_list(:,1),2)';Y(edge_list(:,2),2)'];
    
    figure(210+i);

    plot(vx,vy);

end

saveas(100,'VERIZON_Landmark_No_Mountains_15','bmp')
saveas(200,'VERIZON_Landmark_Mountains_15','bmp')
saveas(110,'VERIZON_Observation_No_Mountains_15','bmp')
saveas(210,'VERIZON_Observation_Mountains_15','bmp')
saveas(101,'VERIZON_Landmark_No_Mountains_25','bmp')
saveas(201,'VERIZON_Landmark_Mountains_25','bmp')
saveas(111,'VERIZON_Observation_No_Mountains_25','bmp')
saveas(211,'VERIZON_Observation_Mountains_25','bmp')
saveas(102,'VERIZON_Landmark_No_Mountains_35','bmp')
saveas(202,'VERIZON_Landmark_Mountains_35','bmp')
saveas(112,'VERIZON_Observation_No_Mountains_35','bmp')
saveas(212,'VERIZON_Observation_Mountains_35','bmp')