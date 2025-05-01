jointA = q(1, :); % say left hip
jointB = q(4, :); % say right hip

% Cross-correlation
[crossCorr, lags] = xcorr(jointA, jointB, 'coeff');
[~, maxIdx] = max(crossCorr);
phaseLag = lags(maxIdx) * dt;

fprintf('\nPhase Lag between Joint 1 and Joint 4: %.4f seconds\n', phaseLag);

% Plot
figure;
plot(lags * dt, crossCorr);
xlabel('Time Lag (s)');
ylabel('Cross-Correlation');
title('Phase Lag between Joint 1 and 4');
grid on;
