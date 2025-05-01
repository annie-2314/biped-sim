% Assuming 'simlogImportedURDF' contains your simulation log data

% List of joints to extract data from
joint_names = {'left_hip_frontal', 'right_hip_sagittal', 'left_knee', 'right_knee'};

% Initialize a figure for plotting
figure;
hold on;

% Loop through each joint and plot its position over time
for i = 1:length(joint_names)
    joint_name = joint_names{i};
    
    % Construct the path to the joint position data
    joint_path = ['simlogImportedURDF.', joint_name, '.Rz.q.series'];
    
    % Extract time vector and position data
    time_vector = eval([joint_path, '.time']);
    joint_position = eval([joint_path, '.values']);
    
    % Plot the joint position
    plot(time_vector, joint_position, 'DisplayName', strrep(joint_name, '_', ' '));
end

% Adding labels and legend
xlabel('Time (s)');
ylabel('Joint Position (rad)');
title('Joint Positions Over Time');
legend;
grid on;
hold off;
