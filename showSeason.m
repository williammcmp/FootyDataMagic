% generates all staticall figues for a single season
function showSeason(homeTeam, awayTeam, year)
    
    fig = figure;
    set(fig, 'Name', "Plots of " + year + " season", 'Position', [10, 10, 1100, 900]);

    % --------------------------
    %       is normal??
    % --------------------------
    
    % Winning scores fitted to normal distribution 
    subplot(4,3,1)
    winning = calWinningScores(homeTeam(year), awayTeam(year));
    pd = makedist('Normal');
    qqplot(winning, pd);
    title('QQ Plot of Winning Scores versus Normal Distribution');

    % Lossing scores fitted to normal distribution
    subplot(4,3,2)
    lossing = calLossingScores(homeTeam(year), awayTeam(year));
    pd = makedist('Normal');
    qqplot(lossing, pd);
    title('QQ Plot of Losing Scores versus Normal Distribution');

    % margin scores fitted to normal distribution
    subplot(4,3,3)
    margin = calMargins(homeTeam(year), awayTeam(year));
    pd = makedist('Normal');
    qqplot(margin, pd);
    title('QQ Plot of score Margins versus Normal Distribution');

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Winning scores in histogram
    subplot(4,3,4)
    winning = calWinningScores(homeTeam(year), awayTeam(year));
    h = histogram(winning, 15);
    h.Normalization = 'pdf';
    title('Histogram of Winning scores');

    % Lossing scores in histogram
    subplot(4,3,5)
    lossing = calLossingScores(homeTeam(year), awayTeam(year));
    h = histogram(lossing, 15);
    h.Normalization = 'pdf';
    title('Histogram of Losing scores');
    xlabel("Points")

    % Margin scores in histogram
    subplot(4,3,6)
    margin = calMargins(homeTeam(year), awayTeam(year));
    h = histogram(margin, 15);
    h.Normalization = 'pdf';
    title('Histogram of score Margins');
    xlabel("Points")


    % --------------------------
    %       Any outliers??
    % --------------------------

    % Winning scores in boxplots - more outliers in eariler seaons
    subplot(4,3,7)
    winning = calWinningScores(homeTeam(year), awayTeam(year));
    boxplot(winning);
    xlabel(year);
    ylabel('Points');
    title("Boxplot of Winnings Scores")

    % Lossing scores in boxplots - more outliers in eariler seaons
    subplot(4,3,8)
    lossing = calLossingScores(homeTeam(year), awayTeam(year));
    boxplot(lossing);
    xlabel(year);
    ylabel('Points');
    title("Boxplot of Losing Scores")

    % Margin scores in boxplots - more outliers in eariler seaons
    subplot(4,3,9)
    margin = calMargins(homeTeam(year), awayTeam(year));
    boxplot(margin);
    xlabel(year);
    ylabel('Points');
    title("Boxplot of Scores Margin")

    
end