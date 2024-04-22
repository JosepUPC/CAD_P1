% variable x1 amb nombres parells entre 0 i 20000
x1 = 0 : 2 : 20000 ;
% variable x2 amb quadrats dels nombres sensers entre 1 i 5000
max=floor(sqrt(5000));
x2=power(1:max,2);
% Assignar metjana de components del vector y al vector x3
y=1:2:100;
x3=mean(y);
% Variable x4 amb cosinus de fc =100 Hz amb fm = 300 Hz a to=2 s
to=2;
fm=300;
fc=100;
t=0:1/(fm*to):to;
x4=cos(2*pi*t*fc);
% Varialbe P amb la potnecia mitjana de la senyal mostrejada al vecotr x4
P=mean(power(x4,2));
% variable que contingui els signes respectius de cada component del vector
% z
z=(rand(10,1)-1/2)*2;
x6=zeros(1,length(z));
for i6=1:length(z)
    if(z(i6,1)>=0)
        x6(i6,1)=1;
    else
        x6(i6,1)=-1;
    end
end
stem(x6);