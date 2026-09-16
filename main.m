%% ==========================================================
% main.m
% 无线电引信LFM基础模型
% MATLAB R2024b
% ===========================================================

clear
clc
close all

%% 参数
para = parameter();

%% 产生LFM信号
tx = generateLFM(para);

%% 目标回波
rx = targetEcho(tx,para);

%% 加噪
rx = addNoise(rx,para);

%% FFT匹配滤波
[pc,R] = pulseCompression(rx,tx,para);

%% 绘图
plotSignal(tx,para,'LFM Transmit Signal');

plotSignal(rx,para,'Target Echo');

plotSpectrum(tx,para,'LFM Spectrum');

%% 距离像
plotRangeProfile(pc,R,para);