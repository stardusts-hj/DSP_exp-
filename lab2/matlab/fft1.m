%% 反序输入
% matlab的数组索引必须是正整数，从1开始
% 但是在fft变换中，最好从零开始，所以最好在排序中注意

% 采用雷道整序算法 输入为N，为2的指数倍
% a(I)为正常序的序列，a(J)为反序的序列，当I<J时才换序，当I>=J时，不换序，已经换过
% 已知一个反序数J，求下一个反序数，等于J在最高位加1再向地位进位

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
%% fft变换
%    采用递归的方法, 外侧循环控制递归次数M=log_{2}N
%    在每一级的fft中，利用蝶形运算。第K次, a(k, i)和a(k, i+2^(K-1))进行蝶形运算
%    I 和 IP 是构成蝶形运算的两个节点
%    目前的运算精度还有一些问题
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
%% 整个的fft程序 定义输入序列
N=1024;
% a=randn(1,N);
% 高斯序列
n=0:1023;
p=512;   %q=8, p=14时产生频谱泄露
q=300;
a = exp(-(n-p).^2/q);
a0=a;


%矩形序列
% n=0:1023;
% a=zeros(1,1024);
% for i = 1:512
%     a(i)=1;
% end
% a0=a;

% 衰减正弦序列 512个数
% n=0:512;
% alpha=0.1;
% f=0.0625;
% % f=0.4375;
% % f=0.5625;
% a = exp(-alpha*n).*sin(2*pi*f*n);
% a0=a;
% N=512;


%%  fft 程序 
% 只接受N为整数的情况 

% 整序部分

%记录cpu花费时间
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

% 递归蝶形运算部分
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

subplot(3,1,1);stem(a0);title("输入信号时域");
subplot(3,1,2);stem(abs(A));title("自编的fft");

tic
A_fft=fft(a0);
toc
t_fft=toc

subplot(3,1,3);stem(abs(A_fft));title("matlab 自带的fft函数");



