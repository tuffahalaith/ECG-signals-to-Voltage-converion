clear;
close all;
duration = 5;
fs = 1000;
t = 0:1/fs:duration-1/fs;
amp = 1;
freq = 50;
emg = amp * sin(2*pi*freq*t);
noise = randn(size(emg));
emg_noisy = emg + 0.1 * noise;
d = designfilt('bandpassiir', 'FilterOrder', 2, 'HalfPowerFrequency1', 20, 'HalfPowerFrequency2', 500, 'SampleRate', fs);
emg_filtered = filtfilt(d, emg_noisy);
window_size = 100;
emg_rms = sqrt(movmean(emg_filtered.^2, window_size));
scaling_factor = 10;
voltage = emg_rms * scaling_factor;
figure;
subplot(5, 1, 1);
plot(t, emg);
title('Original EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(5, 1, 2);
plot(t, emg_noisy);
title('Noisy EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(5, 1, 3);
plot(t, emg_filtered);
title('Filtered EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(5, 1, 4);
plot(t, emg_rms);
title('RMS Value of Filtered EMG Signal');
xlabel('Time (s)');
ylabel('Amplitude');
subplot(5, 1, 5);
plot(t, voltage);
title('Voltage Output');
xlabel('Time (s)');
ylabel('Voltage (V)');
sgtitle('EMG Signal Processing');