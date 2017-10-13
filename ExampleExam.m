% Example Exam

clear all
close all
x=	[-1,	2,	2,	1,	2,	0,	2,	-3,	2,	1,	2,	3,	-1];	
y=	[2,	-1,	2,	0,	0,	1,	3,	2,	-1,	0,	1,	3,	1];	

%plot_shots(x,y)
%centers = [0,0; 0,0; 0,0; 0,0]
%radii = [2,4,6,8]
%viscircles(centers, radii)

[midpoint, d] = plot_spread(x,y)

% TEIL 2

load('ERPdata.mat')
plot(pxl, pyl, 'r')
alpha(0.5)
hold on
plot(pxr, pyr, 'b')
hold off
alpha(0.5)
axis equal
xlabel('x movement in 1/10 cm')
ylabel('y movement in 1/10 cm')
load('ERPdata.mat')
n_trials = size(speed_r,1) % 168

% Determine whether they used the right hand
for i = 1:n_trials
plot(time, speed_r(i,:), 'DisplayName',(sprintf('trial %d',i)))
hold on
end
legend('show')

% Realize that there are also fluctuation when they didn't use the hand but
% in a magnitude 100 times smaller
% Criterion threshold = 100
threshold = 100
choices = zeros(1,n_trials)
for i = 1:n_trials
    if max(speed_r(i,:))>threshold
        choices(i)=1
    end
end

% Compute Right Hand choices per Target
% First see what target values there are
targets_values = unique(targets) % returns 1:10
right_counts =  zeros(1,11) % counts right hand usage per target
target_counts = zeros(1,11) % How often did each target occurr
%(1st entry stands for target =1 etc.)

% Loop over each trial and count
for i = 1:n_trials
    if choices(i) == 1 % If right hand moved then increment
    right_counts(targets(i)) = right_counts(targets(i))+1
    end
    target_counts(targets(i)) = target_counts(targets(i))+1
end
figure()
Pright = right_counts ./ target_counts
bar(1:11,Pright)
ylabel('Percentage of using right hand')
xlabel('Target value')

% Compute Reaction Time per Target
rt = zeros(1, n_trials); %REACTION TIME
criterion = 150
for i = 1:n_trials
    if choices(i)==0 % USE LEFT
        rt_index = min(find(speed_l(i,:)>150))
        rt(i) = time(rt_index)
    else % USE RIGHT
        rt_index = min(find(speed_r(i,:)>150))
        rt(i) = time(rt_index)
    end
end

figure()
x_rt = 0.1:0.05:0.5
hist(rt, x_rt)
hold on
ylimits = get(gca, 'YLim')
r_mean = mean(rt)
%figure()
plot([r_mean, r_mean], ylimits, 'r-', 'DisplayName', 'Mean Reaction Time')
legend('show')

