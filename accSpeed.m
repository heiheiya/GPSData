path='D:\code\matlab\GPSData\2018-09-28\10点05分-10点34分（加速度静止）';
hat='\test100';
[num,txt,raw]=xlsread([path,hat,hat,'.xls']);
path2='D:\code\matlab\GPSData\2018-09-28\10点35分-10点47分（加速度移动）';
[num2,txt2,raw2]=xlsread([path2,hat,hat,'.xls']);

accSpeed1x=str2double(txt(:,6));
accSpeed1y=str2double(txt(:,7));
accSpeed1z=str2double(txt(:,8));

accSpeed2x=str2double(txt2(:,6));
accSpeed2y=str2double(txt2(:,7));
accSpeed2z=str2double(txt2(:,8));

% xmin=min(min(accSpeed1x, accSpeed2x));
% xmax=max(max(accSpeed1x, accSpeed2x));
ymax=max(length(accSpeed1x), length(accSpeed2x));

figure(1);
subplot(3,1,1);
plot(accSpeed1x,'b-','LineWidth',1);
hold on
plot(accSpeed2x,'r-','LineWidth',1);
% axis([0 ymax -5.5 -4.5]);

subplot(3,1,2);
plot(accSpeed1y,'b-','LineWidth',1);
hold on
plot(accSpeed2y,'r-','LineWidth',1);
% axis([0 ymax -1.5 -0.5]);

subplot(3,1,3);
plot(accSpeed1z,'b-','LineWidth',1);
hold on
plot(accSpeed2z,'r-','LineWidth',1);
% axis([0 ymax -8 -7.5]);

% figure(2);
% subplot(3,1,1);
% % plot(accSpeed1x,'b-','LineWidth',1);
% % hold on
% plot(accSpeed2x,'r-','LineWidth',1);
% axis([0 ymax -5.5 -4.5]);
% 
% subplot(3,1,2);
% % plot(accSpeed1y,'b-','LineWidth',1);
% % hold on
% plot(accSpeed2y,'r-','LineWidth',1);
% axis([0 ymax -1.5 -0.5]);
% 
% subplot(3,1,3);
% % plot(accSpeed1z,'b-','LineWidth',1);
% % hold on
% plot(accSpeed2z,'r-','LineWidth',1);
% axis([0 ymax -8 -7.5]);