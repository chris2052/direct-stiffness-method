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

numEl = size(conn, 1);

%% element type
typeEl = ['ge2b', 'ge2a'];

%% inzidenz matrix
inz = [
    1, 2, 3, 4, 5, 6, 0, 0, 0;
    0, 0, 0, 1, 2, 3, 4, 5, 6
    ];

%% deformation vector (global)
D = [0, 0, 0, 1, 1, 1, 0, 0, 0];

%% load
loadEl = zeros(numEl, 6);
loadEl(1,:) = load_f(2.5, 2.5, 25, 5);
loadEl(2,:) = load_q(0, 10, 4);

loadVec = zeros(GDof, 1);

