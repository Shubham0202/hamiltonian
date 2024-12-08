
function printCycle(path)
    n = length(path);
    for i = 1:n
        disp(path(i));
    end
    disp(path(1)); 
endfunction
function findHamiltonianCycles(graph, path, pos, n)
    if pos == n then
        if graph(path(n), path(1)) == 1 then
            printCycle(path);
        end
        return;
    end
    for v = 2:n
        if isSafe(graph, path, v, pos, n) then
            path(pos + 1) = v;  // Add vertex v to the path
            findHamiltonianCycles(graph, path, pos + 1, n);
            path(pos + 1) = -1;
        end
    end
endfunction
function safe = isSafe(graph, path, v, pos, n)
    if graph(path(pos), v) == 0 then
        safe = %f;
        return;
    end
    for i = 1:pos-1
        if path(i) == v then
            safe = %f;
            return;
        end
    end
    safe = %t;
endfunction

function hamiltonianCycle(graph, n)
    path = -ones(1, n);
    path(1) = 1; // Start from the first vertex (arbitrary choice)
    findHamiltonianCycles(graph, path, 1, n);
endfunction
graph = [
    0, 1, 1, 1;
    1, 0, 1, 1;
    1, 1, 0, 1;
    1, 1, 1, 0
];

n = 4;
hamiltonianCycle(graph, n);
