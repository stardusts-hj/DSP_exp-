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
n = 0:50; %序列的相关长度是50,
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
k=-25:25;
W=(pi/12.5)*k;
X=x3*(exp(-j*pi/12.5)).^(n'*k);
magX=abs(X); %绘制 x(n)的幅度谱
subplot(3,1,2);stem(magX);title('理想采样信号序列的幅度谱');
angX=angle(X); %绘制 x(n)的相位谱
subplot(3,1,3);stem(angX) ; title ('理想采样信号序列的相位谱'); 


%% 1.3.3.1 典型信号序列的产生
%% 高斯序列
naa=0:16;
p=8;
q=8;
xaa = exp(-(naa-p).^2/q);
stem(naa, xaa);
%% 衰减正弦序列
nbb=0:16;
alpha=1;
f=0.01;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
%% 三角波序列  
% matlab 数组下标从1开始
for i=1:4
    xcc(i)=i;
end
for i=5:8
    xcc(i)=8-i;
end
ncc=0:7;
stem(ncc,xcc);
%% 反三角序列
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;
stem(ndd,xdd);
%% 1.3.3.2 观察三角波序列和反三角波序列的时域和频域特性
% p=8 q=2,4,8   时域和幅频特性 

    