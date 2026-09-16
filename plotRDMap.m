function plotRDMap(RD_map, range_axis, doppler_axis)
figure; imagesc(doppler_axis, range_axis, 20*log10(RD_map + eps));
xlabel(''多普勒频移 (Hz)''); ylabel(''距离 (m)'');
title(''距离-多普勒图''); colorbar; axis xy;
end
