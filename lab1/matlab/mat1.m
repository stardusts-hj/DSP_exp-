%%  1.32��������ź����е����Է���
% ע��n=0:15; ʱ������nȡֵ��0��14
%% ������ԭʼ�ź� xa(t)
t = 0:0.001:0.05;
A = 444.128;
a=50*sqrt(2.0)*pi;
w=50*sqrt(2.0)*pi;
xa = A*exp(-a*t).*sin(w*t);
%% ����ͼ��   ��λ��Ƴ��������ź�����  
% xa(t) ������ T =0.0282843 
y = xa;
plot(t,y);
%% f1=1000Hzȡ��
n = 0:50; %���е���س�����50,
T1=0.001;
x1=A*exp(-a*n*T1).*sin(w*n*T1);
stem(n,x1);
%% f2 = 300Hzȡ��
T2=1/300;
x2 = A*exp(-a*n*T2).*sin(w*n*T2);
%% f3=200Hzȡ�� 
T3=1/200;
x3 = A*exp(-a*n*T3).*sin(w*n*T3);
%% �鿴�źŵķ����׺���λ��
k=-25:25;
W=(pi/12.5)*k;
X=x3*(exp(-j*pi/12.5)).^(n'*k);
magX=abs(X); %���� x(n)�ķ�����
subplot(3,1,2);stem(magX);title('��������ź����еķ�����');
angX=angle(X); %���� x(n)����λ��
subplot(3,1,3);stem(angX) ; title ('��������ź����е���λ��'); 


%% 1.3.3.1 �����ź����еĲ���
%% ��˹����
naa=0:16;
p=8;
q=8;
xaa = exp(-(naa-p).^2/q);
stem(naa, xaa);
%% ˥����������
nbb=0:16;
alpha=1;
f=0.01;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
%% ���ǲ�����  
% matlab �����±��1��ʼ
for i=1:4
    xcc(i)=i;
end
for i=5:8
    xcc(i)=8-i;
end
ncc=0:7;
stem(ncc,xcc);
%% ����������
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;
stem(ndd,xdd);
%% 1.3.3.2 �۲����ǲ����кͷ����ǲ����е�ʱ���Ƶ������
% p=8 q=2,4,8   ʱ��ͷ�Ƶ���� 

    