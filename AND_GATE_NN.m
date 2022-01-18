clc;
clear all;
close all;
p=[0 0 0; 0 0 1; 0 1 0; 0 1 1; 1 0 0; 1 0 1; 1 1 0; 1 1 1];
t=[0 1 1 0 1 0 0 1];
w=zeros(1,3);
b=0;
for j=1:1000
    j
for i=1:8
    inp=p(i,:);
    out=hardlim(inp*w'+b);
    err(i)=t(i)-out;
    w=w+err(i)*inp;
    b=b+err(i);
end
if (sum(abs(err))==0)
    break;
end
end