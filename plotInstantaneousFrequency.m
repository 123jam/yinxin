function plotInstantaneousFrequency(tx,para)
%% ==========================================================
% 文件名：plotInstantaneousFrequency.m
% 功能：绘制LFM瞬时频率
% ==========================================================

t = para.t;

%% 对信号进行相位解算
phase = unwrap(angle(tx));

%% 计算瞬时频率
f_inst = gradient(phase) / (2*pi*1/para.fs);

%% MHz
f_inst = f_inst / 1e6;

%% 绘图
figure;

plot(t*1e6,...
     f_inst,...
     'LineWidth',1.5);

grid on;
box on;

xlabel('Time (\mus)');
ylabel('Instantaneous Frequency (MHz)');

title('LFM Instantaneous Frequency');

xlim([0 para.Tobs*1e6]);

ylim([-para.B/2/1e6-2 ...
       para.B/2/1e6+2]);

set(gca,...
    'FontSize',12,...
    'LineWidth',1.1);

end