%% 3.3.4.1 generate signal

n=0:59;

x0=0.5+1.2*sin(2*pi*0.05.*n)+0.5*cos(2*pi*0.28.*n);
w=awgn(x0,5,'measured');
x1=x0+w;
subplot(2,1,1);stem(n,x0); title("未加入高斯白噪声");
subplot(2,1,2);stem(n,x1);title("加入噪声后5db");
