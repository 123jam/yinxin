function plotAF(AF, tau_axis, fd_axis)
figure; mesh(tau_axis*1e6, fd_axis/1e6, AF);
xlabel(''时延 (\mus)''); ylabel(''多普勒频移 (MHz)'');
zlabel(''|\chi(\tau, f_d)|''); title(''模糊函数三维图'');
colormap(''jet''); view(45, 30);
end
