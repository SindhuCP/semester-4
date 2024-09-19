% %la project with colors
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
% G1 = graph(A);
% 
% % Color the nodes of the original graph
% C1 = conncomp(G1);
% colors1 = zeros(length(C1),3);
% for i = 1:length(C1)
%     colors1(i,:) = rand(1,3);
% end
% 
% % Plot the original graph
% subplot(1,2,1)
% plot(G1,'NodeColor',colors1);
% title('Original Graph');
% 
% % Create a new graph object
% G2 = graph(A);
% 
% % Add new vertices to connect them
% for i = 1:length(N)
%     for j = i+1:length(N)
%         if D(N(i),N(j)) == 2 % Check if the distance between the two vertices is exactly 2
%             % Add a new vertex between the two vertices
%             G2 = addnode(G2, 1);
%             G2 = addedge(G2, N(i), size(G2.Nodes,1), 1); % Add edge between vertex i and new vertex
%             G2 = addedge(G2, N(j), size(G2.Nodes,1), 1); % Add edge between vertex j and new vertex
%         end
%     end
% end
% 
% % Color the nodes of the updated graph
% MIS = maximal_independent_set(G2);
% colors2 = zeros(size(G2.Nodes,1),3);
% for i = 1:length(MIS)
%     colors2(MIS(i),:) = rand(1,3);
% end
% 
% % Add labels to the new vertices
% newNodes = (size(G2.Nodes,1)-length(N)+1):size(G2.Nodes,1);
% labels = arrayfun(@(x) sprintf('v%d',x), newNodes, 'UniformOutput', false);
% G2.Nodes(newNodes,:).Name = labels;
% 
% % Plot the updated graph
% subplot(1,2,2)
% plot(G2,'NodeColor',colors2);
% title('Updated Graph');



vertices = [1,1; 2,2; 3,1; 4,3; 5,2];

dist_matrix = pdist2(vertices, vertices);

adj_matrix = dist_matrix < 2 & dist_matrix > 0;

colors = conncomp(graph(adj_matrix));


ds_array = zeros(size(adj_matrix));
for color = 1:max(colors)
    nodes = find(colors == color);
    distributor = nodes(1);
    ds_array(distributor, distributor) = -1;
    for node = nodes
        if ds_array(node, node) == 0
            neighbors = find(adj_matrix(node,:));
            ds_array(neighbors, node) = distributor;
            ds_array(node, neighbors) = distributor;
            ds_array(node, node) = color;
        end
    end
end








