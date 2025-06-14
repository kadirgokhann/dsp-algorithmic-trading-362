% This is a simple moving average (SMA) calculation where the average is taken over the last windowSize days.
% It is simple loop iteration over the data and collects the average of the last windowSize days.
function y = SMA(productFeedPrices, windowSize)
    % y[n] =(1/windowSize) * (y[n-windowSize] + ... y[n])
    y     = zeros(1000,1); 
    index = 1
    for j = 1:1000
        last        = j + windowSize/2 - 1; 
        first       = j - windowSize/2;      
        if (first < 1)
            first = 1;
        end
        if (last > 1000)
            last = 1000;
        end
        y(index, 1) = mean(productFeedPrices(first:last));
        index       = index + 1
    end
end
% calculation sma with convolution operation
function y = SMA_CONV(data, windowSize)
    bk  = ones(windowSize, 1)/windowSize
    y   = conv(data(end - 1000 - windowSize + 2 :end, :), bk, 'valid');
end

% calculation sma with a builtin function
function y = SMA_BUILTIN(productFeedPrices, windowSize)
    y = movmean(productFeedPrices, windowSize);
end

