% function to read integrated data from maps.py
% 
% VARIABLES
% datafolder = folder where subfolder with the requested data file
%

function data = mono_read_integrated(datafolder)

%create structure that contains all the measured data
field1 = 'YData';       value1 = [];    % all integrated data

data = struct(field1,value1);
          
% read all files in the requested datafolder
files = dir(strcat(datafolder, '*.dat'));
numberOfFiles = length(files);

for k = 1:numberOfFiles
    % create filename
    filename = strcat(datafolder, files(k).name);
    
    % read data into structure
    data(k).YData = importdata(filename);
end