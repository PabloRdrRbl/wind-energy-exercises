%% Exercise 1: Wind Conditions
%
% Introduction to Wind Energy
% Exercises sesion

%% Data loading

file_name = 'klih1h2015.txt';

data = load(file_name);


%% Data cleaning and formating

wind_speed_column = 7;
wind_direction_column = 6;

% The find funtion returns the linear indices corresponding to the nonzero 
% entries of the input array.

% Find was the approach suggested by the teacher, however using logical
% indexing its better in terms of performance.

% Wrong meassuring data for wind direction and wind speed is written 
% artificially as 999 and 99 respectively.

% For the wrong measure we set all the data writed in this time to an empty
% element.

data(data(:, wind_speed_column) == 99, :) = [];
data(data(:, wind_direction_column) == 999, :) = [];

% It is also required to remove the data associated with wind speed equal
% to zero.

data(data(:, wind_speed_column) == 0, :) = [];

figure();
plot(data(:, wind_speed_column), 'r', 'LineWidth', 1, 'LineStyle', '-')
grid on

figure();
plot(data(:, wind_direction_column), 'b', 'LineWidth', 1, 'LineStyle', '-')
grid on


%% Wind rose

% Using just 16 sectors for the rose.
sector_bins = 16;
bin_size = 360 / sector_bins;

% Grad to rad.
direction_vector = [0:bin_size:360] .* pi / 180;
wind_direction_radians = data(:, wind_direction_column) .* pi / 180;

figure();
rose(wind_direction_radians, direction_vector);
xlabel(['Wind Rose  ', num2str(bin_size), ' deg sectors'])
view(90, -90)  % Rotation of the axes
zoom out