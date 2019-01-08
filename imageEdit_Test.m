close all;
clear all;
clc

I = imread('adelson.jpg');

Display(I,'original');
I = double(I);
I = colorbalance(I);
Display(uint8(I),'colorbalanced');

tol=5e-4;
t = 15;

tic

for i = 1 : size(I,3)
    Itemp=I(:,:,i);
    f = gradfield(Itemp,t);
    Rtemp = L1Editting(Itemp,f,tol);
    
    % Rtemp= TVBreg(Itemp,t,tol);
    
    R(:,:,i) = Rtemp;
end
toc

R = colorbalance(R);

E = I - R;
E = E + 128;

Display(uint8(R), 'reflectance');
Display(uint8(E), 'illumination');