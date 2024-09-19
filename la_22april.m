%la _ project 22/04/2023

% Define input graph
vertices = [1,1; 2,2; 3,1; 4,3; 5,2];
dist_threshold = 2;

% Calculate distance matrix
dist_matrix = pdist2(vertices, vertices);

% Compute adjacency matrix
adj_matrix = dist_matrix < dist_threshold & dist_matrix > 0;

% Compute colors for graph
colors = conncomp(graph(adj_matrix));

% Compute D-S array with diagonal elements
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

% Print outputs
disp("Input graph:");
disp(vertices);
disp("Distance matrix:");
disp(dist_matrix);
disp("Adjacency matrix:");
disp(adj_matrix);
disp("Colors:");
disp(colors);
disp("D-S array:");
disp(ds_array);
