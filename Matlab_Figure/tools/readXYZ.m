function [x,y,z]=readXYZ(fn)
%
% [x,y,z]=readXYZ(fn)
%
% Reads a blue kenue .xyz points file
%

fid=fopen(fn);
line='';
while(~strcmp(line,':EndHeader'))
  line=fgetl(fid);
end
data=fscanf(fid,'%f',[3 inf])';
x=data(:,1);
y=data(:,2);
z=data(:,3);
