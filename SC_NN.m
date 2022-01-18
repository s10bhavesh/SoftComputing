clc;
clear all;
close all;
p1=-4:0.1:4;
p2=-4:0.1:4;
for i=1:length(p1)
    for j=1:length(p2)
        t(i,j)=sin(pi*p1(i)/4).*sin(pi*p2(j)/4);
    end
end
surfc(p1,p2,t);
no_hidden=10;
w1=rand(no_hidden,2);
b1=rand(1,no_hidden);
w2=rand(1,no_hidden);
b2=rand;
for k=1:100
for i=1:length(p1)
    for j=1:length(p2)
        out1=tansig(w1*[p1(i) p2(j)]'+b1');
        out2(i,j)=w2*out1+b2;
        err(i,j)=t(i,j)-out2(i,j);
        w2=w2+2*0.01*err(i,j)*out1';
        b2=b2+2*0.01*err(i,j);
        w1=w1+2*0.01*err(i,j)*diag([1-(out1).^2])*w2'*[p1(i) p2(j)];
        b1=b1+2*0.01*err(i,j)*(diag([1-(out1).^2])*w2')';
    end
end
end
figure
surfc(p1,p2,out2);
