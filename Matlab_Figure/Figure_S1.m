clc;
addpath('tools','-end');
mesh=readGR3('./Data/hgrid.gr3');
data = mesh.nodes.data;
plotGrid(mesh,data);
function plotGrid(mesh,data)
  x=mesh.nodes.x;
  y=mesh.nodes.y;
  tri=[mesh.elems.node1 mesh.elems.node2 mesh.elems.node3];
  trisurf(tri,x,y,data,'FaceColor','none','EdgeColor','k');
  
  view(2)
end