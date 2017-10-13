%% PART 1
% Test Sphere Function --> Works
r1 = [0 2; 3 -4]
r2 = [1 2]
r3 = 3
volumes1 = Sphere_volume(r1)
volumes2 = Sphere_volume(r2)
volumes3 = Sphere_volume(r3)

%% PART 2 UNITS in km and km^3
% Calculate Volume of Troposphere
r_earth = 6370;
r_trop = r_earth + 15;
V_earth = Sphere_volume(r_earth); % 1.083E^12 km^3
V_trop = Sphere_volume(r_trop) - V_earth; % 7.666E^9 km^3

%% PART 3
heights = [15, 50, 80, 110]
[V_earth, V_layers] = Sphere_layer_volume(r_earth, heights) % Gives the correct output

