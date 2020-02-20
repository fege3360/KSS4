clc;
clear all;
load('Daten.mat','KalmanMeasureX');

%Calculate and Plot Kalman X-Rotation

Kov_u=[0.0027 0;0 0.0027];
Kov_z=100;
dt=0.01;

u=KalmanMeasureX.gx;
z=atan(KalmanMeasureX.ay./KalmanMeasureX.az)*180/pi;
[mue,integ_phi] = Kalman(u,z,Kov_u,Kov_z,dt);

KalmanXRotation = figure();
plot(KalmanMeasureX.time,integ_phi);
hold on;
grid on;
plot(KalmanMeasureX.time,z);
plot(KalmanMeasureX.time,mue(1,:));

saveas(KalmanXRotation,'KalmanXRotation','eps');

% %Calculate and Plot Kalman Y-Rotation
% 
% Kov_u=[0.0027 0;0 0.0027];
% Kov_z=100;
% dt=0.01;
% 
% u=KalmanMeasureY.gy;
% z=atan(KalmanMeasureY.ax./KalmanMeasureY.az)*-180/pi;
% %z2=KalmanMeasureY.ax;
% %z3=KalmanMeasureY.az;
% [mue,integ_phi] = Kalman(u,z,Kov_u,Kov_z,dt);
% 
% %plot(KalmanMeasureY.time,integ_phi);
% figure();
% hold on;
% plot(KalmanMeasureY.time,z);
% %plot(KalmanMeasureY.time,z2);
% %plot(KalmanMeasureY.time,z3);
% 
% plot(KalmanMeasureY.time,mue(1,:));
% plot(KalmanMeasureY.time,integ_phi);

