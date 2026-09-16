function rx = targetEcho(tx,para)
%% ==========================================================
% 目标回波
% ===========================================================

rx = zeros(size(tx));

delay = round(para.tau*para.fs);

if delay < length(tx)

    rx(delay+1:end)=para.A*tx(1:end-delay);

end

doppler = exp(1j*2*pi*para.fd*para.t);

rx = rx .* doppler;

end