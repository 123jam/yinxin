function jamming = DRFM(s, fc, Fs, R_deception, JSR_dB, varargin)
%% DRFM: 生成DRFM转发式欺骗干扰
c = 3e8;
tau_deception = 2 * R_deception / c;
delay_samples = round(tau_deception * Fs);
jamming = [zeros(1, delay_samples), s];
if nargin >= 6
    v_deception = varargin{1};
    doppler = 2 * v_deception * fc / c;
    t = (0:length(jamming)-1) / Fs;
    jamming = jamming .* exp(1j * 2 * pi * doppler * t);
end
end
