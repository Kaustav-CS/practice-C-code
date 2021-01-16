% 3 D plot using mesh
[x,y] = meshgrid(-10:0.1:10); 
t = sqrt(x.^2+y.^2);

figure(1)
z1=(10*sin(t));
mesh(x,y,z1)
figure(2)
z2 =(10*cos(t));
mesh(x,y,z2)
fprintf("FINISH");
fprintf('\n');