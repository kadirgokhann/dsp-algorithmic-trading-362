function y = MACD(product, lastDays)    
    Table      = readtable(strcat(product, '.csv'));
    
    figure;
    hold on;
    % Extracting the last 1000 days of data, to calulcate EMA12 and EMA26
    EMA_12   = EMA(Table.Close    (end - (lastDays - 1):end, :), 12);
    EMA_26   = EMA(Table.Close    (end - (lastDays - 1):end, :), 26);
    
    % Calculation o MACD
    MACD_LINE      = EMA_12 - EMA_26
    SIGNAL_LINE    = EMA(MACD_LINE, 9)
    HISTOGRAM      = MACD_LINE - SIGNAL_LINE
    
    % Plotting the data
    plot(Table.Date(end - (lastDays - 1):end, :), Table.Close(end - (lastDays - 1):end, :), 'b', 'DisplayName', 'ORG');
    plot(Table.Date(end - (lastDays - 1):end, :), HISTOGRAM,                                'r', 'DisplayName', 'Histogram');
    plot(Table.Date(end - (lastDays - 1):end, :), SIGNAL_LINE,                              'b', 'DisplayName', 'Signal');
    plot(Table.Date(end - (lastDays - 1):end, :), MACD_LINE,                                'y', 'DisplayName', 'MACD');
    
    title(strcat(product,' Stock Close Price with Moving Averages'));
    xlabel('Date');
    ylabel('Stock Price');
    legend('show');
    grid on;
    y = 1
end