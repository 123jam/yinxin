function [pc,R] = pulseCompression(rx,tx,para)
%% ==========================================================
% 文件名：pulseCompression.m
% 功能：FFT匹配滤波（论文版）
% MATLAB R2024b
% ===========================================================

N = length(rx);

% FFT
RX = fft(rx,N);

% 匹配滤波器
H = conj(fft(tx,N));

% 匹配滤波
PC = RX .* H;

% IFFT
pc = ifft(PC);

% 归一化
pc = abs(pc);
pc = pc ./ max(pc);

% 距离轴
R = (0:N-1)' * para.c / (2*para.fs);

end