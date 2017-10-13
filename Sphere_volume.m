function [Volume] = Sphere_volume(r)
% Function takes as input the radius (or radii) of a sphere (or several
% spheres). For each radius it calculates the volume, defined by V =
% 4/3*Pi*r^3
% INPUT: r: scalar, vector or matrix
% OUTPUT: Volume = scalar, vector or matrix (depending on the input)

r_size = size(r);
% Only account for r-s that have max 2 dimensions
if length(r_size)>2
    Volume = nan;
    
else
Volume = zeros(r_size);
% Case Distinction for r = scalar; vector; matrix is not necessary because
% even a scalar in Matlab has dimensions (1,1), so it can be looped over
% dimension 1 and 2.
for i = 1:r_size(1)
    for j = 1:r_size(2)
        if r(i,j) > 0 % Only accept r>0
            Volume(i,j) = 4.0/3*pi*r(i,j)^3;
        else
            Volume(i,j) = nan;
        end
    end
end
end
end

