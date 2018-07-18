%% landmark_navigation 
% This script creates a filtered simplicial complex.
% The resulting simplicial is either a landmark or observation complex,
% depending on which set of points is set as X and Y
% i.e. if X is landmarks, it creates a landmark complex

% load javaplex and relevant data
load_javaplex

load('SPRINT_Towers.mat');
load('Towns.mat');
 
X = SPRINT_Towers;
Y = Towns;

% Create a simplicial complex stream
streamA = api.Plex4.createExplicitSimplexStream();

% Add vertices to complex at time t = 0
for j=0:length(X)
    
    streamA.addVertex(j,0);
    
end;

% Adding edges, faces, and tetrahedra, at times 1, 2, 3 based on
% what distance R the simplices appear

for i=0:2
    
    R = 15+10*i;
    
    figure(i+100)
    
    % Compute edges
    [list1, list2, list3] = celltower_complex(R,X,Y);
    
    % Remove simplices that intersect with the mountain range
    [edge_list, face_list, tetra_list] = mountain(X, list1, list2, list3, M);
    
    % Plotting edges and faces
    vx = [X(edge_list(:,1),1)';X(edge_list(:,2),1)'];
    vy = [X(edge_list(:,1),2)';X(edge_list(:,2),2)'];
    
    plot(vx,vy);
    
    patch('Faces',face_list,'Vertices',X,'FaceColor','b');

    alpha(0.15);
    
    % Add edges, faces, and tetrahedra to stream
    for j=1:length(edge_list)
    
        streamA.addElement( edge_list(j,:), i+1 ); 
    
    end;

    for j=1:length(face_list)
    
        streamA.addElement( face_list(j,:), i+1 );
    
    end;
    
    [row, col] = size(tetra_list);
    
    for j=1:row
    
       streamA.addElement( tetra_list(j,:), i+1 );
    
    end;
        
end;

% Fix the stream for calculations.
streamA.finalizeStream();

% Find total number of simplices
num_simplices = streamA.getSize()

% Begin homology calculations for dimensions less than 3 and mod 2
persistenceA = api.Plex4.getModularSimplicialAlgorithm(3, 2);

% Compute persistent homology bars
complex_intervals = persistenceA.computeIntervals(streamA);

% store the intervals as Matlab matrices
intervals_dim0 = edu.stanford.math.plex4.homology.barcodes.BarcodeUtility.getEndpoints(complex_intervals, 0, 0);
intervals_dim1 = edu.stanford.math.plex4.homology.barcodes.BarcodeUtility.getEndpoints(complex_intervals, 1, 0);

% get the infinite barcodes
infinite_barcodes = complex_intervals.getInfiniteIntervals()

% print out betti numbers array
betti_numbers_array = infinite_barcodes.getBettiSequence()

% print out betti numbers in form {dimension: betti number}
betti_numbers_string = infinite_barcodes.getBettiNumbers()
 
% set plot options - plot in eps format
options.filename = 'barcodes';
options.file_format = 'eps';
options.caption = 'Complex';
options.max_filtration_value = 4;

% create the barcode plots
plot_barcodes(complex_intervals, options);


