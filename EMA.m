function y = EMA(data, windowSize)
    % This is the formula to calculate the Exponential Moving Average (EMA)
    % EMA = Price(t)×k + EMA(y)×(1−k)
    % where:
    % t =   today
    % y =   yesterday
    % N =   number of days in EMA
    % k =   2÷(N+1)
    smoothing = 2
    k         = smoothing / (windowSize + 1)

    ema       = zeros(length(data), 1)
    ema(1)    = data(1)
    
    for t = 2:length(data)
        ema(t) = data(t) * k  +  ema(t - 1) * (1 - k);
    end
    y = ema
end

% This calculates the Exponential Moving Average (EMA) ussing the filter function.
function y = EMA_FILTER(data, windowSize)
    smoothing   = 2
    alpha       = smoothing / (windowSize + 1);
    bk          = [1, -(1 - alpha)]; 
    y           = filter(alpha, bk, data(end - 1000 + 1 :end, :));
end

