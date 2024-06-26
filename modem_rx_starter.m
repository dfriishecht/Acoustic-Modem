
load short_modem_rx.mat

% The received signal includes a bunch of samples from before the
% transmission started so we need discard these samples that occurred before
% the transmission started. 

start_idx = find_start_of_signal(y_r,x_sync);
% start_idx now contains the location in y_r where x_sync begins
% we need to offset by the length of x_sync to only include the signal
% we are interested in
y_t = y_r(start_idx+length(x_sync):end); % y_t is the signal which starts at the beginning of the transmission
t = (0:length(y_t))./Fs
c = cos(2*pi*f_c/Fs*[0:length(4099)-1]')
%plot(t, cos_c)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Put your decoder code here
%%

soundsc(y_t, Fs)
plot_ft_rad(y_t, Fs)
new_y = y_t.*c;
soundsc(new_y, Fs)

plot_ft_rad(new_y, Fs)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% convert to a string assuming that x_d is a vector of 1s and 0s
% representing the decoded bits
%BitsToString(x_d)

