function [jamming, delay_profile] = RGPO(s, Fs, PRI, numPulses, R0, v_pull)
%% RGPO: 距离拖引干扰 (Range Gate Pull-Off)
c = 3e8; N = length(s);
total_samples = round(numPulses * PRI * Fs);
jamming = zeros(1, total_samples);
delay_profile = zeros(1, numPulses);
for m = 1:numPulses
    R_current = R0 + (m-1) * v_pull * PRI;
    delay_samples = round(2 * R_current / c * Fs);
    delay_profile(m) = delay_samples;
    start_idx = (m-1) * round(PRI * Fs) + 1;
    if start_idx + N - 1 <= total_samples
        jamming(start_idx:start_idx+N-1) = s;
    end
end
jamming = jamming / max(abs(jamming) + eps);
end
