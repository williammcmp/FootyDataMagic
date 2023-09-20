function showFirstLastSeason(homeTeam, awayTeam, year1, year2, removeOutliers)
    % showFirstLastSeason - Plot Histograms, Boxplots, and t-tests for Winning,
    % Losing, and Margin Scores of Two Specific Seasons
    %
    % Syntax:
    %   showFirstLastSeason(homeTeam, awayTeam, year1, year2)
    %
    % Inputs:
    %   homeTeam - A containers.Map containing home team data for multiple years.
    %   awayTeam - A containers.Map containing away team data for multiple years.
    %   year1 - The first specific year for comparison.
    %   year2 - The second specific year for comparison.
    %
    % Description:
    %   This function generates histograms, boxplots, and performs t-tests for
    %   winning scores, losing scores, and score margins for two specific
    %   seasons. It provides insights into the distribution and statistical
    %   differences between the two selected seasons.
    %
    % Example:
    %   homeTeamData = containers.Map;
    %   awayTeamData = containers.Map;
    %   showFirstLastSeason(homeTeamData, awayTeamData, 2010, 2020);

    fig1 = figure;
    set(fig1, "Name", "Plots of Winning Score", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Winning scores in histogram - year1
    subplot(2,2,1)
    winning = calWinningScores(homeTeam(year1), awayTeam(year1));
    if (removeOutliers)
        [winning, winRemoved] = calRemoveOutliers(winning);
    end
    h = histogram(winning, 15);
    h.Normalization = "pdf";
    title("Histogram of Winning scores - " + num2str(year1));
    [H, pValue, W] = swtest(winning);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Winning scores in histogram year2
    subplot(2,2,2)
    winning = calWinningScores(homeTeam(year2), awayTeam(year2));
    if (removeOutliers)
        [winning, winRemoved] = calRemoveOutliers(winning);
    end
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

    if (removeOutliers)
        [winning1, winRemoved] = calRemoveOutliers(winning);
        [winning2, winRemoved] = calRemoveOutliers(winning);
    end

    data = [];
    index = [];

    data = [winning1;winning2];
    index = [index;repmat(year1, length(winning1),1)];
    index = [index;repmat(year2, length(winning2),1)];
    
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(winning1, winning2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue) + " t-test test value: Accpect H" + num2str(h))
    title("Winning scores over the years")

    fig2 = figure;
    set(fig2, "Name", "Plots of Losings Score", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % losing scores in histogram - year1
    subplot(2,2,1)
    losing = calLossingScores(homeTeam(year1), awayTeam(year1));
    if (removeOutliers)
        [losing, winRemoved] = calRemoveOutliers(losing);
    end
    h = histogram(losing, 15);
    h.Normalization = "pdf";
    title("Histogram of Losing scores - " + num2str(year1));
    [H, pValue, W] = swtest(losing);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Losing scores in histogram year2
    subplot(2,2,2)
    losing = calLossingScores(homeTeam(year2), awayTeam(year2));
    if (removeOutliers)
        [losing, winRemoved] = calRemoveOutliers(losing);
    end
    h = histogram(losing, 15);
    h.Normalization = "pdf";
    title("Histogram of Losing scores - " + num2str(year2));
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')


    % --------------------------
    %       Any outliers??
    % --------------------------

    % losing scores in boxplots
    subplot(2,1,2)
    losing1 = calLossingScores(homeTeam(year1), awayTeam(year1));
    losing2 = calLossingScores(homeTeam(year2), awayTeam(year2));
    if (removeOutliers)
        [losing1, winRemoved] = calRemoveOutliers(losing);
        [losing2, winRemoved] = calRemoveOutliers(losing);
    end
    data = [];
    index = [];

    data = [losing1;losing2];
    index = [index;repmat(year1, length(losing1),1)];
    index = [index;repmat(year2, length(losing2),1)];
    
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(losing1, losing2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue) + " t-test test value: Accpect H" + num2str(h))
    title("Losing scores over the years")

    fig3 = figure;
    set(fig3, "Name", "Plots of Score Margins (home - away)", "Position", [10, 10, 1100, 900]);

    % --------------------------
    % is normal - use histograms
    % --------------------------
    
    % Margin scores in histogram - year1
    subplot(2,2,1)
    margin = calMargins(homeTeam(year1), awayTeam(year1));
    if (removeOutliers)
        [margin, winRemoved] = calRemoveOutliers(margin);
    end
    h = histogram(margin, 15);
    h.Normalization = "pdf";
    title("Histogram of Margin scores - " + num2str(year1));
    [H, pValue, W] = swtest(margin);
    subtitle("P-value : " + num2str(pValue) + "  W: " + num2str(W));
    xlabel('Points')

    % Margin scores in histogram year2
    subplot(2,2,2)
    margin = calMargins(homeTeam(year2), awayTeam(year2));
    if (removeOutliers)
        [margin, winRemoved] = calRemoveOutliers(margin);
    end
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
    
    if (removeOutliers)
        [margin1, winRemoved] = calRemoveOutliers(margin);
        [margin2, winRemoved] = calRemoveOutliers(margin);
    end

    data = [margin1;margin2];
    index = [repmat(year1, length(margin1),1);repmat(year2, length(margin2),1)];
    boxplot(data, index)
    xlabel('Season (year)');
    ylabel('Points');
    [h, pValue] = ttest2(margin1, margin2, "Vartype","equal");
    subtitle("t-test P-value : " + num2str(pValue) + " t-test test value: Accpect H" + num2str(h))
    title("Score margins over the years")
    

end