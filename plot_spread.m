function [midpoint, d] = plot_spread(x,y)
% Function that takes x and y values of different shots
% Then it calculates the midpoint and the mean distance/spread of each shot
% from the midpoint. Finally it plots the midpoint as an asterix and the
% average deviation as a circle around it

meanx = mean(x)
meany = mean(y)
midpoint = [meanx,meany]
N = length(x)
% Using Euclidian Distance 
d = sum(sqrt((x-meanx).^2 + (y-meany).^2))  / N

end

