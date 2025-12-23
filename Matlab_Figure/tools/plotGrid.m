function plotGrid(mesh,data)
  x=mesh.nodes.x;
  y=mesh.nodes.y;
  tri=[mesh.elems.node1 mesh.elems.node2 mesh.elems.node3];
  trisurf(tri,x,y,data)
  view(2)
  shading flat
  axis equal tight
