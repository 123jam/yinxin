function [jamming, doppler_profile] = VGPO(s, Fs, PRI, numPulses, fd0, fd_pull)
%% VGPO: 速度拖引干扰 (Velocity Gate Pull-Off)
N = length(s);
total_samples = round(numPulses * PRI * Fs);
jamming = zeros(1, total_samples);
doppler_profile = fd0 + (0:numPulses-1) * fd_pull;
for m = 1:numPulses
    t = (0:N-1)/Fs + (m-1)*PRI;
    pulse = s .* exp(1j*2*pi*doppler_profile(m)*t);
    start_idx = (m-1)*round(PRI*Fs) + 1;
    if start_idx+N-1 <= total_samples
        jamming(start_idx:start_idx+N-1) = pulse;
    end
end
end
