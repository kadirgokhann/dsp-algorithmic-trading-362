function y = Simulation(product)
    TableRaw    = readtable(strcat(product, '.csv'));
    Table       = TableRaw(end - 999:end, :);

    EMA_12         = EMA(Table.Close, 12);
    EMA_26         = EMA(Table.Close, 26);
    MACD_LINE      = EMA_12 - EMA_26;
    SIGNAL_LINE    = EMA(MACD_LINE, 9);
    HISTOGRAM      = MACD_LINE - SIGNAL_LINE;

    account = 10000;
    pos    = 0;
    accountHistory = zeros(600,1)
    
    % risk mngmt, let's say we trade margin.
    positionLow  = -20;
    positionHigh = 20;
    pnlLow       = -1000;
    
    gtwFile         = fopen(strcat(product, '_gtw.txt'),         'w');
    pnlAndPosFile   = fopen(strcat(product, '_pnl_and_pos.txt'), 'w');


    alpha = 1
    beta  = 1
    sigma = 1

    for j = 401:1000
        accountHistory(j-400) = account
        % MACD Line crosses above Signal Line : Possible Buy Signal
        % MACD Line crosses below Signal Line : Possible Sell Signal
        % Histogram > 0 and increasing 	        : Strengthening trend
        % Histogram < 0 and decreasing                : Weakening trend

        crossUp   = MACD_LINE(j-1)* alpha < SIGNAL_LINE(j-1) && MACD_LINE(j)*beta > SIGNAL_LINE(j)* sigma;
        crossDown = MACD_LINE(j-1)* alpha > SIGNAL_LINE(j-1) && MACD_LINE(j)*beta < SIGNAL_LINE(j)* sigma;
   
        hist_slope = HISTOGRAM(j) - HISTOGRAM(j-1);
    
        % Strength check
        bullish_strength = HISTOGRAM(j) > 0 && hist_slope > 0;
        bearish_strength = HISTOGRAM(j) < 0 && hist_slope < 0;
    
        % Final signals
        buy  = crossUp   && bullish_strength;
        sell = crossDown && bearish_strength;
        
        if buy
            prc     = 10* Table.Close(j);
            if positionHigh <= pos || positionLow >= pos || pnlLow >= account 
                fprintf(pnlAndPosFile,  'Day %d: Account %d Pos:%d BUY REJECTED BY RISK MANAGEMENT SYSTEM\n', j, account, pos);
                continue;
            end

            account = account - prc;
            pos     = pos + 10;
            fprintf(gtwFile,        'Day %d: BUY %d lcurrency of Stock %s\n', j, prc, product);
            fprintf(pnlAndPosFile,  'Day %d: Account:%d Pos:%d\n', j, account, pos);
        end
        if sell
              prc     = 10* Table.Close(j);
              if positionHigh <= pos || positionLow >= pos || pnlLow >= account 
                    fprintf(pnlAndPosFile,  'Day %d: Account %d Pos:%d SELL REJECTED BY RISK MANAGEMENT SYSTEM\n', j, account, pos);
                    continue;
              end
              account = account + prc;
              pos     = pos - 10;
              fprintf(gtwFile,        'Day %d: SELL %d lcurrency of Stock %s\n', j, prc, product);
              fprintf(pnlAndPosFile,  'Day %d: Account:%d Pos:%d\n', j, account, pos);
        end
    end
    y = account - 10000;
    fprintf('Pnl for the product %s is %d\n', product, y);



    figure('Name', strcat('Part 3 for .',product), 'NumberTitle', 'off');
    hold on;

    plot(Table.Date(end - (599):end, :), accountHistory, 'r', 'DisplayName', strcat('Account for ', product));
    plot(Table.Date(end - (599):end, :), ones(600, 1)*10000, 'b', 'DisplayName', strcat('Start point '));
    title(strcat(product, 'Account History'));
    xlabel('Date');
    ylabel('Account');
    legend('show');
    grid on;

        
end


           
        
