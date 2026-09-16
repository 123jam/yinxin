function plotSignal(signal,para,name)
%% ==========================================================
% 文件名：plotSignal.m
% 功能：连续LFM信号时域幅度
% ==========================================================

figure;

plot(para.t * 1e6,...
     abs(signal),...
     'LineWidth',1.5);

grid on;
box on;

xlabel('Time (\mus)');
ylabel('Amplitude');

title(name);

xlim([0 para.Tobs*1e6]);

ylim([0 1.2]);

set(gca,...
    'FontSize',12,...
    'LineWidth',1.1);

end