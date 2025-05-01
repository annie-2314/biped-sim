% Extract time vector from one of the series (assuming both have the same time vector)
time_vector = simlogImportedURDF.left_hip_frontal.Rz.q.series.time;

% Extract position data for the left hip frontal joint
left_hip_frontal_position = simlogImportedURDF.left_hip_frontal.Rz.q.series.values;

% Extract position data for the right hip sagittal joint
right_hip_sagittal_position = simlogImportedURDF.right_hip_sagittal.Rz.q.series.values;

% Plotting the joint positions
figure;
plot(time_vector, left_hip_frontal_position, 'b', 'DisplayName', 'Left Hip Frontal');
hold on;
plot(time_vector, right_hip_sagittal_position, 'r', 'DisplayName', 'Right Hip Sagittal');
hold off;

% Adding labels and legend
xlabel('Time (s)');
ylabel('Joint Position (rad)');
title('Hip Joint Positions Over Time');
legend;
grid on;
