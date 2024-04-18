[Signal,Fs] = audioread("bisei.wav");
WinLen = 1024;
ShiftWidth = 512;

S = stft(Signal,Fs,WinLen,ShiftWidth);
S