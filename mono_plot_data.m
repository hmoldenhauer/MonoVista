% function to plot measured data

function mono_plot_data(data, spectra)

fig = figure;   % create new figure
h = plot(data(spectra).XData, data(spectra).YData);     % plot command
ax = gca;       % get current axes to enable manipulations

% making the plot nice
fontsize = 12;

ax.XLabel.String = 'Raman Shift (cm-1)';    % label x- and 
ax.YLabel.String = 'Intensity (a.u.)';      % y-axis
ax.FontSize = fontsize;                     % set font size

axis tight;     % set axis limits to data range