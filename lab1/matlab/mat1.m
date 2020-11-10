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
plot(t,y);
%% f1=1000Hz取样
n = 0:49;  % 序列的相关长度是50
T1=0.001;
x1=A*exp(-a*n*T1).*sin(w*n*T1);
stem(n,x1);
%% f2 = 300Hz取样
T2=1/300;
x2 = A*exp(-a*n*T2).*sin(w*n*T2);
%% f3=200Hz取样 
T3=1/200;
x3 = A*exp(-a*n*T3).*sin(w*n*T3);
%% 查看信号的幅度谱和相位谱
k=0:49;
W=exp(-2*pi/50);
X=x1*(exp(-j*pi/25)).^(n'*k);
magX=abs(X); %绘制 x(n)的幅度谱
subplot(3,1,2);stem(magX);title('理想采样信号序列的幅度谱');
angX=angle(X); %绘制 x(n)的相位谱
subplot(3,1,3);stem(angX) ; title ('理想采样信号序列的相位谱'); 


%% 1.3.3.1-4 典型信号序列的产生，时域和幅频、相频特性
%% 高斯序列
naa=0:15;
p=8;
q=8;
xaa = exp(-(naa-p).^2/q);
kaa=0:15;
Xaa = xaa*(exp(-j*pi/8)).^(naa'*kaa);
magXaa=abs(Xaa);
angXaa=angle(Xaa);
subplot(3,1,1); stem(naa, xaa,"green"); title("时域");
subplot(3,1,2); stem(kaa, magXaa); title("幅值特性");
subplot(3,1,3); stem(kaa, angXaa); title("相位特性");
%% 衰减正弦序列
nbb=0:15;
alpha=0.1;
f=0.0625;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
kbb=0:15;
Xbb = xbb*(exp(-j*pi/8)).^(nbb'*kbb);
magXbb=abs(Xbb);
angXbb=angle(Xbb);
subplot(3,1,1); stem(nbb, xbb,"green"); title("时域");
subplot(3,1,2); stem(kbb, magXbb); title("幅值特性");
subplot(3,1,3); stem(kbb, angXbb); title("相位特性");
%% 三角波序列  
% matlab 数组下标从1开始
for i=1:4
    xcc(i)=i;
end
for i=5:8
    xcc(i)=8-i;
end
ncc=0:7;
kcc=0:7;
Xcc=xcc*(exp(-j*pi/4)).^(ncc'*kcc);
magXcc=abs(Xcc);
angXcc=angle(Xcc);
subplot(3,1,1); stem(ncc, xcc,"green"); title("时域");
subplot(3,1,2); stem(kcc, magXcc); title("幅值特性");
subplot(3,1,3); stem(kcc, angXcc); title("相位特性");
%% 反三角序列
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;
kdd=0:7;
Xdd=xdd*(exp(-j*pi/4)).^(ndd'*kdd);
magXdd=abs(Xdd);
angXdd=angle(Xdd);
subplot(3,1,1); stem(ndd, xdd,"green"); title("时域");
subplot(3,1,2); stem(kdd, magXdd); title("幅值特性");
subplot(3,1,3); stem(kdd, angXdd); title("相位特性");
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
Xbb = xbb*(exp(-j*pi/8)).^(nbb'*kbb);
Ybb = ybb*(exp(-j*pi/8)).^(nbb'*kbb);
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