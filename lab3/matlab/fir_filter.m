%% FIR 3.3.2.1 Hanning �� ������λ��ͨ�˲���

N=15;
w1=0.3;
w2=0.5;
Window=hanning(N + 1);
b=fir1(N, [w1 w2],Window);
freqz(b,1);

% N=45 ʱ ���ɴ���խ���½�����

%% Blackman ��

N=15;
w1=0.3;
w2=0.5;
Window=blackman(N + 1);
b=fir1(N, [w1 w2],Window);
freqz(b,1);

% 12pi/N ���ɴ����� �� ���Ǽ��͹����С

%% Kaiser�����������λ�˲���

N=40;
beta=4;
Window=kaiser(N+1,beta );




