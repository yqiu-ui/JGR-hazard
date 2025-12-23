function data=writeGR3(data,fn,edgexy,hmin)
%
% writeGR3(data,fn,[edgexy,hmin])
%
% Writes SCHISM gr3 file, assuming 'data' struct is in same format as given by readGR3.m
%
% OPTIONAL: define edgexy either as a file (Blue Kenue xyz point file
% format), or as a Nx2 matrix of xy points.  The edges will be used to
% define a single open boundary and a single land boundary, using the specified
% threshold depth hmin
%

fid=fopen(fn,'w');

nnode=length(data.nodes.id);
nelem=length(data.elems.id);

% 1st line: header
fprintf(fid,'%s\n',data.header);

% 2nd line: number of elements and nodes in the horiz grid
fprintf(fid,'%d %d\n',[nelem nnode]);

% next nnode lines: node,x,y,depth
fprintf(fid,'%d %f %f %e\n',[double(data.nodes.id) data.nodes.x data.nodes.y data.nodes.data]');

% nelem connectivity entries: elem,type,node1,node2,node3 (assume 3-node, triangular only)
fprintf(fid,'%d %d %d %d %d\n',[data.elems.id data.elems.type data.elems.node1 data.elems.node2 data.elems.node3]');

% if optional input of edgexy points is used, convert these to open
% boundaries
if(exist('edgexy'))

  % handle case where edgexy points to a blue kenue xyz points file
  if(isstr(edgexy))
    fid=fopen(edgexy);
    line='';
    while(~strcmp(line,':EndHeader'))
      line=fgetl(fid);
    end
    edgexy=fscanf(fid,'%f',[3 inf])';
    % edgexy=edgexy(:,1:2);  % discard z
  end

  % locate the edgexy points in the hgrid, to define boundary data
  data.openbound(1).node=[];
  data.landbound(1).node=[];
  data.landbound(1).isisland=0;
  for i=1:size(edgexy,1)
    [~,ind]=min((data.nodes.x-edgexy(i,1)).^2+(data.nodes.y-edgexy(i,2)).^2);
    itsland=0;  % initialize "it's land" as false
    if(size(edgexy,2)==2)
      if(data.nodes.data(ind)<hmin)
        itsland=1;
      end
    else  % optional 3rd col in edgexy provides logical value for "land or not land"
      if(edgexy(i,3)==1)
        itsland=1;
      end
    end
    if(itsland)  % if land then add to land boundary list
      data.landbound(1).node(end+1)=data.nodes.id(ind);
    else  % if not land then this add to open boundary list
      data.openbound(1).node(end+1)=data.nodes.id(ind);
    end
  end
end

% check: some gr3 files have boundary information, others don't
if(~isfield(data,'openbound') & ~isfield(data,'landbound'))
  fclose(fid);
  return;
end

% for some weird reason, can't write to file at this point?  No idea why
% but re-opening the file seems to help...
fclose(fid);
fid=fopen(fn,'a');

% open boundaries
if(isfield(data,'openbound'))
  nobound=length([data.openbound]);
  fprintf(fid,'%d = Number of open boundaries\n',nobound);
  totalnodes=0;
  for i=1:nobound
    thisnonodes=length(data.openbound(i).node);
    totalnodes=totalnodes+thisnonodes;
  end
  fprintf(fid,'%d = Total no. of open boundary nodes\n',totalnodes);
  for i=1:nobound
    thisnonodes=length(data.openbound(i).node);
    fprintf(fid,'%d = nodes in next segment\n',thisnonodes);
    fprintf(fid,'%d\n',data.openbound(i).node);  % all nodes on this segment
  end
end

% land boundaries
if(isfield(data,'landbound'))
  nlbound=length([data.landbound]);
  fprintf(fid,'%d = Number of land boundaries\n',nlbound);
  totalnodes=0;
  if(isfield(data.landbound(1),'node'))
    for i=1:nlbound
      thisnlnodes=length(data.landbound(i).node);
      totalnodes=totalnodes+thisnlnodes;
    end
  end
  fprintf(fid,'%d = Total no. of land boundary nodes\n',totalnodes);
  if(isfield(data.landbound(1),'node'))
    for i=1:nlbound
      thisnlnodes=length(data.landbound(i).node);
      thisisisland=data.landbound(i).isisland;
      fprintf(fid,'%d %d = nodes in next segment\n',[thisnlnodes thisisisland]);
      fprintf(fid,'%d\n',data.landbound(i).node);  % all nodes on this segment
    end
  else
    fprintf(fid,'%d %d = nodes in next segment\n',[0 0]);
  end
end

fclose(fid);
