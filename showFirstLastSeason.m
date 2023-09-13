function showFirstLastSeason(homeTeam, awayTeam, year1, year2)

    fig1 = figure;
    set(fig1, "Name", "Plots of Winning Score", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Winning scores in histogram - year1
    subplot(2,2,1)
    winning = calWinningScores(homeTeam(year1), awayTeam(year1));
    h = histogram(winning, 15);
    h.Normalization = "pdf";
    title("Histogram of Winning scores - " + num2str(year1));
    [H, pValue, W] = swtest(winning);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Winning scores in histogram year2
    subplot(2,2,2)
    winning = calWinningScores(homeTeam(year2), awayTeam(year2));
    h = histogram(winning, 15);
    h.Normalization = "pdf";
    title("Histogram of Winning scores - " + num2str(year2));
    [H, pValue, W] = swtest(winning);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel("Points")


    % --------------------------
    %       Any outliers??
    % --------------------------

    % Winning scores in boxplots
    subplot(2,1,2)
    winning1 = calWinningScores(homeTeam(year1), awayTeam(year1));
    winning2 = calWinningScores(homeTeam(year2), awayTeam(year2));
    data = [];
    index = [];

    data = [winning1;winning2];
    index = [index;repmat(year1, length(winning1),1)];
    index = [index;repmat(year2, length(winning2),1)];
    
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(winning1, winning2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue))
    title("Winning scores over the years")

    fig2 = figure;
    set(fig2, "Name", "Plots of Losings Score", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % losing scores in histogram - year1
    subplot(2,2,1)
    losing = calLossingScores(homeTeam(year1), awayTeam(year1));
    h = histogram(losing, 15);
    h.Normalization = "pdf";
    title("Histogram of Losing scores - " + num2str(year1));
    [H, pValue, W] = swtest(losing);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Losing scores in histogram year2
    subplot(2,2,2)
    losing = calLossingScores(homeTeam(year2), awayTeam(year2));
    h = histogram(losing, 15);
    h.Normalization = "pdf";
    title("Histogram of Losing scores - " + num2str(year2));
    [H, pValue, W] = swtest(losing);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')


    % --------------------------
    %       Any outliers??
    % --------------------------

    % losing scores in boxplots
    subplot(2,1,2)
    losing1 = calLossingScores(homeTeam(year1), awayTeam(year1));
    losing2 = calLossingScores(homeTeam(year2), awayTeam(year2));
    data = [];
    index = [];

    data = [losing1;losing2];
    index = [index;repmat(year1, length(losing1),1)];
    index = [index;repmat(year2, length(losing2),1)];
    
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(losing1, losing2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue))
    title("Losing scores over the years")

    fig3 = figure;
    set(fig3, "Name", "Plots of Score Margins (home - away)", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Margin scores in histogram - year1
    subplot(2,2,1)
    margin = calMargins(homeTeam(year1), awayTeam(year1));
    h = histogram(margin, 15);
    h.Normalization = "pdf";
    title("Histogram of Margin scores - " + num2str(year1));
    [H, pValue, W] = swtest(margin);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Margin scores in histogram year2
    subplot(2,2,2)
    margin = calMargins(homeTeam(year2), awayTeam(year2));
    h = histogram(margin, 15);
    h.Normalization = "pdf";
    title("Histogram of Margin scores - " + num2str(year2));
    [H, pValue, W] = swtest(margin);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')


    % --------------------------
    %       Any outliers??
    % --------------------------
    
    % Margin scores in boxplots
    subplot(2,1,2)
    margin1 = calMargins(homeTeam(year1), awayTeam(year1));
    margin2 = calMargins(homeTeam(year2), awayTeam(year2));
    data = [margin1;margin2];
    index = [repmat(year1, length(margin1),1);repmat(year2, length(margin2),1)];
    disp(data)
    disp(index)
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(margin1, margin2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue))
    title("Score margins over the years")
    disp([h,pValue])

end