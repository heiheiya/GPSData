function probability = staticProbalilityMeasure(acceler_x, acceler_y, acceler_z, length)
    static_up_t = 9.8;
    static_down_t = 9.1;
    probability = zeros(length, 1);
    mag = accelerCpt(acceler_x, acceler_y, acceler_z, length);
    for i=1:length
%         fprintf('mag(%d)==%f\n',i, mag(i));
        if (i <= 3)
            if (mag(i) > static_down_t && mag(i) < static_up_t)
                probability(i)=1;
            else
                probability(i)=0;
            end
        else
            count = 0;
            for j=1:3
%                 fprintf('j==%d\n',j);
                if (mag(i-3+j) > static_down_t && mag(i-3+j) < static_up_t)
                    count = count + 1;
                end
            end
            if (count > 1)
                probability(i)=1;
            else
                probability(i)=0;
            end
        end
%         fprintf('probability(%d)==%f\n',i,probability(i));
    end
end