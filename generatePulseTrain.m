function pulse_train = generatePulseTrain(s, Fs, PRI, numPulses)
%% generatePulseTrain: 生成多脉冲串
N = length(s);
Ns = round(PRI * Fs);
total_len = Ns * numPulses;
pulse_train = zeros(1, total_len);
for i = 1:numPulses
    start_idx = (i-1) * Ns + 1;
    end_idx = start_idx + N - 1;
    if end_idx <= total_len
        pulse_train(start_idx:end_idx) = s;
    end
end
end
