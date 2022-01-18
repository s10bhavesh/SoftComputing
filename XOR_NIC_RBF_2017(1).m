clc;
clear all;
close all;
inp=[0 0;0 1;1 0;1 1];
cen=[0 0;0 1;1 0;1 1];
t=[0 1 1 0];
sig=0.7;
for i=1:4
    for j=1:4
        d(i,j)=distance(inp(i,:),cen(j,:));
        R(i,j)=exp((-(d(i,j))^2)/(2*sig^2));
    end
end
w=inv(R)*t';
test=[0 0;1 1];
for i=1:2
    for j=1:4
        d1(i,j)=distance(test(i,:),cen(j,:));
        R1(i,j)=exp((-(d1(i,j))^2)/(2*sig^2));
    end
end
test_out=R1*w
