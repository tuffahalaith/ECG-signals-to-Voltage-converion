# ECG-signals-to-Voltage-converion
emg = amp * sin(2*pi*freq*t);
first i defined the parameters for generating a synthetic EMG signal with a duration of 5 seconds, 
a sampling frequency of 1000 Hz, an amplitude of 1, and a frequency of 50 Hz.
i created a time vector 't' and use it to generate a sinusoidal EMG signal.

Add noise to the EMG signal
noise = randn(size(emg));
emg_noisy = emg + 0.1 * noise;
A random Gaussian white noise generated with the same size as the original EMG signal and add it to the EMG signal to simulate the presence of noise.
This creates a noisy EMG signal that resembles a more realistic scenario.

Filter the noisy EMG signal
a 2nd order band-pass filter with half-power frequencies of 20 Hz and 500 Hz, using the designfilt function. 
i applied this filter to the noisy EMG signal using the filtfilt function, which performs zero-phase digital filtering 
( the filtered signal doesn't have any phase distortion). This results in a filtered EMG signal with reduced noise.

Calculate RMS value of the filtered EMG signal:
The Root Mean Square (RMS) value is a measure of the signal's amplitude and is commonly used to estimate muscle effort from EMG signals.
i calculated the RMS value by first squaring the filtered EMG signal and then calculating the moving average with a window size of 100. 
then take the square root of the moving average to obtain the RMS values.

Convert muscle effort to voltage:
a scaling factor must be used to convert the RMS values, representing muscle effort, to voltage values. 
In this example, a scaling factor of 10 to represent a 0-10V range.

Results:
![2](https://github.com/user-attachments/assets/13038a29-199f-443b-a897-18cb53b7858b)

Scheme scenario
![image](https://github.com/user-attachments/assets/92e2d494-8a3b-4cc0-b4de-00392902d683)

