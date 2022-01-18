%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

x1=-10:0.1:10;
x2=-10:0.1:10;


%Schaffer's Function
for i=1:length(x1)
   for j=1:length(x2)
      y(i,j)=  0.5 + ( ((sin((x1(i) .^2 + x2(j) .^2) .^0.5)) .^2)-0.5) ./ ( ((0.001*(x1(i) .^2 + x2(j) .^2)+1)) );
   end
end

count=1;

mesh(x1,x2,y);
title('Plot of Schaffer function')
xlabel('x1')
ylabel('x2')
zlabel('Schaffer function')

% 2-M-N-1 MLP
% M=10, N=10
w1=rand(10,2);
w2=rand(10,10);
w3=rand(1,10);
b1=rand(10,1);
b2=rand(10,1);
b3=rand;

%Initial random surface of the Output:
y3=rand(length(x1),length(x2));

for itr=1:10
for i=1:length(x1)
   for j=1:length(x2)
      p=[x1(i);x2(j)];
      %Layer1 o/p
      y1=logsig(w1*p+b1);
      %Layer2 o/p
      y2=logsig(w2*y1+b2);
      %Layer3 o/p
      y3(i,j)=w3*y2+b3;
      %error
      e(i,j)=y(i,j)-y3(i,j);
      %disp(e(i,j))
      %Update rules:
      w3=w3+2*0.01*e(i,j)*y2';
      b3=b3+2*0.01*e(i,j);
      w2=w2+2*0.01*e(i,j)*diag(y2)*(eye(10,10)-diag(y2))*w3'*y1';
      b2=b2+2*0.01*e(i,j)*diag(y2)*(eye(10,10)-diag(y2))*w3';
      w1=w1+2*0.01*e(i,j)*(y1*(1-y1)')*w2'*(y2*(1-y2)')*w3'*p';
      b1=b1+2*0.01*e(i,j)*(y1*(1-y1)')*w2'*(y2*(1-y2)')*w3';
      count=count+1;
   end
    pause(0.0000000000000000001)
    mesh(x1,x2,y3)
    title('MLP Evolution from random surface to Schaffer function')
    xlabel('x1')
    ylabel('x2')
    zlabel('Function Approximation')
    legend(strcat('count=',num2str(count)))
end
 
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



YouTube link:

https://youtu.be/yZA-vYpacYY
