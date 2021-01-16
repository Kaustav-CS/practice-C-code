%To contact:    kaustav.pg2019@ee.iiests.ac.in (for academic only)
[x,y] = peaks(30);
z = exp(-0.9*(x.^2+0.5*(x-y).^2));
surf(x,y,z);
xlabel('\bf X axis');
ylabel('\bf Y axis');
zlabel('\bf Z axis');
title('\bf Surface Plot')
colorbar
Location=pwd
Date=date

% Result
% Location =
%     '/MATLAB Drive/Prac 01'
% Date =
%     '16-Jan-2021'
