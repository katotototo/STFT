function S = stft(Signal,Fs,WinLen,ShiftWidth)
%function stft stftを実行する関数
%Signal 音声信号
%Fs サンプリング周波数
%WinLen 窓長
%ShiftWidth シフト長
%S 出力(スペクトログラムの格納行列)

%0を追加した波形を生成
C = zeros(1,ShiftWidth);%前につけるベクトル
D = zeros(1,WinLen-1);%後ろにつけるベクトル
Signal = [C,Signal.',D];
SignalLen = size(Signal.',1);
J = fix(SignalLen/ShiftWidth) - 1; %時間フレーム数

A = zeros(WinLen,J); %ゼロ行列
S = zeros(WinLen,J); %ゼロ行列
HannWin = hann(WinLen);

for j = 1:J
    temp = Signal((j-1)*ShiftWidth + 1 :(j-1)*ShiftWidth + WinLen);%それぞれの要素を格納
    tempWin = HannWin.*temp.'; %それぞれにハン窓をかける
    S = fft(tempWin); %fftする
    temp2 = (abs(S)); %絶対値とる(デシベルの計算ため)
    temp3 = 20*log10(temp2); %デシベル計算
    A(:,j) = temp3; 
end

XAxis = linspace(0,SignalLen/Fs,J); %x軸設定
YAxis = linspace(0,Fs,WinLen); %y軸設定
axis xy

imagesc(XAxis,YAxis,A);
axis xy
xlabel("時間[s]");
ylabel("周波数[Hz]");
ylim([0 Fs/2]);
colorbar
clim([-20 40]);
fontsize("increase");
end