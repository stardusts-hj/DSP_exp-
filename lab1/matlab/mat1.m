%%  1.32理想采样信号序列的特性分析
% 注意n=0:15; 时，代表n取值从0到14
%% 定义了原始信号 xa(t)
t = 0:0.001:0.05;
A = 444.128;
a=50*sqrt(2.0)*pi;
w=50*sqrt(2.0)*pi;
xa = A*exp(-a*t).*sin(w*t);
%% 绘制图像   如何绘制出连续的信号曲线  
% xa(t) 的周期 T =0.0282843 
y = xa;
subplot(2,1,1);stem(t,y);
Y=fft(y);
subplot(2,1,2);stem(t,Y);
%% f1=1000Hz取样
n = 0:50;  % 序列的相关长度是51
A = 444.128;
a=50*sqrt(2.0)*pi;
w=50*sqrt(2.0)*pi;
T1=0.001;
x1=A*exp(-a*n*T1).*sin(w*n*T1);
subplot(2,1,1);stem(n,x1);title("时域图形");
k=-25:25;
W=exp(-1i*pi/12.5);
X1=x1*(exp(-1i*pi/12.5)).^(n'*k);
magX1=abs(X1);
subplot(2,1,2);stem(n,magX1);title("1000Hz采样频域图形");
%% f2 = 300Hz取样
T2=1/300;
x2 = A*exp(-a*n*T2).*sin(w*n*T2);
subplot(2,1,1);stem(n,x2);title("时域图形");
W=exp(-1i*pi/12.5);
X2=x2*(exp(-1i*pi/12.5)).^(n'*k);
magX2=abs(X2);
subplot(2,1,2);stem(n,magX2);title("300Hz采样频域图形");
%% f3=200Hz取样 
T3=1/200;
x3 = A*exp(-a*n*T3).*sin(w*n*T3);
subplot(2,1,1);stem(n,x3);title("时域图形");
W=exp(-1i*pi/12.5);
X3=x3*(exp(-1i*pi/12.5)).^(n'*k);
magX3=abs(X3);
subplot(2,1,2);stem(n,magX3);title("200Hz采样频域图形");
%% 查看信号的幅度谱和相位谱
k=-25:25;
W=exp(-1i*pi/12.5);
X=x1*(exp(-1i*pi/12.5)).^(n'*k);
magX=abs(X); %绘制 x(n)的幅度谱
subplot(3,1,2);stem(magX);title('理想采样信号序列的幅度谱');
angX=angle(X); %绘制 x(n)的相位谱
subplot(3,1,3);stem(angX) ; title ('理想采样信号序列的相位谱'); 


%% 1.3.3.1-4 典型信号序列的产生，时域和幅频、相频特性
%% 高斯序列
naa=0:15;
p=8;   %q=8, p=14时产生频谱泄露
q=8;
xaa = exp(-(naa-8).^2/q);
kaa=0:15;
subplot(3,2,1); stem(naa, xaa,"green"); title("p=8 时域");
subplot(3,2,2); stem(kaa, abs(fft(xaa)),"red"); title("p=8 幅值特性");

xaa = exp(-(naa-13).^2/q);
kaa=0:15;
subplot(3,2,3); stem(naa, xaa,"green"); title("p=13 时域");
subplot(3,2,4); stem(kaa, abs(fft(xaa)),"red"); title("p=13 幅值特性");

xaa = exp(-(naa-14).^2/q);
kaa=0:15;
subplot(3,2,5); stem(naa, xaa,"green"); title("p=14 时域");
subplot(3,2,6); stem(kaa, abs(fft(xaa)),"red"); title("p=14 幅值特性");



%% 衰减正弦序列
nbb=0:15;
alpha=0.1;
f=0.0625;
% f=0.4375;
% f=0.5625;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
Xbb = fft(xbb);
subplot(3,2,1); stem(nbb, xbb,"green"); title("f=0.0625 时域");
subplot(3,2,2); stem(nbb, abs(Xbb),"red"); title("f=0.0625 幅值特性");

f=0.4375;
xbb1 = exp(-alpha*nbb).*sin(2*pi*f*nbb);
Xbb1 = fft(xbb1);
subplot(3,2,3); stem(nbb, xbb1,"green"); title("f=0.4375; 时域");
subplot(3,2,4); stem(nbb, abs(Xbb1),"red"); title("f=0.4375; 幅值特性");

f=0.5625;
xbb2 = exp(-alpha*nbb).*sin(2*pi*f*nbb);
Xbb2= fft(xbb2);
subplot(3,2,5); stem(nbb, xbb2,"green"); title("f=0.5625; 时域");
subplot(3,2,6); stem(nbb, abs(Xbb2),"red"); title("f=0.5625; 幅值特性");

%% 三角波序列  
% matlab 数组下标从1开始
for i=1:4
    xcc(i)=i;
end
for i=5:8
    xcc(i)=8-i;
end
ncc=0:7;
Xcc=fft(xcc);
magXcc=abs(Xcc);

subplot(3,2,1); stem(ncc, xcc,"green"); title("8点三角波序列时域");
subplot(3,2,2); stem(ncc, magXcc,"red"); title("8点三角波序列幅频特性");

% 反三角序列
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;

Xdd=fft(xdd);
magXdd=abs(Xdd);

subplot(3,2,3); stem(ndd, xdd,"green"); title("8点反三角波序列时域");
subplot(3,2,4); stem(ndd, magXdd,"red"); title("8点反三角波序列幅频特性");

% 末尾补零 采样更密集了
for i=9:16
    xdd(i)=0;
    xcc(i)=0;
end
ndd=0:15
Xdd=fft(xdd);
Xcc=fft(xcc);
magXdd=abs(Xdd);
magXcc=abs(Xcc);
subplot(3,2,5); stem(ndd, magXcc,"green"); title("16点三角波序列幅频特性");
subplot(3,2,6); stem(ndd, magXdd,"red"); title("16点反三角波序列幅频特性");
%% 1.3.3.5 频谱混淆和频谱泄露现象下的噪声信号影响
% 衰减正弦序列
nbb=0:63;
alpha=0.1;
f=0.0625;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
% 添加噪声信号w(n)
w=randn(1,64);
ybb = xbb + w;
kbb=0:63;
Xbb = xbb*(exp(-1i*pi/32)).^(nbb'*kbb);
Ybb = ybb*(exp(-1i*pi/32)).^(nbb'*kbb);
magXbb=abs(Xbb);
angXbb=angle(Xbb);
magYbb=abs(Ybb);
angYbb=angle(Ybb);
subplot(2,3,1); stem(nbb, xbb,"green"); title("X时域");
subplot(2,3,2); stem(kbb, magXbb); title("X幅值特性");
subplot(2,3,3); stem(kbb, angXbb); title("X相位特性");
subplot(2,3,4); stem(nbb, xbb,"green"); title("Y时域");
subplot(2,3,5); stem(kbb, magXbb); title("Y幅值特性");
subplot(2,3,6); stem(kbb, angXbb); title("Y相位特性");

%% 1.3.4.1 信号序列的产生
% 理想采用信号序列
n=0:49;
A = 444.128;
Ta=0.001;
a=50*sqrt(2.0)*pi;
w=50*sqrt(2.0)*pi;
xa = A*exp(-a*n*Ta).*sin(w*n*Ta);

%% 单位脉冲序列
n=0:49;
xb=zeros(1,50);
xb(1)=1;close all;
stem(n,xb);

%% 矩形序列
n=0:49;
xc=zeros(1,50);
for i=1:10
    xc(i)=1;
end
stem(n,xc);

%% 产生两种单位冲激响应
n=0:49;
ha=zeros(1,50);
for i = 1:10
    ha(i)=1;
end
stem(n,ha);

hb=zeros(1,50);
hb(1)=1; hb(2)=2.5; hb(3)=2.5;  hb(4)=1; close all;
subplot(1,2,1);stem(n, hb);
% 求出hb的幅频特性
Hb =fft(hb);
magHb=abs(Hb);
subplot(1,2,2);stem(n,magHb);
%% 离散信号、系统和系统响应的分析
% xb 和 hb 的线性卷积
yb=conv(xb,hb);
subplot(1,3,1);stem(yb);title("yb");
nb=1:99;
Yb=fft(yb);
magYb=abs(Yb);
subplot(1,3,2);stem(nb,magYb);title("abs(Yb)");
subplot(1,3,3);stem(magHb);title("abs(Hb)");
%% xc 和 ha 的线性卷积
yc=conv(xc,ha);
subplot(1,3,1);stem(yc);title("yc");
nc=1:99;
Yc=fft(yc);
magYc=abs(Yc);
subplot(1,3,2);stem(nc,magYc);title("Yc");
Xc=fft(xc);
HXc=Xc.*Xc;
subplot(1,3,3);stem(HXc);title("Xc*Hc");
%% 改变宽度
n=0:49;
xc5=zeros(1,50);
ha5=zeros(1,50);
for i=1:5
    xc5(i)=1;
    ha5(i)=1;
end
yc5=conv(xc5,ha5);
subplot(1,3,1);stem(yc5);title("yc");
nc=1:99;
Yc5=fft(yc5);
magYc5=abs(Yc5);
subplot(1,3,2);stem(magYc5);title("Yc");
Xc5=fft(xc5);
HXc5=Xc5.*Xc5;
subplot(1,3,3);stem(HXc5);title("Xc*Hc");
%% 替换为xa(n)
n=0:49;
A = 1;
Ta=1;
a=0.4;
w=2.0734;
xa = A*exp(-a*n*Ta).*sin(w*n*Ta);
k=0:49;
W=exp(-2*pi/50);
Xa=xa*(exp(-1i*pi/25)).^(n'*k);
ya=conv(ha,xa);
Ya=fft(ya);
magYa=abs(Ya);
magXa=abs(Xa); %绘制 x(n)的幅度谱
subplot(3,1,1);stem(magXa);title('理想采样信号序列的幅度谱');
subplot(3,1,2);stem(magYa);title("Ya");
Ha=fft(ha);
HXa=Ha.*Xa;
magHXa=abs(HXa);
subplot(3,1,3);stem(magHXa);title("Ha*Xa");
%% 卷积定理的验证
ya = conv(xa, ha);
subplot(2,2,1);stem(ya);title("ya");
Ya=fft(ya);
na=1:99;
magYa=abs(Ya);
subplot(2,2,2);stem(na,magYa);title("Ya");

Ha=fft(ha);
Yha=Ha.*Xa;
subplot(2,2,3);stem(abs(Yha));title("Yha 频域相乘");

