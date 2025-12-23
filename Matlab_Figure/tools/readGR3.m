function data=readGR3(fn)
%
% data=readGR3(fn)
%
% reads SCHISM gr3 file
%

fid=fopen(fn,'r');

% 1st line: header
data.header=fgetl(fid);

% 2nd line: number of elements and nodes in the horiz grid
this=textscan(fid,'%d %d',1);
nelem=this{1};
nnode=this{2};

% next nnode lines: node,x,y,depth
this=textscan(fid,'%d %n %n %n',nnode);
data.nodes.id=this{1};
data.nodes.x=this{2};
data.nodes.y=this{3};
data.nodes.data=this{4};

% nelem connectivity entries: elem,type,node1,node2,node3 (assume 3-node, triangular only)
this=fscanf(fid,'%d',[nelem*5]);
this=reshape(this,[5 nelem]);
data.elems.id=this(1,:)';
data.elems.type =this(2,:)';
data.elems.node1=this(3,:)';
data.elems.node2=this(4,:)';
data.elems.node3=this(5,:)';

% check: some gr3 files have boundary information, others don't
if(feof(fid))
  fclose(fid);
  return;
end

% boundary definitions
nobound=fscanf(fid,'%d',1);  % no. of open boundaries
fgetl(fid);  % skip remainder of line
nobnodes=fscanf(fid,'%d',1);  % total no. of open boundary nodes
fgetl(fid);  % skip remainder of line
for i=1:nobound
  thisnonodes=fscanf(fid,'%d',1);  % no. of nodes for this segment
  fgetl(fid);  % skip remainder of line
  for j=1:thisnonodes
    data.openbound(i).node(j)=fscanf(fid,'%d',1);  % j'th node on this segment
  end
end
nlbound=fscanf(fid,'%d',1);  % no. of land boundaries
fgetl(fid);  % skip remainder of line
nlbnodes=fscanf(fid,'%d',1);  % total no. of open boundary nodes
fgetl(fid);  % skip remainder of line
for i=1:nlbound
  this=fscanf(fid,'%d',2);  % no. of nodes for this segment, and land/island id
  fgetl(fid);  % skip remainder of line
  data.landbound(i).isisland=this(2);
  thisnlnodes=this(1);
  for j=1:thisnlnodes
    data.landbound(i).node(j)=fscanf(fid,'%d',1);  % j'th node on this segment
  end
end

fclose(fid);
