clear
clc

size = 200;
nx = 50;
ny = 50;
dx = size/nx;
dy = size/ny;

G = sparse(nx*ny,nx*ny);


for i=1:ny
    for j=1:nx
        n=j+(i-1)*ny;
        
        if j==1%left side
            G(n,:) = 0;
            G(n,n) = 1;
        elseif j==ny %right side
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i==1%top side
            G(n,:) = 0;
            G(n,n) = 1;
        elseif i==ny%bottom side
            G(n,:) = 0;
            G(n,n) = 1;
        else%bulk mass
            if (i>10 && i<20 && j>10 && j<20)
                G(n,n) = -2;
            else
                G(n,n) = -4;
            end
            
            G(n,n-1) = 1;
            G(n,n+1) = 1;
            if n>=nx
               G(n,n-nx) = 1;
            end
            if n<=length(G)-ny
               G(n,n+ny) = 1; 
            end            
        end
    end
end

[E,D] = eigs(G,9,'SM');

B1 = zeros(nx,ny);
B2 = zeros(nx,ny);
B3 = zeros(nx,ny);
B4 = zeros(nx,ny);
B5 = zeros(nx,ny);
B6 = zeros(nx,ny);
B7 = zeros(nx,ny);
B8 = zeros(nx,ny);
B9 = zeros(nx,ny);


for i=1:ny
    for j=1:nx
        n=j+(i-1)*ny;
        
        B1(n) = E(n,1);
        B2(n) = E(n,2);
        B3(n) = E(n,3);
        B4(n) = E(n,4);
        B5(n) = E(n,5);
        B6(n) = E(n,6);
        B7(n) = E(n,7);
        B8(n) = E(n,8);
        B9(n) = E(n,9);
    end
end

subplot(3,3,1)
surf(B1)
subplot(3,3,2)
surf(B2)
subplot(3,3,3)
surf(B3)
subplot(3,3,4)
surf(B4)
subplot(3,3,5)
surf(B5)
subplot(3,3,6)
surf(B6)
subplot(3,3,7)
surf(B7)
subplot(3,3,8)
surf(B8)
subplot(3,3,9)
surf(B9)











