fs = 44100;
[audioIn, fs] = audioread("aud_p1.wav");
[f0, idx] = pitch(double(audioIn), fs);

[cor,l] = xcorr(audioIn);


subplot(3,1,1)
plot(audioIn)
ylabel('Amplitud')

subplot(3,1,2)
plot(idx,f0)
ylabel('Pitch (Hz)')
xlabel('Numb Sampler')

subplot(3,1,3)
plot(c)
ylabel('Autocorrelació')
