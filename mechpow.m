% Assumes:
% - t (1 x N): time vector
% - jointTorques (J x N): torque values [Nm]
% - qd (J x N): joint velocities [rad/s]
% Both should already be computed from your inverse dynamics code

% 1. Compute instantaneous mechanical power
power = jointTorques .* qd; % Element-wise multiplication (J x N)

% 2. Time step
dt = t(2) - t(1); % assuming uniform time steps

% 3. Total energy consumed by each joint using trapezoidal integration
energyPerJoint = trapz(t, abs(power), 2); % Integrate absolute power over time

% 4. Plot instantaneous power for a few joints
figure;
plot(t, power(1:4,:)'); % Plot first 4 joints for clarity
xlabel('Time (s)');
ylabel('Power (W)');
title('Instantaneous Mechanical Power (First 4 Joints)');
legend('Joint 1', 'Joint 2', 'Joint 3', 'Joint 4');
grid on;

% 5. Plot energy consumed by each joint
figure;
bar(energyPerJoint);
xlabel('Joint Index');
ylabel('Total Energy (J)');
title('Total Mechanical Energy Consumed per Joint');
grid on;

% 6. Print energy per joint
disp('⚡ Energy Consumed by Each Joint (Joules):');
for i = 1:size(jointTorques,1)
    fprintf('Joint %2d: %.4f J\n', i, energyPerJoint(i));
end
