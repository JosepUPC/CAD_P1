% 1
BN=1e4;
Maxv=10;
Minv=-10;

b=linspace(Minv,Maxv,BN);

% 2
rs=1;
B=0.2;

pd=sin(pi*rs*b*(1-B))+4*B*rs*b.*cos(pi*rs*b*(1+B));
pn=(pi*b*sqrt(rs).*(1-power(4*B*rs*b,2)));
p=pd./pn;

figure("Name","Modulador IQ");
subplot(3,1,1);
plot(b,p);
title("Pols de conformació");
xlabel("time(s)");
ylabel("Amplitude");

% bp=2*1/rs;

% 3
is=p;
qs=-p;
subplot(3,1,2);
plot(b,is);
title("Senyal fase/quadratura");
xlabel("time(s)");
ylabel("Amplitude");
hold on
plot(b,qs);
hold off

% 4
% Constulta el archiu "modIQ.m"

% 5
fc=100;
s1=modIQ(is,qs,fc,b);
subplot(3,1,3);
plot(b,s1);
title("Señal s(t)");
xlabel("time(s)");
ylabel("Amplitude");

% 6
Bp=2*1/rs;
Bh=Bp;
h=sin(2*Bh*b)/b;