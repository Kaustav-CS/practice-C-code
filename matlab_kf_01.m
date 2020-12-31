%KF-4.8_GREWAL

clc;close all;clear all% define system
% Define the system
N = 1000;             % number of time steps
%**((problem__ by changing steps system operation gives error; checking N=10
%and 100, matrix size changes also))**
dt = 0.1;           % Sampling time (s)
t = dt*(1:N);       % time vector (s)
n= 1; % order of system
F = [1];            % system matrix - state
G = [1];            % system matrix - input
H = [1];            % observation matrix
Q = [30];           % process noise covariance
P0=150;             % input = acceleration due to gravity (m/s^2)
I = eye(n);         % identity matrix
% Define the initial position and velocity
y0 = 0;             % m
%xt = zeros(1,N);   % True state vector
xt(:,1) = y0;       % True intial state
% Loop through and calculate the state
for k = 2:N
% Propagate the states through the prediction equations
xt(:, k) = F*xt(:, k-1) + G*P0;
end
% break
% Generate the noisy measurement from the true state
R = 20;                     % m^2/s^2
v = sqrt(R)*randn(1, N);    % measurement noise
z = (H*xt) + v;             % noisy measurement
% Perform the Kalman filter estimation
% Initialize the state vector (estimated state)
x = zeros(1, N);            % Estimated state vector
x(:, 1) = [10];            % Guess for initial state
% Initialize the covariance matrix
%P = [10, 0; 0, 0.01];      % Covariance for initial state error
Pi=[0];
%size(P)
% Loop through and perform the Kalman filter equations recursively
for k = 2:N
% Predict the state vector
x(:, k) = F*x(:, k-1) + G*P0;
% Predict the covariance
Pf = F*Pi*F' + Q;
%size(P)
% Calculate the Kalman gain matrix
K = (Pf*H')/(H*Pf*H' + R);
% Update the state vector 
%whos
x(:,k) = x(:,k) + K*(z(:,k) - H*x(:,k));
% Update the covariance
Pi = (I - K*H)*Pf;
end
%check dimensions of variables
%whos
%Plot the results
%Plot the states
figure(1);
%subplot(211);
plot(t, z, 'g-', t, x(1,:), 'b--', 'LineWidth', 2);
hold on; plot(t, xt(1,:), 'r:', 'LineWidth', 1.5)
xlabel('t (s)'); ylabel('x_1 = h (m)'); grid on;
legend('Measured','Estimated','True');
pause(2)
% subplot(212);
% plot(t, x(2,:), 'b--', 'LineWidth', 2);
% hold on; plot(t, xt(2,:), 'r:', 'LineWidth', 1.5)
% xlabel('t (s)'); ylabel('x_2 = v (m/s)'); grid on;
% legend('Estimated','True');
% Plot the estimation errors
figure(2);
%subplot(211);
plot(t, x(1,:)-xt(1,:), 'm', 'LineWidth', 2)

xlabel('t (s)'); ylabel('\Deltax_1 (m)'); grid on;
%subplot(212);
%plot(t, x(2,:)-xt(2,:), 'm', 'LineWidth', 2)
%xlabel('t (s)'); ylabel('\Deltax_2 (m/s)'); grid on;