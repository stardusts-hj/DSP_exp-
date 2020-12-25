%% �˲��������

% butterworh    's'��ʾģ���򣬲������ʾ���������
% [n,Wn]=buttord(Wp,Ws,Rp,Rs,'s');
% [b,a]=butter(n,Wn); freqz(b,a,512,1);
% chebyshev
%[n,Wn]=cheb1ord(Wp,Ws,Rp,Rs,'s'); [b,a]=cheby1(n,1,Wn);
%freqz(b,a,512,1);

%% IIR 3.3.1.1 

Fs = 1*0.5;  % Sampling Frequency

fs = 0.2;         % Stopband 
fp = 0.3;         % Passband 
As = 20;          % Stopband Attenuation (dB)
Ap = 0.8;         % Passband Ripple (dB)

[n, Wn] = cheb1ord(fp, fs, Ap, As);
[b, a] = cheby1(n, Ap, Wn, 'high');
fvtool(b,a);

% fir ��Ƶ�ͼ�� 
% N����̫С�����������ȹ��󣬵��¹��ɴ�����
N=18;
b_fir=fir1(N, fp,'high', blackman(N+1));
fvtool(b_fir,1);


%% IIR 3.3.1.2 ���ֵ�ͨ�˲���

Fs = 1*0.5;  % Sampling Frequency

fs = 0.3;         % Stopband 
fp = 0.2;         % Passband 
As = 25;          % Stopband Attenuation (dB)
Ap = 1;         % Passband Ripple (dB)

[n, Wn] = buttord(fp, fs, Ap, As);
[b, a] = butter(n, Wn);
fvtool(b,a);

% N=9  fir
N=9;
Window=blackman(N+1);
b_fir=fir1(N, fp, Window);
fvtool(b_fir, 1);

%% IIR 3.3.1.3 ���ִ�ͨ�˲���

Fs=1e5*0.5;
fp1=20e3;
fp2=30e3;
fs1=15e3;
fs2=35e3;
Ap=1;
As = 40;

[n, Wn] = buttord([fp1 fp2]/Fs, [fs1 fs2]/Fs, 1, 40);
[b,a] = butter(n, Wn);
fvtool(b,a);

%N=15 fir
N=15;
Window=blackman(N+1);
b_fir=fir1(N, [fp1,fp2]/Fs, Window);
fvtool(b_fir, 1);
