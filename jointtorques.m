% Comprehensive Analysis of Humanoid Robot Using Inverse Dynamics

% 1. Import the URDF Model
% Import the robot model from the URDF file
robot = importrobot('Humanoid.urdf');
robot.DataFormat = 'column'; % Set data format for dynamics calculations
robot.Gravity = [0 0 -9.81]; % Set gravity vector

% Display the robot model
figure;
show(robot);
title('Imported Humanoid Robot Model');

% 2. Define Joint Trajectories
% Time vector
t = linspace(0, 10, 100); % 10 seconds, 100 samples

% Number of joints
numJoints = numel(homeConfiguration(robot));

% Initialize matrices for joint positions (q), velocities (qd), and accelerations (qdd)
q = zeros(numJoints, numel(t));
qd = zeros(numJoints, numel(t));
qdd = zeros(numJoints, numel(t));

% Define sinusoidal trajectories for each joint
for i = 1:numJoints
    q(i, :) = deg2rad(10) * sin(0.5 * t + i);        % Position in radians
    qd(i, :) = deg2rad(10) * 0.5 * cos(0.5 * t + i); % Velocity in radians/s
    qdd(i, :) = deg2rad(10) * -0.25 * sin(0.5 * t + i); % Acceleration in radians/s^2
end

% 3. Compute Joint Torques Using Inverse Dynamics
% Initialize matrix for joint torques
jointTorques = zeros(numJoints, numel(t));

% Compute torques at each time step
for k = 1:numel(t)
    jointTorques(:, k) = inverseDynamics(robot, q(:, k), qd(:, k), qdd(:, k));
end

% 4. Plot the Results
% Plot joint torques over time
figure;
plot(t, jointTorques');
xlabel('Time (s)');
ylabel('Joint Torque (Nm)');
title('Computed Joint Torques Over Time');
legend(arrayfun(@(i) sprintf('Joint %d', i), 1:numJoints, 'UniformOutput', false));
grid on;
