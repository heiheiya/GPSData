% 二维直线运动模型:
%X=FX+V 状态模型
%Z=[z1;z2] 观测模型
clc;
clear all;
%%
path='D:\code\matlab\GPSData\9月20号GPS数据\9点53分-10点20';
hat='\test100';
[num,txt,raw]=xlsread([path,hat,hat,'.xls']);
x_state=str2double(txt(:,1));
y_state=str2double(txt(:,2));
% figure(1);
% plot(x_state,y_state,'g-');

time=length(x_state);
N1=time;
vx(1)=0;
vy(1)=0;

% N1=300;
% time=300;
% x_state(1)=400;
% vx(1)=40;
% y_state(1)=4800;
% vy=-30;
%%Process Noise Covariance%%%%%%%%
xstate_noise=0.00001;
Vx_noise=10;
%%Measurement Noise Covariance%%%%
theta_noise=3/180*pi;
distance1_noise=20;

%%Ture State%%%%%%%%
for i=2:time
    %% State model%%%%%%%%%%%
    x_state(i)=x_state(i-1)+vx(i-1)+xstate_noise*randn(1);
    vx(i)=vx(i-1)+Vx_noise*randn(1);
    y_state(i)=y_state(i-1)+vy+xstate_noise*randn(1);;
    vy=vy+Vx_noise*randn(1);
end
%%Measurement Value%%%%%
for i=1:time    
    %%Measure model%%%%%%%%%
    distance1(i)=sqrt(x_state(i)^2+y_state(i)^2)+distance1_noise*randn(1);
    theta1(i)=atan(y_state(i)/x_state(i))+theta_noise*randn(1);
end

%%%Particle Filtering%%%%%%%%%%%%%%
x_pf(1)=400;vx_pf(1)=40;
y_pf(1)=4800;vy_pf(1)=-30;
xp1=zeros(1,N1);xp2=zeros(1,N1);xp3=zeros(1,N1);xp4=zeros(1,N1);
%%%%%Initial particles%%%%%%%%
for n=1:N1;
    %M1=[delta1*randn(1),delta2*randn(1),delta3*randn(1),delta4*randn(1)];
    %M1=diag(M1);
    xp1(n)=x_pf(1)+xstate_noise*randn(1);
    xp2(n)=vx_pf(1)+Vx_noise*randn(1);
    xp3(n)=y_pf(1)+xstate_noise*randn(1);
    xp4(n)=vy_pf(1)+Vx_noise*randn(1);
end

%**filter process*** angel and distance****************
for t=2:time
    %%%Prediction Process%%%%
    for n=1:N1
        xpre_pf(n)=xp1(n)+xp2(n)+xstate_noise*randn(1);
        vxpre_pf(n)=xp2(n)+Vx_noise*randn(1);
        ypre_pf(n)=xp3(n)+xp4(n)+xstate_noise*randn(1);
        vypre_pf(n)=xp4(n)+Vx_noise*randn(1);
    end
    %%%Calculate Weight Particles%%%%
    for n=1:N1
        vhat1=sqrt(xpre_pf(n)^2+ypre_pf(n)^2)-distance1(t);
        vhat2=atan(ypre_pf(n)/xpre_pf(n))-theta1(t);
        q1=(1/distance1_noise/sqrt(2*pi))*exp(-vhat1^2/2/distance1_noise^2);
        q2=(1/theta_noise/sqrt(2*pi))*exp(-vhat2^2/2/theta_noise^2);
        q(n)=q1*q2+1e-99;
    end    
    q = q/sum(q);
    P_pf = cumsum(q);
    %%Resampling Process%%%%%%%%%%%%%%
    ut(1)=rand(1)/N1;
    k = 1; 
    hp = zeros(1,N1);
    for j = 1:N1
        ut(j)=ut(1)+(j-1)/N1;
        while(P_pf(k)<ut(j));
        k = k + 1;
        end;
    hp(j) = k;
    q(j)=1/N1;
    end;                         
    xp1 = xpre_pf(hp); xp2 = vxpre_pf(hp);       % The new particles    
    xp3 = ypre_pf(hp); xp4 = vypre_pf(hp);
    %% Compute the estimate%%%%%%%%%%%%%
    x_pf(t)=mean(xp1);y_pf(t)=mean(xp3);
end

%%%%Result of Tracking%%%%%%%%%%%%%
figure(2);
plot(x_state,y_state,'r-');
hold on
plot(x_pf,y_pf,'b-');
legend('actual','pf');
xlabel('x state'); ylabel('y state');
%figure;
%plot(1:time,distance_error,'r');
%legend('distance error');