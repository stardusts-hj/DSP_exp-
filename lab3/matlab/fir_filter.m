%% FIR 3.3.2.1 Hanning 窗 线性相位带通滤波器

N=15;
w1=0.3;
w2=0.5;
Window=hanning(N + 1);
b=fir1(N, [w1 w2],Window);
freqz(b,1);

% N=45 时 过渡带更窄，下降更快

%% Blackman 窗

N=15;
w1=0.3;
w2=0.5;
Window=blackman(N + 1);
b=fir1(N, [w1 w2],Window);
freqz(b,1);

% 12pi/N 过渡带更宽 ， 但是肩峰和过冲更小

%% Kaiser窗 设计线性相位滤波器

N=40;
beta=4;
Window=kaiser(N+1,beta );
%beta 越大， 旁瓣约矮，但主瓣宽度越大 

% 利用fir1函数设计多个通带阻带
low=0.2;
band1=[0.4 0.6];
band2= 0.8;
b=fir1(N, [low band1 band2],Window);
fvtool(b,1);
