%% ������fft���� ������������
N=1024;
% a=randn(1,N);
% ��˹����
n=0:1023;
p=512;   %q=8, p=14ʱ����Ƶ��й¶
q=300;
a = exp(-(n-p).^2/q);
a0=a;

%% ����
tic
A=fft_pro(a0,N);
toc
t_fft_pro=toc;

figure(1);
stem(a0);title("�����ź�ʱ��");
figure(2);
stem(abs(A));title("�Ա��fft");
figure(3);
stem(abs(fft(a0)));

%% fft_pro
function X = fft_pro(a, N)
NV2=N/2;
NM1=N-1;
J=1;
I=1;

while(I<NM1)
    if I<J
        M=a(I);
        a(I)=a(J);
        a(J)=M;
    end
    K=NV2;
    while(K<J)
        J=J-K;
        K=K/2;
    end
        J=K+J;
        I=I+1;
end

% �ݹ�������㲿��
A=a;
L=1;
M=log2(N);
while(L<=M)
    LE=2^L;
    LE1=LE/2;
    U=1;
    W=exp(-1i*pi/LE1);
    J=1;
    while(J<=LE1)
        I=J;
        while(I<=N)
            IP=I+LE1;
            T=A(IP)*U;
            A(IP)=A(I)-T;
            A(I)=A(I)+T;
            I=I+LE;
        end
        U=U*W;
        J=J+1;
    end
    L=L+1;
end
X=A;
end