function first_point = is_first_point(point1_x, point1_y, point2_x, point2_y,  point3_x, point3_y, t_diff1, t_diff2)
    standard = 0.00001;
    x1_std_diff = standard * t_diff1;
    y1_std_diff = standard * t_diff1;
    x1_diff = abs(point2_x - point1_x);
    y1_diff = abs(point2_y - point1_y);
    x2_std_diff = standard * t_diff2;
    y2_std_diff = standard * t_diff2;
    x2_diff = abs(point3_x - point2_x);
    y2_diff = abs(point3_y - point2_y);

    if (x1_diff > x1_std_diff || y1_diff > y1_std_diff) || (x2_diff > x2_std_diff || y2_diff > y2_std_diff)
        first_point = false;
    else
        first_point = true;
    end
end