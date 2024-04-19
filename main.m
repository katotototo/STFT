[Signal,Fs] = audioread("bisei.wav");
WinLen = 1024;
ShiftWidth = WinLen/2;

S = stft(Signal,Fs,WinLen,ShiftWidth);

%メモ
%パラメータ設定
% Fs = 16000; %サンプリング周波数
% t = linspace(0,10,10*Fs);
% f = 4000; %周波数
%n = 10;%窓長のパラメータ

%信号の生成

%tMax = max(Signal); %時間の最大値
% SinWave = sin(2*pi*f*t); %読み込み信号

%各長決定
%SignalLen = tMax*Fs; %信号長
%WinLen = power(2,n); %窓長
%ShiftWidth = WinLen/2; %シフト幅
%J = ceil(SignalLen/ShiftWidth) + 1; %時間フレーム数

%ハン窓
% HannWinWidth = (0:1:WinLen-1); %ハン
% HannWin = 0.5 - 0.5*cos((2*pi*HannWinWidth)/(WinLen-1));