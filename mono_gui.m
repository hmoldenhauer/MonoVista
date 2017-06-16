% Gui to analyse map data from MonoVista


% Data input via dialog box:

prompt = {'Enter datafolder:','Enter matrix size, seperated by space:'};
dlg_title = 'Data input';
num_lines = 1;
datainput = inputdlg(prompt,dlg_title,num_lines);

% Read data for analysis

datafolder = datainput{1};
dim = str2num(datainput{2});
xDim = dim(1);
yDim = dim(2);

% create matrix of spectra

mono_read(datafolder, 'raman');
mono_map_data(data,xDim,yDim)
