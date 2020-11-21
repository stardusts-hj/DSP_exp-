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
subplot(2,1,1);stem(t,y);
Y=fft(y);
subplot(2,1,2);stem(t,Y);
%% f1=1000Hzȡ��
n = 0:50;  % ���е���س�����51
T1=0.001;
x1=A*exp(-a*n*T1).*sin(w*n*T1);
subplot(2,1,1);stem(n,x1);
k=-25:25;
W=exp(-1i*pi/12.5);
X1=x1*(exp(-1i*pi/12.5)).^(n'*k);
magX1=abs(X1);
subplot(2,1,2);stem(n,magX1);
%% f2 = 300Hzȡ��
T2=1/300;
x2 = A*exp(-a*n*T2).*sin(w*n*T2);
subplot(2,1,1);stem(n,x2);
W=exp(-1i*pi/12.5);
X2=x2*(exp(-1i*pi/12.5)).^(n'*k);
magX2=abs(X2);
subplot(2,1,2);stem(n,magX2);
%% f3=200Hzȡ�� 
T3=1/200;
x3 = A*exp(-a*n*T3).*sin(w*n*T3);
subplot(2,1,1);stem(n,x3);
W=exp(-1i*pi/12.5);
X3=x3*(exp(-1i*pi/12.5)).^(n'*k);
magX3=abs(X3);
subplot(2,1,2);stem(n,magX3);
%% �鿴�źŵķ����׺���λ��
k=-25:25;
W=exp(-1i*pi/12.5);
X=x1*(exp(-1i*pi/12.5)).^(n'*k);
magX=abs(X); %���� x(n)�ķ�����
subplot(3,1,2);stem(magX);title('��������ź����еķ�����');
angX=angle(X); %���� x(n)����λ��
subplot(3,1,3);stem(angX) ; title ('��������ź����е���λ��'); 


%% 1.3.3.1-4 �����ź����еĲ�����ʱ��ͷ�Ƶ����Ƶ����
%% ��˹����
naa=0:15;
p=13;   %q=8, p=14ʱ����Ƶ��й¶
q=8;
xaa = exp(-(naa-p).^2/q);
kaa=0:15;
Xaa = xaa*(exp(-1i*pi/8)).^(naa'*kaa);
magXaa=abs(Xaa);
angXaa=angle(Xaa);
subplot(3,1,1); stem(naa, xaa,"green"); title("ʱ��");
subplot(3,1,2); stem(kaa, magXaa); title("��ֵ����");
subplot(3,1,3); stem(kaa, angXaa); title("��λ����");
%% ˥����������
nbb=0:15;
alpha=0.1;
f=0.0625;
% f=0.4375;
% f=0.5625;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
kbb=0:15;
Xbb = xbb*(exp(-j*pi/8)).^(nbb'*kbb);
magXbb=abs(Xbb);
angXbb=angle(Xbb);
subplot(3,1,1); stem(nbb, xbb,"green"); title("ʱ��");
subplot(3,1,2); stem(kbb, magXbb); title("��ֵ����");
subplot(3,1,3); stem(kbb, angXbb); title("��λ����");
%% ���ǲ�����  
% matlab �����±��1��ʼ
for i=1:4
    xcc(i)=i;
end
for i=5:8
    xcc(i)=8-i;
end
ncc=0:7;
Xcc=fft(xcc);
magXcc=abs(Xcc);
angXcc=angle(Xcc);
subplot(3,1,1); stem(ncc, xcc,"green"); title("ʱ��");
subplot(3,1,2); stem(ncc, magXcc); title("��ֵ����");
subplot(3,1,3); stem(ncc, angXcc); title("��λ����");
%% ����������
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;

Xdd=fft(xdd);
magXdd=abs(Xdd);
angXdd=angle(Xdd);
subplot(3,1,1); stem(ndd, xdd,"green"); title("ʱ��");
subplot(3,1,2); stem(ndd, magXdd); title("��ֵ����");
subplot(3,1,3); stem(ndd, angXdd); title("��λ����");
%% ĩβ���� �������ܼ���
for i=9:16
    xdd(i)=0;
    xcc(i)=0;
end
ndd=0:15
Xdd=fft(xdd);
Xcc=fft(xcc);
magXdd=abs(Xdd);
magXcc=abs(Xcc);
subplot(3,1,1); stem(ndd, magXdd,"green"); title("ndd");
subplot(3,1,2); stem(ndd, magXcc,"red"); title("ncc");
%% 1.3.3.5 Ƶ�׻�����Ƶ��й¶�����µ������ź�Ӱ��
% ˥����������
nbb=0:63;
alpha=0.1;
f=0.0625;
xbb = exp(-alpha*nbb).*sin(2*pi*f*nbb);
% ��������ź�w(n)
w=randn(1,64);
ybb = xbb + w;
kbb=0:63;
Xbb = xbb*(exp(-1i*pi/32)).^(nbb'*kbb);
Ybb = ybb*(exp(-1i*pi/32)).^(nbb'*kbb);
magXbb=abs(Xbb);
angXbb=angle(Xbb);
magYbb=abs(Ybb);
angYbb=angle(Ybb);
subplot(2,3,1); stem(nbb, xbb,"green"); title("Xʱ��");
subplot(2,3,2); stem(kbb, magXbb); title("X��ֵ����");
subplot(2,3,3); stem(kbb, angXbb); title("X��λ����");
subplot(2,3,4); stem(nbb, xbb,"green"); title("Yʱ��");
subplot(2,3,5); stem(kbb, magXbb); title("Y��ֵ����");
subplot(2,3,6); stem(kbb, angXbb); title("Y��λ����");

%% 1.3.4.1 �ź����еĲ���
% ��������ź�����
n=0:49;
A = 444.128;
Ta=0.001;
a=50*sqrt(2.0)*pi;
w=50*sqrt(2.0)*pi;
xa = A*exp(-a*n*Ta).*sin(w*n*Ta);

%% ��λ��������
n=0:49;
xb=zeros(1,50);
xb(1)=1;close all;
stem(n,xb);

%% ��������
n=0:49;
xc=zeros(1,50);
for i=1:10
    xc(i)=1;
end
stem(n,xc);

%% �������ֵ�λ�弤��Ӧ
n=0:49;
ha=zeros(1,50);
for i = 1:10
    ha(i)=1;
end
stem(n,ha);

hb=zeros(1,50);
hb(1)=1; hb(2)=2.5; hb(3)=2.5;  hb(4)=1; close all;
subplot(1,2,1);stem(n, hb);
% ���hb�ķ�Ƶ����
Hb =fft(hb);
magHb=abs(Hb);
subplot(1,2,2);stem(n,magHb);
%% ��ɢ�źš�ϵͳ��ϵͳ��Ӧ�ķ���
% xb �� hb �����Ծ��
yb=conv(xb,hb);
subplot(1,3,1);stem(yb);title("yb");
nb=1:99;
Yb=fft(yb);
magYb=abs(Yb);
subplot(1,3,2);stem(nb,magYb);title("abs(Yb)");
subplot(1,3,3);stem(magHb);title("abs(Hb)");
%% xc �� ha �����Ծ��
yc=conv(xc,ha);
subplot(1,3,1);stem(yc);title("yc");
nc=1:99;
Yc=fft(yc);
magYc=abs(Yc);
subplot(1,3,2);stem(nc,magYc);title("Yc");
Xc=fft(xc);
HXc=Xc.*Xc;
subplot(1,3,3);stem(HXc);title("Xc*Hc");
%% �ı���
n=0:49;
xc5=zeros(1,50);
ha5=zeros(1,50);
for i=1:5
    xc5(i)=1;
    ha5(i)=1;
end
yc5=conv(xc5,ha5);
subplot(1,3,1);stem(yc5);title("yc");
nc=1:99;
Yc5=fft(yc5);
magYc5=abs(Yc5);
subplot(1,3,2);stem(magYc5);title("Yc");
Xc5=fft(xc5);
HXc5=Xc5.*Xc5;
subplot(1,3,3);stem(HXc5);title("Xc*Hc");
%% �滻Ϊxa(n)
n=0:49;
A = 1;
Ta=1;
a=0.4;
w=2.0734;
xa = A*exp(-a*n*Ta).*sin(w*n*Ta);
k=0:49;
W=exp(-2*pi/50);
Xa=xa*(exp(-1i*pi/25)).^(n'*k);
ya=conv(ha,xa);
Ya=fft(ya);
magYa=abs(Ya);
magXa=abs(Xa); %���� x(n)�ķ�����
subplot(3,1,1);stem(magXa);title('��������ź����еķ�����');
subplot(3,1,2);stem(magYa);title("Ya");
Ha=fft(ha);
HXa=Ha.*Xa;
magHXa=abs(HXa);
subplot(3,1,3);stem(magHXa);title("Ha*Xa");
%% ����������֤
ya = conv(xa, ha);
subplot(2,2,1);stem(ya);title("ya");
Ya=fft(ya);
na=1:99;
magYa=abs(Ya);
subplot(2,2,2);stem(na,magYa);title("Ya");

Ha=fft(ha);
Yha=Ha.*Xa;
subplot(2,2,3);stem(abs(Yha));title("Yha Ƶ�����");

