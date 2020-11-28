%% ��������
% matlab��������������������������1��ʼ
% ������fft�任�У���ô��㿪ʼ�����������������ע��

% �����׵������㷨 ����ΪN��Ϊ2��ָ����
% a(I)Ϊ����������У�a(J)Ϊ��������У���I<Jʱ�Ż��򣬵�I>=Jʱ���������Ѿ�����
% ��֪һ��������J������һ��������������J�����λ��1�����λ��λ

N=8;
a=randn(1,N);
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
%% fft�任
%    ���õݹ�ķ���, ���ѭ�����Ƶݹ����M=log_{2}N
%    ��ÿһ����fft�У����õ������㡣��K��, a(k, i)��a(k, i+2^(K-1))���е�������
%    I �� IP �ǹ��ɵ�������������ڵ�
%    Ŀǰ�����㾫�Ȼ���һЩ����
N=8;
A0=randn(1,N);
A=A0;
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
%% ������fft���� ������������
N=1024;
% a=randn(1,N);
% ��˹����
n=0:1023;
p=512;   %q=8, p=14ʱ����Ƶ��й¶
q=300;
a = exp(-(n-p).^2/q);
a0=a;


%��������
% n=0:1023;
% a=zeros(1,1024);
% for i = 1:512
%     a(i)=1;
% end
% a0=a;

% ˥���������� 512����
% n=0:512;
% alpha=0.1;
% f=0.0625;
% % f=0.4375;
% % f=0.5625;
% a = exp(-alpha*n).*sin(2*pi*f*n);
% a0=a;
% N=512;


%%  fft ���� 
% ֻ����NΪ��������� 

% ���򲿷�

%��¼cpu����ʱ��
tic
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
toc
t_udf=toc;

subplot(3,1,1);stem(a0);title("�����ź�ʱ��");
subplot(3,1,2);stem(abs(A));title("�Ա��fft");

tic
A_fft=fft(a0);
toc
t_fft=toc

subplot(3,1,3);stem(abs(A_fft));title("matlab �Դ���fft����");



