% function to map measured data from the MonoVista
% 
% VARIABLES
% data      = read in data that should be displayed
% xDim      = dimension of the data in x
% yDim      = dimension of the data in y
%

function mono_map_data(data, xDim, yDim, type)

% fill integrated data into matrix to prepare plotting
A = zeros(yDim, xDim);

switch type
    case 'raman'
        % simple integration of the whole data
        integrated = [];
        for k = 1:length(data)
            integrated = [integrated;sum(data(k).YData)];
        end
        for k = 1:yDim
            for n = 1:xDim
                A(k, n) = integrated(n + (k-1) * xDim);
            end
        end
    case 'integrated'
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

% plot the whole stuff
%colormap(gray);
imagesc(A);
colorbar;
axis equal;
axis tight;