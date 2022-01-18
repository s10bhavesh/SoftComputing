clc;
clear all;
close all;
a=hardlim(rand(10,8)-0.5);
a(:,9)=bin2dec(num2str(a(:,1:8)));
a(:,10)=(a(:,9)/255)*2*pi-pi;
a(:,11)=sin(a(:,10))+cos(a(:,10));
a=sortrows(a,-11);
for gen=1:10
    gen
index=randperm(8);
for i=1:4
    parent1=a(index(2*i-1),1:8);
    parent2=a(index(2*i),1:8);
    cross_pos=ceil(rand*7);
    child1=[parent1(1:cross_pos) parent2(cross_pos+1:8)];
    child2=[parent2(1:cross_pos) parent1(cross_pos+1:8)];
    a(10+2*i-1,1:8)=child1;
    a(10+2*i,1:8)=child2;
end
a(:,9)=bin2dec(num2str(a(:,1:8)));
a(:,10)=(a(:,9)/255)*2*pi-pi;
a(:,11)=sin(a(:,10))+cos(a(:,10));
a=sortrows(a,-11);
a=a(1:10,:);
end