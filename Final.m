
f=imread('8.jpg');
a=imresize(f,[1500,1200]);
figure(1),imshow(a);

g=imread('10.jpg');
b=imresize(g,[1500,1200]);
figure(2),imshow(b);

h=imadd(a,b);
figure(3),imshow(h);

