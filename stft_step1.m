clear;close all;clc

[Signal,Fs] = audioread("bisei.wav");
%パラメータ設定
% Fs = 16000; %サンプリング周波数
% t = linspace(0,10,10*Fs);
% f = 4000; %周波数
n = 10;%窓長のパラメータ

%信号の生成

%tMax = max(Signal); %時間の最大値
% SinWave = sin(2*pi*f*t); %読み込み信号

%各長決定
%SignalLen = tMax*Fs; %信号長
WinLen = power(2,n); %窓長
ShiftWidth = WinLen/2; %シフト幅
%J = ceil(SignalLen/ShiftWidth) + 1; %時間フレーム数

%0を追加した波形を生成
C = zeros(1,ShiftWidth);%前につけるベクトル
D = zeros(1,WinLen-1);%後ろにつけるベクトル
Signal = [C,Signal.',D];
% SinWave = [zeros(1,ShiftWidth),SinWave,zeros(1,WinLen-1)]; %作った波形
SignalLen = size(Signal.',1);
J = fix(SignalLen/ShiftWidth) - 1; %時間フレーム数

S = zeros(WinLen,J); %ゼロ行列
HannWinWidth = (0:1:WinLen-1); %ハン
HannWin = 0.5 - 0.5*cos((2*pi*HannWinWidth)/(WinLen-1));
%HannWin = hann((0:1:WinLen-1),0.5 - 0.5*cos((2*pi*(0:1:WinLen-1))/(WinLen-1)));

for j = 1:J
%%A(:,j) = SinWave((j-1)*ShiftWidth + 1 :(j-1)*ShiftWidth + WinLen); %それぞれの始点から窓長の最後までの要素
    %temp = SinWave((j-1)*ShiftWidth + 1 :(j-1)*ShiftWidth + WinLen);
    temp = Signal((j-1)*ShiftWidth + 1 :(j-1)*ShiftWidth + WinLen);
    tempWin = HannWin.*temp;
    temp1 = fft(tempWin);
    temp2 = (abs(temp1));
    temp3 = 20*log10(temp2);
    S(:,j) = temp3;
end

XAxis = linspace(0,SignalLen/Fs,J);
YAxis = linspace(0,Fs,WinLen);
axis xy

imagesc(XAxis,YAxis,S);
axis xy
xlabel("時間[s]");
ylabel("周波数[Hz]");
colorbar