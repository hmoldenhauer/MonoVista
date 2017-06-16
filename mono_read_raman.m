% function to read raman data measured with the MonoVista
% 
% VARIABLES
% datafolder = folder where subfolder with the requested data file
%

function data = mono_read_raman(datafolder)

%create structure that contains all the measured data
field1 = 'XData';       value1 = [];    % all x-data (raman shift)
field2 = 'YData';       value2 = [];    % all y-data (intensity)

data = struct(field1,value1,...
              field2,value2);
          
% read all files in the requested datafolder
files = dir(strcat(datafolder, '*.txt'));
numberOfFiles = length(files);

for k = 1:numberOfFiles
    % create filename
    filename = strcat(datafolder, files(k).name);
    
    % read data into structure
    data(k).XData = importdata(filename);
    data(k).YData = data(k).XData(:,2);
    data(k).XData = data(k).XData(:,1);
end