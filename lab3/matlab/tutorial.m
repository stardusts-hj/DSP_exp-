
%% FIR lowpass
N=120;
Fs=48e3;  %采样频率 48kHz
Fp=8e3;   %通带截止频率8kHz
Ap=0.01;
Ast=80;
% 最大通带和阻带的波纹最大偏差
Rp  = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
Rst = 10^(-Ast/20);
% 设计滤波器
NUM = firceqrip(N, Fp/(Fs/2), [Rp, Rst], 'passedge');
fvtool(NUM, 'Fs', Fs);