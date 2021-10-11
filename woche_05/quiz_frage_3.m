close all;
clear all;
clc;

x = [0;1;2;3];
fx = [1;2;7;13];
h = 1;
% A = [1,0,0,0,0,0;
%      1/6,2/6,1/6,0,0;
%      0,1/6,2/6,1/6,0;
%      0,0,1/6,2/6,1/6;
%      0,0,0,0,1];
%  y = [y2s0;y2s1;y2s2;y2s3;y2s4];
%  L = [0;5-1;6-5;0];
 
 A = [1,0,0,0;
     1/6,2/3,1/6,0;
     0,1/6,2/3,1/6;
     0,0,0,1];
%  y = [y2s0;y2s1;y2s2;y2s3];
 y = zeros(4,1);
 L = [0;4;1;0];
 
 figure
%  plot(x,fx)
 hold on
 
 y = A\L;
 
 x1 = linspace(0,3);
 y1 = spline(x,fx,x1);
 
 lsg_quiz = spline(x,fx,[2;2.25;2.5;2.75;3]);
 plot(x1,y1)

abcd = zeros(4,1);
m_koeff_inv = [0,0,-1/6,1/6;
           0,0,1/2,0;
           -1,1,-1/3,-1/6;
           1,0,0,0];
m_koeff = [0,0,0,1;
           1,1,1,1;
           0,2,0,0;
           6,2,0,0];      
s = [1;2;y(1);y(2)];
abcd = m_koeff\s;


       
       
       