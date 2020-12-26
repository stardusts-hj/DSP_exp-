%% FIR 3.3.2.1 Hanning �� ������λ��ͨ�˲���

N=45;
w1=0.3;
w2=0.5;
Window=hanning(N + 1);
b=fir1(N, [w1 w2],Window);
figure(1);
freqz(b,1);

% N=45 ʱ ���ɴ���խ���½����� ͨ��Ҳ��խ��

%% Blackman ��

N=15;
w1=0.3;
w2=0.5;
Window=blackman(N + 1);
b=fir1(N, [w1 w2],Window);
figure(2);
freqz(b,1);

% 12pi/N ���ɴ����� �� ���Ǽ��͹����С

%% boxcar��

N=15;
w1=0.3;
w2=0.5;
Window=boxcar(N + 1);
b=fir1(N, [w1 w2],Window);
figure(3);
freqz(b,1);

% 4pi/N


%% Kaiser�� ���������λ�˲���

N=40;
beta=4;
Window=kaiser(N+1,beta );
%beta Խ�� �԰�Խ�ͣ���������Խ�� 

% ����fir1������ƶ��ͨ�����
low=0.2;
band1=[0.4 0.6];
band2= 0.8;
b=fir1(N, [low band1 band2],Window);
fvtool(b,1);
