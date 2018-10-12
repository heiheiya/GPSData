function diff = time_diff(time1,time2)
    %计算两个时间的秒差time2-time1
    std_1_second = 1.1574e-05;
    t_diff = datenum(time2) - datenum(time1);
    diff = t_diff/std_1_second;
end