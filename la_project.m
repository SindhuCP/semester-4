% %la project
% 
% % Define the adjacency matrix
% A = [0 1 1 0 0 0;
%      1 0 1 1 0 0;
%      1 1 0 1 1 0;
%      0 1 1 0 1 1;
%      0 0 1 1 0 1;
%      0 0 0 1 1 0];
% 
% % Create a graph object
% G = graph(A);
% 
% % Calculate the shortest path between each pair of vertices
% D = distances(G);
% 
% % Find the vertices that are not directly connected
% N = find(sum(A) == 0); % non adjacent vertices
% 
% % Add new vertices and edges to connect them
% for i = 1:length(N)
%     for j = i+1:length(N)
%         if D(N(i),N(j)) <= 2 % Check if the distance between the two vertices is less than or equal to 2
%             G = addedge(G,N(i),N(j));
%         end
%     end
% end
% 
% % Plot the graph
% plot(G);

% Define the adjacency matrix
A = [0 1 1 0 0 0;
     1 0 1 1 0 0;
     1 1 0 1 1 0;
     0 1 1 0 1 1;
     0 0 1 1 0 1;
     0 0 0 1 1 0];

% Create a graph object
G = graph(A);

% Calculate the shortest path between each pair of vertices
D = distances(G);

% Find the vertices that are not directly connected
N = find(sum(A) == 0);

% Add new vertices to connect them
for i = 1:length(N)
    for j = i+1:length(N)
        if D(N(i),N(j)) == 2 % Check if the distance between the two vertices is exactly 2
            % Add a new vertex between the two vertices
            G = addnode(G, 1);
            G = addedge(G, N(i), size(G.Nodes,1), 1); % Add edge between vertex i and new vertex
            G = addedge(G, N(j), size(G.Nodes,1), 1); % Add edge between vertex j and new vertex
        end
    end
end

% Plot the graph
plot(G);


