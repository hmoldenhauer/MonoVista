% function to plot measured data
%
% INPUT
% data      = read in data that should be displayed
% spectra   = spectrum to be plotted
%
% OUTPUT
% xMouse    = Mouse x-position in the graph after clicking
% yMouse    = Mouse y-position in the graph after clicking

function [xMouse, yMouse] = mono_plot_data(data, spectra)

fig = figure;   % create new figure
h = plot(data(spectra).XData, data(spectra).YData);     % plot command
ax = gca;       % get current axes to enable manipulations

% making the plot nice
fontsize = 12;

ax.XLabel.String = 'Raman Shift (cm-1)';    % label x- and 
ax.YLabel.String = 'Intensity (a.u.)';      % y-axis
ax.FontSize = fontsize;                     % set font size

axis tight;     % set axis limits to data range

[xMouse, yMouse] = ginput(1);   % get mouse data for approximate
                                % evaluation of data