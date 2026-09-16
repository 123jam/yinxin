function [RD_map, range_axis, doppler_axis] = rangeDoppler(pulse_matrix, Fs, PRI)
%% rangeDoppler: 距离-多普勒二维处理
c = 3e8;
[N_samples, numPulses] = size(pulse_matrix);
RD_map = fftshift(fft(pulse_matrix, [], 2), 2);
range_axis = (0:N_samples-1) * c / (2 * Fs);
doppler_axis = (-numPulses/2:numPulses/2-1) * (1/PRI) / numPulses;
RD_map = abs(RD_map) / max(abs(RD_map(:)));
end
