
%% FIR lowpass
N=120;
Fs=48e3;  %����Ƶ�� 48kHz
Fp=8e3;   %ͨ����ֹƵ��8kHz
Ap=0.01;
Ast=80;
% ���ͨ��������Ĳ������ƫ��
Rp  = (10^(Ap/20) - 1)/(10^(Ap/20) + 1);
Rst = 10^(-Ast/20);
% ����˲���
NUM = firceqrip(N, Fp/(Fs/2), [Rp, Rst], 'passedge');
fvtool(NUM, 'Fs', Fs);