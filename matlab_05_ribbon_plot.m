[x,y] = peaks(10*pi);
z =[(x.^2)-(y.^2)];
ribbon(z);
xlabel('X axis');
ylabel('Y axis');
zlabel('Z axis');
title('\bf Ribbon Plot')
Location=pwd
Date=date

% Result
% Location =
%     '/MATLAB Drive/Prac 01'
% Date =
%     '16-Jan-2021'
