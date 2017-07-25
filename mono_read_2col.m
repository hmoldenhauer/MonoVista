% function to read two-column data
% 
% all files with an '*.txt' ending in a folder will be read in
% 
% INPUT
% datafolder = folder where subfolder with the requested data file
%
% OUTPUT
% data       = all data that is in datafolder is now in this variable

function data = mono_read_2col(datafolder, type)

%create structure that contains all the measured data
field1 = 'XData';       value1 = [];    % all x-data
field2 = 'YData';       value2 = [];    % all y-data

data = struct(field1,value1,...
              field2,value2);
          
% read all files in the requested datafolder
files = dir(strcat(datafolder, type));
numberOfFiles = length(files);

for k = 1:numberOfFiles
    % create filename
    filename = strcat(datafolder, files(k).name);
    
    % read data into structure
    data(k).XData = importdata(filename);
    data(k).YData = data(k).XData(:,2);
    data(k).XData = data(k).XData(:,1);
end