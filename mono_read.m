% function to read data measured with the MonoVista
% 
% VARIABLES
% datafolder = folder where subfolder with the requested data file
% type       = type of the measurement
%
% TYPES
% 'raman'  - reads raman data
%          - the data is formated in two columns
%          - the first column is the raman shift
%          - the second column is the measured intensity
% 
% 'pl'     - reads pl data
%

function data = mono_read(datafolder, type)

% add datafolder and all subfolders to path in order to access all data
addpath(datafolder);                         % add to path

% choose which type of data should be used
switch type
    case 'raman'
        data = mono_read_raman(datafolder);
    case 'integrated'
        data = mono_read_integrated(datafolder);
    case 'pl'
        disp('pl');
    otherwise
        disp('not defined');
end