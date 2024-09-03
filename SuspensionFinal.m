[t,x] = ode45(@Parametros, [0 5], [0 0 0 0]); 

figure(1)
plot(t, x(:, 1), 'LineWidth', 1, 'Color', '#7d2181');
grid on
title("Posición de masa 1");
xlabel("Tiempo");
ylabel("Posición");

figure(2)
plot(t, x(:, 3), 'LineWidth', 1, 'Color', 'b');
grid on
title("Posición de masa 2");
xlabel("Tiempo");
ylabel("Posición");
function dx = Parametros(t, x)
    % Parametros de ejemplo
    m_1 = 290;
    b_1 = 1000;
    m_2 = 59;
    k_1 = 16182;
    f = 0;
    k_2 = 19000;

    % Valores modificables y seleccionables
    %z = 0.05 * sin(0.5 * pi * t);
    z = 0.05 * sin(20 * pi * t);

    % Funcionamiento del sistema
    dx = zeros(4, 1);

    dx(1) = x(2);
    dx(2) = (f - b_1 * x(2) + b_1 * x(4) - k_1 * x(1) + k_1 * x(3))* 1/m_1;
    dx(3) = x(4);
    dx(4) = (-f + k_2 * z + b_1 * x(2) - b_1 * x(4) + k_1 * x(1) - (k_1 + k_2) * x(3)) * 1/m_2;
end
