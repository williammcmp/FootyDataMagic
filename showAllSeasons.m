% Generates the combined fiagues for all seasons
function showAllSeasons(homeTeam, awayTeam, removeOutliers)

    years = keys(homeTeam);
    
    % --------------------------
    %       is normal??
    % --------------------------
    
    % Winning scores fitted to normal distribution - appro falls into nomral
    fig = figure;
    set(fig, 'Name', 'QQ Plot of Winning Scores versus Normal Distribution');
    for i=1:numel(years)
        winning = calWinningScores(homeTeam(years{i}), awayTeam(years{i}));
        if (removeOutliers)
            [winning, winningOutliers] = calRemoveOutliers(winning);
        end
        pd = makedist('Normal');
        subplot(3,4,i)
        qqplot(winning, pd);
        title(years{i});
        [H, pValue, W] = swtest(winning);
        disp([i, H, pValue, W])
        subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
        xlabel("Points")
    end
    
    % Lossing scores fitted to normal distribution - appro falls into nomral
    fig = figure;
    set(fig, 'Name', 'QQ Plot of Losing Scores versus Normal Distribution');
    for i=1:numel(years)
        lossing = calLossingScores(homeTeam(years{i}), awayTeam(years{i}));
        if (removeOutliers)
            [lossing, losingOutliers] = calRemoveOutliers(lossing);
        end
        pd = makedist('Normal');
        subplot(3,4,i)
        qqplot(lossing, pd);
        title(years{i});
        [H, pValue, W] = swtest(lossing);
        disp([i, H, pValue, W])
        subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
        xlabel("Points")
    end


     % Lossing scores fitted to normal distribution - appro falls into nomral
    fig = figure;
    set(fig, 'Name', 'QQ Plot of Scores Margin versus Normal Distribution');
    for i=1:numel(years)
        margin = calMargins(homeTeam(years{i}), awayTeam(years{i}));
        if (removeOutliers)
            [margin, marginOutliers] = calRemoveOutliers(margin);
        end
        pd = makedist('Normal');
        subplot(3,4,i)
        qqplot(margin, pd);
        title(years{i});
        [H, pValue, W] = swtest(margin);
        disp([i, H, pValue, W])
        subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
        xlabel("Points")
    end
    
    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Winning scores in histogram
    fig = figure;
    set(fig, 'Name', 'Histogram of Winnings scores from each season');
    for i=1:numel(years)
        winning = calWinningScores(homeTeam(years{i}), awayTeam(years{i}));
        subplot(3,4,i)
        h = histogram(winning, 15);
        h.Normalization = 'pdf';
        title(years{i});
        xlabel("Points")
    end
    
    % Lossing scores in histogram
    fig = figure;
    set(fig, 'Name', 'Histogram of Losing scores from each season');
    for i=1:numel(years)
        lossing = calLossingScores(homeTeam(years{i}), awayTeam(years{i}));
        subplot(3,4,i)
        h = histogram(lossing, 15);
        h.Normalization = 'pdf';
        title(years{i});
        xlabel("Points")

    end
    
    
    
    % --------------------------
    %       Any outliers??
    % --------------------------

   showBoxPlots(homeTeam, awayTeam);
end