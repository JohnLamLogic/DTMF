clear all
close all

fs = 8000;
Ts = 1/fs;
t = 0:Ts:1;
A = 1;
P1 = pi/5;
P2 = pi/3;

if fs < 2*1477
    error('fs too low')
end

% Digit 0
fr0 = 941; fc0 = 1336;
z0 = A*cos(2*pi*fr0.*t + P1) + A*cos(2*pi*fc0.*t + P2);

% Digit 1
fr1 = 697; fc1 = 1209;
z1 = A*cos(2*pi*fr1.*t + P1) + A*cos(2*pi*fc1.*t + P2);

% Digit 2
fr2 = 697; fc2 = 1336;
z2 = A*cos(2*pi*fr2.*t + P1) + A*cos(2*pi*fc2.*t + P2);

% Digit 3
fr3 = 697; fc3 = 1477;
z3 = A*cos(2*pi*fr3.*t + P1) + A*cos(2*pi*fc3.*t + P2);

% Digit 4
fr4 = 770; fc4 = 1209;
z4 = A*cos(2*pi*fr4.*t + P1) + A*cos(2*pi*fc4.*t + P2);

% Digit 5
fr5 = 770; fc5 = 1336;
z5 = A*cos(2*pi*fr5.*t + P1) + A*cos(2*pi*fc5.*t + P2);

% Digit 6
fr6 = 770; fc6 = 1477;
z6 = A*cos(2*pi*fr6.*t + P1) + A*cos(2*pi*fc6.*t + P2);

% Digit 7
fr7 = 852; fc7 = 1209;
z7 = A*cos(2*pi*fr7.*t + P1) + A*cos(2*pi*fc7.*t + P2);

% Digit 8
fr8 = 852; fc8 = 1336;
z8 = A*cos(2*pi*fr8.*t + P1) + A*cos(2*pi*fc8.*t + P2);

% Digit 9
fr9 = 852; fc9 = 1477;
z9 = A*cos(2*pi*fr9.*t + P1) + A*cos(2*pi*fc9.*t + P2);

Z = {z0,z1,z2,z3,z4,z5,z6,z7,z8,z9};

seq_digits = [3 0 5]; %-User inputs here-%
seq = [];

for k = 1:length(seq_digits)
    d = seq_digits(k);
    tone = Z{d+1};
    delay = rand;
    sil = zeros(1, round(delay*fs));
    seq = [seq tone sil]; 
end

soundsc(seq, fs)

tf = 0:Ts:(length(seq)-1)*Ts;
figure
plot(tf, seq)
axis([0 tf(end) -2*A 2*A])
xlabel('Time (s)')
ylabel('Amp')
title(['DTMF sequence: ', sprintf('%d', seq_digits)])
