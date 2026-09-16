function plotSignal(signal,para,name)
%% ==========================================================
% 文件名：plotSignal.m
% 功能：绘制信号
% ===========================================================

figure;

% 绘制信号的实部（波形）
plot(para.t*1e6, real(signal), 'b', 'LineWidth', 1);

hold on;

% 绘制包络
plot(para.t*1e6, abs(signal), 'r--', 'LineWidth', 2, 'DisplayName', 'Envelope');
plot(para.t*1e6, -abs(signal), 'r--', 'LineWidth', 2);

hold off;

xlabel('Time (\mu s)', 'FontSize', 12);
ylabel('Amplitude', 'FontSize', 12);
title(name, 'FontSize', 13);
grid on;
legend;

end
