function [mag]=accelerCpt(acceler_x, acceler_y, acceler_z, length)
    mag = zeros(length, 1);
%     dir_xy = zeros(length, 1);
%     dir_xz = zeros(length, 1);
    mag = sqrt(acceler_x .* acceler_x + acceler_y .* acceler_y + acceler_z .* acceler_z);
%     dir_xy = atan2(acceler_x, acceler_y);
%     dir_xz = atan2(acceler_x, acceler_z);
end