function y = PlotSmaAndEma(product)
    Table       = readtable(strcat(product, '.csv'))
    
    figure('Name', strcat('Part 1.1 and 1.2 for .',product), 'NumberTitle', 'off');
    hold on;
    
    windowSize = 100
    
    CLOSE_SMA  = SMA(Table.Close    (end - 999:end, :), windowSize);
    CLOSE_EMA  = EMA(Table.Close    (end - 999:end, :), windowSize);
    
    plot(Table.Date(end - (999):end, :), Table.Close(end - (999):end, :), 'b', 'DisplayName', 'ORG');
    plot(Table.Date(end - (999):end, :), CLOSE_SMA,                       'r', 'DisplayName', 'SMA' + string(windowSize));
    plot(Table.Date(end - (999):end, :), CLOSE_EMA,                       'g', 'DisplayName', 'EMA' + string(windowSize));
    
    title(strcat(product, 'Stock Close Price with Moving Averages'));
    xlabel('Date');
    ylabel('Stock Price');
    legend('show');
    grid on;
    y = 1
end
