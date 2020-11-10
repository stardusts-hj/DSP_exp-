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
n = 0:49;  % ���е���س�����50
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
k=0:49;
W=exp(-2*pi/50);
X=x1*(exp(-j*pi/25)).^(n'*k);
magX=abs(X); %���� x(n)�ķ�����
subplot(3,1,2);stem(magX);title('��������ź����еķ�����');
angX=angle(X); %���� x(n)����λ��
subplot(3,1,3);stem(angX) ; title ('��������ź����е���λ��'); 


%% 1.3.3.1-4 �����ź����еĲ�����ʱ��ͷ�Ƶ����Ƶ����
%% ��˹����
naa=0:15;
p=8;
q=8;
xaa = exp(-(naa-p).^2/q);
kaa=0:15;
Xaa = xaa*(exp(-j*pi/8)).^(naa'*kaa);
magXaa=abs(Xaa);
angXaa=angle(Xaa);
subplot(3,1,1); stem(naa, xaa,"green"); title("ʱ��");
subplot(3,1,2); stem(kaa, magXaa); title("��ֵ����");
subplot(3,1,3); stem(kaa, angXaa); title("��λ����");
%% ˥����������
nbb=0:15;
alpha=0.1;
f=0.0625;
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
kcc=0:7;
Xcc=xcc*(exp(-j*pi/4)).^(ncc'*kcc);
magXcc=abs(Xcc);
angXcc=angle(Xcc);
subplot(3,1,1); stem(ncc, xcc,"green"); title("ʱ��");
subplot(3,1,2); stem(kcc, magXcc); title("��ֵ����");
subplot(3,1,3); stem(kcc, angXcc); title("��λ����");
%% ����������
for i=1:4
    xdd(i)=5-i;
end
for i=5:8
    xdd(i)=i-3;
end
ndd=0:7;
kdd=0:7;
Xdd=xdd*(exp(-j*pi/4)).^(ndd'*kdd);
magXdd=abs(Xdd);
angXdd=angle(Xdd);
subplot(3,1,1); stem(ndd, xdd,"green"); title("ʱ��");
subplot(3,1,2); stem(kdd, magXdd); title("��ֵ����");
subplot(3,1,3); stem(kdd, angXdd); title("��λ����");
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
Xbb = xbb*(exp(-j*pi/8)).^(nbb'*kbb);
Ybb = ybb*(exp(-j*pi/8)).^(nbb'*kbb);
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