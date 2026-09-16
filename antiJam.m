function [signal_clean, jammer_flag] = antiJam(signal_rx, s_ref, Fs, fc, method)
%% antiJam: 抗干扰主算法入口
switch method
    case ''FRFT''
        signal_clean = antiJam_FRFT(signal_rx, s_ref, Fs);
    case ''BSS''
        signal_clean = antiJam_BSS(signal_rx, s_ref, Fs);
    case ''orthogonal''
        signal_clean = antiJam_Orthogonal(signal_rx, s_ref);
    otherwise
        error(''未知的抗干扰方法'');
end
jammer_flag = detectJammer(signal_clean, s_ref, Fs);
end

function signal_clean = antiJam_FRFT(signal_rx, s_ref, Fs)
%% FRFT抗干扰 (需安装FRFT工具箱)
warning(''FRFT抗干扰需要安装FRFT工具箱，当前返回原信号'');
signal_clean = signal_rx;
end

function signal_clean = antiJam_BSS(signal_rx, s_ref, Fs)
%% 盲源分离抗干扰
warning(''BSS抗干扰方法待完整实现'');
signal_clean = signal_rx;
end

function signal_clean = antiJam_Orthogonal(signal_rx, s_ref)
%% 正交投影抗干扰
warning(''正交投影抗干扰方法待完整实现'');
signal_clean = signal_rx;
end

function flag = detectJammer(signal, s_ref, Fs)
%% 干扰检测
h = matchedFilter(s_ref);
y = pulseCompression(signal, h);
peak = max(y); avg = mean(y);
if peak / avg < 3, flag = 1; else, flag = 0; end
end
