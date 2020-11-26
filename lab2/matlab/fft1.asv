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

