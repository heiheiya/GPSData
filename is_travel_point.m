function travel_point = is_travel_point(accSpeed)
    meanAccSpeed = -5.1178;
    threshold=0.1;
    if abs(accSpeed-meanAccSpeed) > threshold
        travel_point = true;
    else
        travel_point = false;
    end
end