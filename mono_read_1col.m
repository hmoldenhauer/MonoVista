% function to read one-column data
% 
% all files with an '*.dat' ending in a folder will be read in
% 
% INPUT
% datafolder = folder where subfolder with the requested data file
% type       = type of the data read in
%
% OUTPUT
% data       = all data that is in datafolder is now in this variable

function data = mono_read_1col(datafolder, type)

%create structure that contains all the measured data
field1 = 'XData';       value1 = [];    % all integrated data

data = struct(field1,value1);
          
% read all files in the requested datafolder
files = dir(strcat(datafolder, type));
numberOfFiles = length(files);

for k = 1:numberOfFiles
    % create filename
    filename = strcat(datafolder, files(k).name);
    
    % read data into structure
    data(k).XData = importdata(filename);
end