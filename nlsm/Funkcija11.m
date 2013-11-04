function [ f11 ] =Funkcija11 (x1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%f11=(log(x1))-(7/(2.*(x1)+6));
 f11=(log(x1))-(mldivide((2.*(x1)+6),7));
end
