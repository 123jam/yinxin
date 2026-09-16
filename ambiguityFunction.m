function [AF, tau_axis, fd_axis] = ambiguityFunction(s, Fs, varargin)
%% ambiguityFunction: 计算模糊函数
N = length(s); dt = 1/Fs;
if nargin < 3, tau_max = N*dt/2; else, tau_max = varargin{1}; end
if nargin < 4, fd_max = Fs/4; else, fd_max = varargin{2}; end
num_tau = 201; num_fd = 201;
tau_axis = linspace(-tau_max, tau_max, num_tau);
fd_axis = linspace(-fd_max, fd_max, num_fd);
AF = zeros(num_fd, num_tau);
for i = 1:num_tau
    tau = tau_axis(i); tau_s = round(tau * Fs);
    if abs(tau_s) >= N, continue; end
    if tau_s >= 0
        s1 = s(tau_s+1:end); s2 = s(1:end-tau_s);
    else
        s1 = s(1:end+tau_s); s2 = s(1-tau_s:end);
    end
    L = min(length(s1), length(s2));
    s1 = s1(1:L); s2 = s2(1:L);
    for j = 1:num_fd
        fd = fd_axis(j);
        AF(j,i) = abs(sum(s1 .* conj(s2) .* exp(1j*2*pi*fd*(0:L-1)/Fs)));
    end
end
AF = AF / max(AF(:));
end
