function plotRangeProfile(pc,R,para)
%% ==========================================================
% 文件名：plotRangeProfile.m
% 功能：绘制距离压缩结果（论文版）
% ===========================================================

figure;

plot(R,...
     pc,...
     'b',...
     'LineWidth',2);

grid on;
box on;

xlabel('Range (m)',...
       'FontSize',12);

ylabel('Normalized Amplitude',...
       'FontSize',12);

title('Pulse Compression',...
      'FontSize',13);

hold on;

% 真实目标位置
xline(para.R,...
      'r--',...
      'True Target',...
      'LineWidth',1.5);

hold off;

% 只显示0~100 m
xlim([0 100]);

% 幅值固定
ylim([0 1.05]);

set(gca,...
    'FontSize',12,...
    'LineWidth',1.2);