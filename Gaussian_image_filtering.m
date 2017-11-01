%---Gaussian High pass and Low pass filter---%

% read images
RGB1=imread('Monroe.jpg');
RGB2=imread('Einstein.jpg');
% convert the image to grey
I1=rgb2gray(RGB1);  
I2=rgb2gray(RGB2);

% compute FFT of the grey image
A = fft2(double(I1)); 
B = fft2(double(I2)); 
% frequency scaling
A1=fftshift(A); 
B1=fftshift(B); 

% Gaussian Filter Response Calculation
[M1 N1]=size(A); % image size
R1=7; % filter size parameter 
X1=0:N1-1;
Y1=0:M1-1;
[X1 Y1]=meshgrid(X1,Y1);
Cx1=0.5*N1;
Cy1=0.5*M1;
Lo1=exp(-((X1-Cx1).^2+(Y1-Cy1).^2)./(2*R1).^2);%Low pass filter

[M2 N2]=size(B); % image size
R2=6; % filter size parameter 
X2=0:N2-1;
Y2=0:M2-1;
[X2 Y2]=meshgrid(X2,Y2);
Cx2=0.5*N2;
Cy2=0.5*M2;
Lo2=exp(-((X2-Cx2).^2+(Y2-Cy2).^2)./(2*R2).^2);
Hi2=1-Lo2; % High pass filter=1-low pass filter

% Filtered image=ifft(filter response*fft(original image))
J=A1.*Lo1;
J1=ifftshift(J);
F1=ifft2(J1);

K=B1.*Hi2;
K1=ifftshift(K);
F2=ifft2(K1);

%----visualizing the results-------%

figure(1)
imshow(I1);colormap gray
title('original image','fontsize',14)

figure(2)
imshow(I2);colormap gray
title('original image','fontsize',14)

figure(4)
imshow(abs(F1),[12 290]), colormap gray
title('low pass filtered image','fontsize',14)

figure(5)
imshow(abs(F2),[12 290]), colormap gray
title('High pass filtered image','fontsize',14)

