function makeEmptyTide(tidefn,hgridfn,nlayers)
%
% makeEmptyTide(tidefn,hgridfn,nlayers)
%
% defines an bctides.in file with all zeros, using the open boundary
% information in hgridfn
%
% usually tidefn='bctides.in', and hgridfn='hgrid.gr3'
%

% read grid
hgrid=readGR3(hgridfn);

% make format string for nlayers
nlayerfmt=[];
for i=1:nlayers
  nlayerfmt=[nlayerfmt ' %e'];
end
nlayerfmt=[nlayerfmt '\n'];

% write bctides
fid=fopen(tidefn,'w');
dnum=now;
dstr=[datestr(dnum,'dd/mm/yyyy') ' ' datestr(dnum,'HH:MM')];
fprintf(fid,[dstr '\n']);
fprintf(fid,['0 40. ntip\n']);
fprintf(fid,['0 nbfr\n']);
nope=length([hgrid.openbound]);
fprintf(fid,[num2str(nope) ' nope\n']);
for i=1:nope
  nelem=length(hgrid.openbound(i).node);
  fprintf(fid,[num2str(nelem) ' 0 -1 0 0\n']);
  fprintf(fid,['eta_mean\n']);
  fprintf(fid,'%e\n',zeros(nelem,1));
  fprintf(fid,['vn_mean\n']);
  fprintf(fid,nlayerfmt,zeros(nelem,nlayers));
end
fclose(fid);
