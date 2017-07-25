% function to map measured data from the MonoVista
% 
% VARIABLES
% data      = read in data that should be displayed
% xDim      = dimension of the data in x
% yDim      = dimension of the data in y
% type      = type of measurement
%

function mono_map_data(data, steps, xDim, yDim, type)

% fill integrated data into matrix to prepare plotting
A = zeros(yDim, xDim);

switch type
    case 'raman'
        % simple integration of the whole data
        integrated = [];
        for k = 1:length(data)
            % integrate and put in one vector
            integrated = [integrated;sum(data(k).YData)];
        end
        
        % fill the integrated data to the matrix
        for k = 1:yDim
            for n = 1:xDim
                A(k, n) = integrated(n + (k-1) * xDim);
            end
        end
        
    case 'integrated'
        % fill the already integrated data into the matrix
        for k = 1:yDim
            for n = 1:xDim
                A(k, n) = data(1).YData(n + (k-1) * xDim);
            end
        end
        
    otherwise
    disp('not defined');
end

% filp up and down to be correctly oriented
A = flipud(A);

% plot the whole stuff and get all the handles
fig = figure;
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

c.Label.String = 'Intensität (a.u.)'    % label colorbar
c.FontSize = fontsize;                  % set font size