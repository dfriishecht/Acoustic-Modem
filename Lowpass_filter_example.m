	
	Fs = 8192;   	% set the sampling frequency
	W = 2*pi*500;	% set the cutoff frequency to 2 pi * 500 rads/s
	t = [-100:1:99]*(1/Fs);   % create a 200 sample time vector to generate sinc
	h = W/pi*sinc(W/pi*t);   % this is the impulse response
	plot(t, h);   	% plot h to visualize

	title('Impulse Response of Lowpass Filter');
	figure
	plot_ft_rad(h, Fs)  % Visualize |H(j\omega)|
	title('Magnitude of H(j\omega)');
	x = randn(2*Fs, 1); % generate 2 seconds of noise (no need to understand what this is doing)
	figure
	plot_ft_rad(x, Fs); % plot the magnitude of the FT of the noise
	title('Magnitude of FT of unfiltered noise');
	soundsc(x, Fs);   	% listen to the noise, wait for it to finish playing
    pause(3);
	y = conv(x, h);     % convolve x with h to filter the noise
	figure
	plot_ft_rad(y, Fs); % plot the magnitude of the FT of the filtered noise
	title('Magnitude of FT of filtered noise');
	soundsc(y, Fs);	% listen to the filtered noise
