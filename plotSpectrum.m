function plotSpectrum(signal,para,name)
%% ==========================================================
% 文件名：plotSpectrum.m
% 功能：绘制频谱
% ===========================================================

N = length(signal);

S = fftshift(fft(signal,N));

f = (-N/2:N/2-1)*(para.fs/N);

figure;

plot(f/1e6,...
     20*log10(abs(S)/max(abs(S))+eps),...
     'LineWidth',1.5);

xlabel('Frequency (MHz)');
ylabel('Magnitude (dB)');

title(name);

grid on;

xlim([min(f) max(f)]/1e6);

end