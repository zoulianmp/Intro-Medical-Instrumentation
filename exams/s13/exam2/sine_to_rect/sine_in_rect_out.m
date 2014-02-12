function []=sin_in_out()

figure;
t = [0:0.000001:0.01];
in = 5*sin(2000*pi*t);
plot(t*1e3,in,'-k','LineWidth',2);
xlabel('Time (ms)','FontSize',18);
ylabel('Voltage (V)','FontSize',18);
title('Input Signal','FontSize',18);
set(gca,'FontSize',18);
print -dpng sine_in.png

figure;
out = in;
out(out < -2) = -2;
out(out > 3) = 3;
plot(t*1e3,out,'-k','LineWidth',2);
set(gca,'YTick',[-5 -2 0 3 5]);
xlabel('Time (ms)','FontSize',18);
ylabel('Voltage (V)','FontSize',18);
title('Output Signal','FontSize',18);
ylim([-5 5])
set(gca,'FontSize',18);
print -dpng rect_out.png

infft = fft(in);
outfft = fft(out);
fs = 1/mean(diff(t));
f = linspace(-fs/2,fs/2,length(t));
figure;
plot(f,fftshift(20*log10(abs(infft)./max(abs(infft)))));
xlim([0 10e3]);
set(gca,'FontSize',18);
xlabel('Frequency (Hz)','FontSize',18);
ylabel('Normalized Power (dB)','FontSize',18);
title('Input Signal Power Spectrum','FontSize',18);

figure;
plot(f,fftshift(20*log10(abs(outfft)./max(abs(outfft)))));
xlim([0 10e3]);
set(gca,'FontSize',18);
xlabel('Frequency (Hz)','FontSize',18);
ylabel('Normalized Power (dB)','FontSize',18);
title('Output Signal Power Spectrum','FontSize',18);
