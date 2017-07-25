% function to integrate the data around xPos with specified width
%
% INPUT
% data          = read in data that should be integrated
% xPos          = x-position where to integrate
% width         = plus-minus range around xPos to integrate
%
% OUTPUT
% integrated    = integrated data to be mapped

function integrated = mono_integrate_data(data, xPos, width)

% find requested data
integrationData = data.YData(xPos + width >= data.XData &...
                             xPos - width <= data.XData);
% sum it all up
integrated = sum(integrationData);