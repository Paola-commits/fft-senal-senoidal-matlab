% Señal senoidal en el dominio del tiempo
A = 3;              % Amplitud
phi = pi/6;         % Fase inicial en radianes
f = 10;             % Frecuencia en Hz
w = 2*pi*f;         % Frecuencia angular
T = 1/f;            % Periodo
N = 3;              % Número de periodos a mostrar
n = 360;            % Resolución (puntos por periodo)

t = 0:1/(n*f):N*T;  % Vector de tiempo
y = A*sin(w*t + phi);

figure;
plot(t,y);
title('Figura 1: Señal senoidal en el tiempo');
xlabel('Tiempo (s)');
ylabel('Amplitud');

% Transformada de Fourier - Magnitud del espectro
Y = fft(y);              % FFT de la señal
L = length(y);           % Número de muestras
P2 = abs(Y/L);           % Espectro de dos lados
P1 = P2(1:L/2+1);        % Espectro de un solo lado
P1(2:end-1) = 2*P1(2:end-1);

f_axis = (0:(L/2))*(n*f/L); % Eje de frecuencias

figure;
plot(f_axis, P1);
title('Figura 2: Magnitud del espectro de la señal senoidal');
xlabel('Frecuencia (Hz)');
ylabel('|Y(f)|');

% Fase del espectro
fase = angle(Y(1:L/2+1));

figure;
plot(f_axis, fase);
title('Figura 3: Fase del espectro de la señal senoidal');
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
