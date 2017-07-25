% function to read data measured with the MonoVista
% 
% INPUT
% datafolder = folder where subfolder with the requested data file
% columns    = number of columns of the measurement
% type       = type of the data (*.txt, *.dat, *.csv, etc.)
%
% OUTPUT
% data      = all data from datafolder is now in this variable

function data = mono_read(datafolder, columns, type)

% add datafolder and all subfolders to path in order to access all data
addpath(datafolder);

% choose which type of data should be used
switch columns
    case 1
        data = mono_read_1col(datafolder, type);
    case 2
        data = mono_read_2col(datafolder, type);
    otherwise
        disp('not defined');
end