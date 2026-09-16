function rx = addNoise(rx,para)
%% ==========================================================
% 加AWGN噪声
% ===========================================================

Ps = mean(abs(rx).^2);

Pn = Ps/10^(para.SNR/10);

noise = sqrt(Pn/2) * ...
    (randn(size(rx))+1j*randn(size(rx)));

rx = rx + noise;

end