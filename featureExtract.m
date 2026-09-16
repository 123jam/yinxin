function features = featureExtract(signal, Fs, fc)
%% featureExtract: 提取回波特征用于干扰识别
features = struct();
features.peak_amplitude = max(abs(signal));
features.energy = sum(abs(signal).^2);
N = length(signal);
freq_axis = (-N/2:N/2-1) * Fs / N;
features.spectrum = fftshift(fft(signal));
features.kurtosis = kurtosis(real(signal));
features.skewness = skewness(real(signal));
end
