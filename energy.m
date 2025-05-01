% Compute mechanical power = torque × angular velocity
power = jointTorques .* qd; % Element-wise multiplication

% Integrate power over time to get energy
dt = t(2) - t(1); % Time step
energyPerJoint = trapz(t, abs(power), 2); % Total energy consumed per joint

% Display results
disp('Energy consumed by each joint (Joules):');
for i = 1:numJoints
    fprintf('Joint %d: %.4f J\n', i, energyPerJoint(i));
end

% Plotting energy distribution
figure;
bar(energyPerJoint);
xlabel('Joint Index');
ylabel('Energy (J)');
title('Energy Consumption per Joint');
grid on;
