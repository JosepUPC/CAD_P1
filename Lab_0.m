% Matriu
% 3x3
M3x3_0=[1 2 3; 4 5 6; 7 8 9];
% 2x4
M4x2_0=[1 2; 3 4; 5 6; 7 8];
% zero(Num_files,Num columnes)
M2x2_0=zeros(2,2);
% get matrix value
M3x3_0(1,3)=3;
% get matrix queue
M3x3_0(1,:)=[1 2 3];
% vector value control
vt_0=0:1:10;
% concatena matrius de la mateixa forma que les crees
M6x2_0=[M2x2_0; M2x4_0];
% complex numbers
z_0= 1 + 2i;
z_1= 3 - 5i;
% transform into polar
[z0m,z0p]=cart2pol(real(z_0),imag(z_0));
[z1m,z1p]=cart2pol(real(z_1),imag(z_1));
% operate with them
z2m=z0m+z1m;
z2p=z0p*z1p;
% transform into cartesian
[z2r,z2i]=pol2cart(z2p,z2m);
z_2=z2r + z2i*1i;
% createa and print a singal with a certain note;
A=0.5;
fm=44100;
fs=440;
t=0:1/(fm-1):1;
phase=pi/4;
s0=A*sin(2*pi*fs*t+phase);
%plot
plot(s0);
figure
stem(t,s0);
%if
if lt(1,2)
    x=1;
end
%for
sum=0;
for for_base=0:2:100
    sum=sum+for_base;
end