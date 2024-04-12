clear;close all;clc

Fs = 16000; %サンプリング周波数
t = linspace(0,10,10*Fs);
f = 100; %周期
tMax = max(t); %時間の最大値

SinWave = sin(2*pi*f*t); %読み込み信号

SignalLen = tMax*Fs; %信号長
n = 10;
WinLen = power(2,n); %窓長
ShiftWidth = WinLen/2; %シフト幅
J = ((SignalLen-WinLen)/ShiftWidth) - 1; %時間フレーム数

A = zeros(WinLen,J); %ゼロ行列
HannWinWidth = (0:1:WinLen-1); %ハン
HannWin = 0.5 - 0.5*cos((2*pi*HannWinWidth)/(SignalLen-1));

for j = 1:J
A(:,j) = SinWave((j-1)*ShiftWidth + 1 :(j-1)*ShiftWidth + WinLen); %それぞれの始点から窓長の最後までの要素
end
HannWint = HannWin.';
B = HannWint.*A;