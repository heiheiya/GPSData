path='D:\code\matlab\GPSData\2018-10-10\11点17——11点35分';
hat='\test100';
[num,txt,raw]=xlsread([path,hat,hat,'.xls']);
[num1,txt1,raw1]=xlsread([path,hat,'\result.csv']);
x=str2double(txt(:,1));
y=str2double(txt(:,2));
% accSpeed=str2double(txt(:,6));
% x2=str2double(txt1(:,1));
% y2=str2double(txt1(:,2));
x2=num1(:,1);
y2=num1(:,2);
x2(x2==0) = [];
y2(y2==0) = []; 
time=txt(:,5);
time(1)=[];
figure(1)
plot(x,y,'b-','LineWidth',3);
hold on
plot(x2,y2,'r-','LineWidth',3);


t=length(x);

kf_params_record = zeros(size(x, 1), 4);
i = 1;
count = 0;
while(i <= t)
    if i == 1 %&& t >=i+2
%         t_diff1 = time_diff(datenum(time(i)),datenum(time(i+1)));
%         t_diff2 = time_diff(datenum(time(i+1)),datenum(time(i+2)));
%         first_point = is_first_point(x(i), y(i),x(i+1), y(i+1),x(i+2), y(i+2),t_diff1, t_diff2);
%         if first_point
        kf_params = kf_init(x(i), y(i), 0, 0); % 初始化
%         else
%             fprintf('i=%d, not first point\n',i);
%             x(i) = [];
%             y(i) = [];
%             t = t -1;
%             kf_params_record(i, :)=[];
%             continue
%         end
%     elseif i == 1 && t<i+2
%         fprintf('all points are not legal\n');
%         break;
    else
%         fprintf('i=%d, time(%d)=%s, time(%d)=%s\n',i, i-1, time{i-1}, i, time{i});
%         t_diff = time_diff(datenum(time(i-1)),datenum(time(i)));
%         if is_noisy_point(x(i-1), y(i-1), x(i), y(i), t_diff, accSpeed(i))
%             count = count + 1;
%             fprintf('%d, noisy point here!!!\n',count);
%             x(i) = [];
%             y(i) = [];
%             t = t -1;
%             kf_params_record(i, :)=[];
%             continue
%         end
%         kf_params.z = num(i, 1:2)'; %设置当前时刻的观测位置
        kf_params.z = [x(i),y(i)]'; %设置当前时刻的观测位置
        kf_params = kf_update(kf_params); % 卡尔曼滤波
    end
    kf_params_record(i, :) = kf_params.x';
%     fprintf('i=%d, t=%d\n', i, t);
    i = i + 1;
end
kf_trace = kf_params_record(:, 1:2);
% kf_trace(end, :)=[];

% figure(2)
% plot(x,y,'r-','LineWidth',3);
hold on
plot(kf_trace(:, 1), kf_trace(:, 2), 'g-','LineWidth',3);
legend('原始数据','加速度排除静止点','不排除静止点');
% for i=1:t
%     fprintf('i=%d, x2(%d)=%f, y2(%d)=%f, kf_trace(%d,1)=%f, kf_trace(%d,2)=%f\n', i, i, x2(i), i, y2(i), i, kf_trace(i,1), i, kf_trace(i,2));
% end




