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

%% Kaiser窗设计线性相位滤波器

N=40;
beta=4;
Window=kaiser(N+1,beta );




