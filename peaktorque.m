[maxTorque, idxMax] = max(abs(jointTorques'), [], 1); % Max torque and when it occurs

fprintf('\nPeak Torque Analysis:\n');
for i = 1:numJoints
    fprintf('Joint %d: Max Torque = %.2f Nm at t = %.2fs\n', i, maxTorque(i), t(idxMax(i)));
end
