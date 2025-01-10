%Bezier de gradul 3. 
%SCRIPT ASAMBLARE FIGURA COMPLETA
 
numPuncte = 100;
 
%Apelam functiile
[capX, capY] = CapStitch(numPuncte);
[urecheDreaptaX, urecheDreaptaY] = UrecheDreaptaStitch(numPuncte);
[urecheStangaX, urecheStangaY] = UrecheStangaStitch(numPuncte);
[bratStangX, bratStangY] = bratstang(numPuncte);
[bratDreptX, bratDreptY] = bratdrept(numPuncte);
[piciorStangX, piciorStangY] = PiciorStangStitch(numPuncte);
[piciorDreptX, piciorDreptY] = PiciorDreptStitch(numPuncte);
[linieLegaturaX, linieLegaturaY] = LinieLegaturaPicior(numPuncte); 
[linieBurticaX, linieBurticaY] = LinieBurtica(numPuncte);
[ochiStangX, ochiStangY] = ConturOchiStang(numPuncte);
[ochiDreptX, ochiDreptY] = ConturOchiDrept(numPuncte);
[ochiInteriorStangX, ochiInteriorStangY] = ConturOchiInteriorStang(numPuncte);
[ochiInteriorDreptX, ochiInteriorDreptY] = ConturOchiInteriorDrept(numPuncte);
[nasX, nasY] = nas(numPuncte);
[guraX, guraY] = GuraStitch(numPuncte);
[gheareStangX, gheareStangY] = GheareBratStang(numPuncte);
[gheareDreptX, gheareDreptY] = GheareBratDrept(numPuncte);
[piciorStangInteriorX, piciorStangInteriorY] = ConturPiciorStangInterior(numPuncte);
[piciorDreptInteriorX, piciorDreptInteriorY] = ConturPiciorDreptInterior(numPuncte);
[parPieptX, parPieptY] = ParPiept(numPuncte);

figure;
hold on;

plot(capX, capY,'k', 'LineWidth', 2);
plot(urecheDreaptaX, urecheDreaptaY,'k', 'LineWidth', 2);
plot(urecheStangaX, urecheStangaY,'Color', 'k','LineWidth', 2);
plot(bratStangX, bratStangY, 'Color', 'k', 'LineWidth', 2);
plot(bratDreptX, bratDreptY,'Color', 'k' ,'LineWidth', 2);
plot(piciorStangX, piciorStangY, 'Color', 'k','LineWidth', 2);
plot(piciorDreptX, piciorDreptY, 'Color', 'k', 'LineWidth', 2);
plot(linieLegaturaX, linieLegaturaY, 'Color', 'k', 'LineWidth', 2);
plot(linieBurticaX, linieBurticaY, 'Color', 'k','LineWidth', 2);
plot(ochiStangX, ochiStangY, 'LineWidth', 2, 'Color', 'k');
plot(ochiDreptX, ochiDreptY, 'LineWidth', 2, 'Color', 'k');
plot(ochiInteriorStangX, ochiInteriorStangY, 'LineWidth', 2, 'Color', 'k');
plot(ochiInteriorDreptX, ochiInteriorDreptY, 'LineWidth', 2, 'Color', 'k');
plot(nasX, nasY, 'LineWidth', 2, 'Color', 'r');
plot(guraX, guraY, 'LineWidth', 2, 'Color', 'k');
plot(gheareStangX, gheareStangY,'k', 'LineWidth', 2); 
plot(gheareDreptX, gheareDreptY, 'k','LineWidth', 2); 
plot(piciorStangInteriorX, piciorStangInteriorY, 'k','LineWidth', 2);
plot(piciorDreptInteriorX, piciorDreptInteriorY, 'k','LineWidth', 2);
plot(parPieptX, parPieptY, 'Color','k', 'LineWidth', 2);

title('Stitch  - Bezier Curve');
axis equal;
grid on;



%CERINTA 2: Algoritmul F-Mill
%CURBA 1 - detaliu picior stang, forma de frunza

%p - puncte digitalizate
  p = [
     0.5, 0;  % Punctul de start de la baza frunzei
    0.1, 0.3; % Punct de control pentru partea de jos stanga
    0.3, 1.0; % Punct de control varful frunzei (stanga)
    0.5, 1.2; % Varful frunzei
    0.7, 1.0; % Punct de control pentru varful frunzei (dreapta)
    0.9, 0.3; % Punct de control pentru partea de jos dreapta
    0.5, 0    % Punctul de start (iarasi)
]';

deplasareX = -3.3;
deplasareY = -5.3;
p(1,:) = p(1,:) + deplasareX;
p(2,:) = p(2,:) + deplasareY;

% a, e definesc punctul de control b1 pentru prima portiune a curbei
a = -3; 
e = -5.2; 
% c, d definesc punctul de control bn pentru ultima portiune a curbei
c = -3; 
d = -5.2; 

n = size(p, 2);
n=max(size(p));
l=zeros(2,n-2);
for j=1:(n-2)
l(:,j) = p(:,j+2) - p(:,j);
end
ultim=3*(n-1)+1;
b= ones(2,ultim);
b(:,1) = p(:,1);
b(:,2) = [a;e];
b(:,3) = p(:,2)-(1/6)*l(:,1);
for k=1:(n-3)
b(:,3*k+1) = p(:,k+1);
b(:,3*k+2) = p(:,k+1) + (1/6) *l(:,k);
b(:,3*k+3) = p(:,k+2) - (1/6) *l(:,k+1);
end
b(:,3*(n-2)+1) = p(:,n-1);
b(:,3*(n-2)+2) = p(:,n-1) + (1/6) *l(:,n-2);
b(:,3*(n-2)+3) = [c,d];
b(:,ultim) = p(:,n);
i=1;
nr=1;
ng=n-1;
while nr<=ng
%comentam plotul pentru poligonul de control
%plot(b(1,i:i+3), b(2,i:i+3),'kx-');
hold on;
nr=nr+1;
i=i+3;

end
t=0:.001:1; 
B0=(1-t).^3;
B1=3.*(1-t).^2.*t;
B2=3.*(1-t).*t.^2;
B3=t.^3;
B=[B0;B1;B2;B3];
m=length(t);
x=zeros(2,m);
i=1;
nr=1;
while nr<=ng
x=b(:,i:i+3)*B;
plot(x(1,:),x(2,:)); 
nr=nr+1;
i=i+3;
end
for k=l:ng
end



%CERINTA 2
%CURBA 2 - Podea
pi = [-8, -7.6, -7.2, -6.8, -6.4, -6.0, -5.6, -5.2, -4.8, -4.4, -4.0, -3.6, -3.2, -2.8, -2.4, -2.0, -1.6, -1.2, -0.8, -0.4, 0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8, 3.2, 3.6, 4.0, 4.4, 4.8, 5.2, 5.6, 6.0, 6.4, 6.8, 7.2, 7.6, 8.0;
      8, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2, 0, 0.2,8];        

deplasareiY = -6.5;
pi(2,:) = pi(2,:) + deplasareiY;

ai =  0.3; 
ei = 0.5; 
ci =  2; 
di =  0.5; 

n=max(size(pi));
l=zeros(2,n-2);
for j=1:(n-2)
l(:,j) = pi(:,j+2) - pi(:,j);
end
ultim=3*(n-1)+1;
b= ones(2,ultim);
b(:,1) = pi(:,1);
b(:,2) = [ai;ei];
b(:,3) = pi(:,2)-(1/6)*l(:,1);
for k=1:(n-3)
b(:,3*k+1) = pi(:,k+1);
b(:,3*k+2) = pi(:,k+1) + (1/6) *l(:,k);
b(:,3*k+3) = pi(:,k+2) - (1/6) *l(:,k+1);
end
b(:,3*(n-2)+1) = pi(:,n-1);
b(:,3*(n-2)+2) = pi(:,n-1) + (1/6) *l(:,n-2);
b(:,3*(n-2)+3) = [ci,di];
b(:,ultim) = pi(:,n);
i=1;
nr=1;
ng= n-1;
while nr<=ng
%plot(b(1,i:i+3), b(2,i:i+3),'kx-');
hold on;
nr=nr+1;
i=i+3;
end
t=0:.001:1; 
B0=(1-t).^3;
B1=3.*(1-t).^2.*t;
B2=3.*(1-t).*t.^2;
B3=t.^3;
B=[B0;B1;B2;B3];
m=length(t);
x=zeros(2,m);
i=1;
nr=1;
while nr<=ng
x=b(:,i:i+3)*B;
plot(x(1,:),x(2,:));
nr=nr+1;
i=i+3;
end
for k=l:ng
end
hold off




