% function to map measured data from the MonoVista
% 
% INPUT
% data      = read in data that should be displayed
% xDim      = dimension of the data in x
% yDim      = dimension of the data in y
% type      = type of integration ('whole', 'part', 'integrated')

function mono_map_data(data, steps, xDim, yDim, type)

% fill integrated data into matrix to prepare plotting
A = zeros(yDim, xDim);
integrated = [];

switch type    
    case 'whole'
        % simple integration of the whole data
        for k = 1:length(data)
            % integrate and put in one vector
            integrated = [integrated;sum(data(k).YData)];
        end
        
    case 'part'
        % integrate in a given range
        for k = 1:length(data)
            integrated = [integrated;...
                          mono_integrate_data(data(k), 100, 20)];
        end
        
    case 'integrated'
        integrated = data(1).YData;
        
    otherwise
    disp('not defined');
end

% fill the data to the matrix
for k = 1:yDim
    for n = 1:xDim
        A(k, n) = integrated(n + (k-1) * xDim);
    end
end

% filp up and down to be correctly oriented
A = flipud(A);

% plot the whole stuff and get all the handles
fig = figure;       % create new figure
im = imagesc(A);    % plot command
ax = gca;           % get current axes to enable manipulations
c = colorbar;       % show color scale

% making the plot nice
fontsize = 12;

ax.XTick = 1:steps:xDim;    % create vectors for labeling x- and
ax.YTick = 1:steps:yDim;    % y-axis with respect to step width
ax.XTickLabel = (ax.XTick) * steps;             % Multiply with stepwidth
ax.YTickLabel = (ax.YTick(end:-1:1)) * steps;   % to generate correct scale

ax.XLabel.String = 'Position (µm)';     % label x- and 
ax.YLabel.String = 'Position (µm)';     % y-axis
ax.FontSize = fontsize;                 % set font size
ax.LabelFontSizeMultiplier = 1;         % set font size multiplier to 1

axis equal;     % x- and y-axis equal
axis tight;     % set axis limits to data range

c.Label.String = 'Intensität (a.u.)';   % label colorbar
c.FontSize = fontsize;                  % set font size