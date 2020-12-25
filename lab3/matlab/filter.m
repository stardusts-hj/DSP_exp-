%% 滤波器的设计

% butterworh    's'表示模拟域，不加则表示数字与设计
% [n,Wn]=buttord(Wp,Ws,Rp,Rs,'s');
% [b,a]=butter(n,Wn); freqz(b,a,512,1);
% chebyshev
%[n,Wn]=cheb1ord(Wp,Ws,Rp,Rs,'s'); [b,a]=cheby1(n,1,Wn);
%freqz(b,a,512,1);

%% IIR 3.3.1.1 

Fs = 1;  % Sampling Frequency

fs = 0.2;         % Stopband 
fp = 0.3;         % Passband 
As = 20;          % Stopband Attenuation (dB)
Ap = 0.8;         % Passband Ripple (dB)

[n, Wn] = cheb1ord(fs, fp, Ap, As, 's');
[b, a] = cheby1(n, Ap, Wn, 'high', 's');
freqs(b,a);
[bz,az] = impinvar(b, a, Fs);
%freqz(bz, az, 512, 1);


%% IIR 3.3.1.2 数字低通滤波器

Fs = 1;  % Sampling Frequency

fs = 0.3;         % Stopband 
fp = 0.2;         % Passband 
As = 25;          % Stopband Attenuation (dB)
Ap = 1;         % Passband Ripple (dB)

[n, Wn] = buttord(fp, fs, Ap, As, 's');
[b, a] = butter(n, Wn, 's');
freqs(b,a);
[bz,az] = impinvar(b, a, 1);
%[bz,az]=bilinear(b,a,1);
[H,w] = freqz(bz, az);
%plot(w, abs(H));
