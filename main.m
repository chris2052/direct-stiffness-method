close all
clearvars

% compare to bs2_hue-5
%% material parameter
EI = 20000;
EA = 100*EI;

%% node coordinates
nodeCoor = [
    0, -4;
    3, 0;
    7, 0
    ];

numNodes = size(nodeCoor, 1);

xx = nodeCoor(:, 1); 
zz = nodeCoor(:, 2);

%% connectivity matrix
conn = [
    1, 2;
    2, 3
    ];

GDof = 3*numNodes;

numEl = size(conn, 1);

%% load
loadEl = zeros(numEl, 6);
loadEl(1,:) = load_f(2.5, 2.5, 25, 5);
loadEl(2,:) = load_q(0, 10, 4);

loadVec = zeros(GDof, 1);

