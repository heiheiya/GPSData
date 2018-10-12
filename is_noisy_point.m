function noisy_point = is_noisy_point(point1_x, point1_y, point2_x, point2_y, t_diff, accSpeed)
    %以point1为基准点，计算point2是否为噪点
    standard = 0.001;
    x_std_diff = standard * t_diff;
    y_std_diff = standard * t_diff;
    x_diff = abs(point2_x - point1_x);
    y_diff = abs(point2_y - point1_y);
    meanAccSpeed = -5.1178;
    threshold=0.1;
%     fprintf(' t_diff=%.10f, x_diff=%.10f, y_diff=%.10f\n ',t_diff, x_diff, y_diff);
    if (x_diff > x_std_diff || y_diff > y_std_diff) && (abs(accSpeed-meanAccSpeed) < threshold)
        noisy_point = true;
    else
        noisy_point = false;
%         fprintf('noisy_point=%d, t_diff=%.10f, x_diff=%.10f, y_diff=%.10f\n ',noisy_point, t_diff, x_diff, y_diff);
    end
end