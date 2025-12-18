clear; clc; clf;

NameOfNetwork = 'Complex Mesh-Star-Ring Hybrid';
NumberOfNodes = 25;

MeshS = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 1]; 
MeshE = [2 10 3 9 4 8 5 7 6 1 7 2 8 3 9 4 10 5];
StarS = [5 11 11 11 11 11 11 11];
StarE = [11 12 13 14 15 16 17 11]; 
RingS = [10 18 19 20 21 22 23 24 25];
RingE = [18 19 20 21 22 23 24 25 18];

S = [MeshS, StarS, RingS];
E = [MeshE, StarE, RingE];

XMesh = [400 500 600 600 500 400 300 200 200 300]; 
YMesh = [400 400 500 600 700 700 600 500 400 300];
XStar = [700 750 850 900 850 750 700 650]; 
YStar = [800 900 950 900 800 700 650 700];
XRing = [100 50 0 0 50 150 200 150]; 
YRing = [200 150 100 50 0 0 50 150];

XCoords = [XMesh, XStar(2:8), XRing]; 
YCoords = [YMesh, YStar(2:8), YRing];

//a. Display the created topology
//b. Number the nodes and edges
[HybridGraph] = NL_G_MakeGraph(NameOfNetwork, NumberOfNodes, S, E, XCoords, YCoords);
WindowIndex = 1;
[Visual1] = NL_G_ShowGraphNE(HybridGraph, WindowIndex); 
xtitle("Requirement A & B: Numbered Topology Display", "X-Pos", "Y-Pos");

//c. Colour the nodes and edges.
AllNodes = [1:25]; // This selects all 25 nodes
AllEdges = [1:size(S, '*')]; // This selects all edges
NodeColor = 3;       // Green
EdgeColor = 5;       // Red
BorderThickness = 10;
NodeDiameter = 28;
EdgeWidth = 4;

[TempGraph, n] = NL_G_HighlightNodes(HybridGraph, AllNodes, NodeColor, BorderThickness, NodeDiameter, 2);
[FinalGraph, e] = NL_G_HighlightEdges(TempGraph, AllEdges, EdgeColor, EdgeWidth, 2);
xtitle("Requirement C: All 25 Nodes and All Edges Colored");

//Node Colouring
// Explicitly coloring all nodes 1 to 25 again to ensure visibility
AllNodesToColor = [1:25]; 
NodeColorChoice = 5; // Red color for all nodes
[ColorGraph, cn] = NL_G_HighlightNodes(FinalGraph, AllNodesToColor, NodeColorChoice, BorderThickness, NodeDiameter, 3);
xtitle("Node Colouring: All Nodes (1-25) Successfully Colored", "X-Pos", "Y-Pos");

//d. Print the number of edges every node has along with the node with maximum edges.
disp('--- Edge Count Per Node ---');
MaxEdges = 0;
NodeWithMax = 0;
for i = 1:NumberOfNodes
    [NodeEdges] = NL_G_EdgesOfNode(HybridGraph, i);
    Count = size(NodeEdges, '*');
    printf('Node %d: %d edges\n', i, Count);
    if Count > MaxEdges then
        MaxEdges = Count;
        NodeWithMax = i;
    end
end
printf('\nNode with Maximum Edges: Node %d (Count: %d)\n', NodeWithMax, MaxEdges);

//e. Print the total number of nodes and edges.
[TNodes, TEdges] = NL_G_GraphSize(HybridGraph);
printf('\nTotal Number of Nodes: %d\n', TNodes);
printf('Total Number of Edges: %d\n', TEdges);
