close all
clearvars

% compare to bs2_hue-5
%% material parameter
EI = 20000;
EA = 100*EI;

%% node coordinates
CoorNodes = [
    0, -4;
    3, 0;
    7, 0
    ];

numNodes = size(CoorNodes, 1);

xx = CoorNodes(:, 1); 
zz = CoorNodes(:, 2);

%% connectivity matrix
conn = [
    1, 2;
    2, 3
    ];

numEl = size(conn, 1);

%% element type
typeEl = ["ge2b"; "ge2a"];

%% inzidenz matrix
inz = [
    1, 2, 3, 4, 5, 6, 0, 0, 0;
    0, 0, 0, 1, 2, 3, 4, 5, 6
    ];

%% deformation vector (global)
D = [0, 0, 0, 4, 5, 6, 0, 0, 0];
D_red = find(D);

gDof = size(D, 2);

%% load
loadEl = zeros(numEl, 6);
loadEl(1,:) = load_f(2.5, 2.5, 25, 5, 0.8, 0.6, "ge2b");
loadEl(2,:) = load_q(0, 10, 4, 0, 1, "ge2a");
loadNodes = [0, 0, 0, 0, 0, 0, 0, 0, 0]';

F = formForces(gDof, numEl, loadEl, loadNodes, inz);
F_red = F(D_red);

%% stiffness matrix
stiffness = formStiffness(gDof, numEl, conn, inz, typeEl, xx, zz, EI, EA);
stiff_red = stiffness(D_red, D_red);

%% calc red system
D_red = stiff_red\F_red;