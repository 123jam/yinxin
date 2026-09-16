function [decision, stage] = fuzeDecision(range_est, amp_est, R_far, R_near, eta_far, eta_near, N_far, N_near)
%% fuzeDecision: 模拟AsyTRI引信多阶段决策
persistent far_count near_count stage_state;
if isempty(stage_state)
    stage_state = ''IDLE''; far_count = 0; near_count = 0;
end
if abs(range_est - R_far) < 10 && amp_est > eta_far
    far_count = far_count + 1;
else
    far_count = 0;
end
if abs(range_est - R_near) < 10 && amp_est > eta_near
    near_count = near_count + 1;
else
    near_count = 0;
end
switch stage_state
    case ''IDLE''
        if far_count >= N_far, stage_state = ''FAR''; far_count = 0; end
    case ''FAR''
        if near_count >= N_near, stage_state = ''NEAR''; near_count = 0; end
    case ''NEAR''
        if near_count >= N_near, stage_state = ''FINAL''; end
end
decision = stage_state; stage = stage_state;
end
