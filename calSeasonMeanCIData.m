function [winningData, losingData, marginData] = calSeasonMeanCIData(homeTeam, awayTeam, year, removeOutliers)
    % CALSEASONMEANCIDATA - Generate mean and CI data for a specific season.
    %
    % Input:
    %   homeTeam - A containers.Map containing home team data for multiple seasons.
    %   awayTeam - A containers.Map containing away team data for the same seasons.
    %   year - The specific season (year) for which to generate data.

    % Calculate winning, losing, and margin scores for the given season
    winningsScores = calWinningScores(homeTeam(year), awayTeam(year));
    losingScores = calLossingScores(homeTeam(year), awayTeam(year));
    marginScores = calMargins(homeTeam(year), awayTeam(year));

    if (removeOutliers)
        % Will remove the outliers from the data
        [winningsScores, winningRemoved] = calRemoveOutliers(winningsScores);
        [losingScores, losingRemoved] = calRemoveOutliers(losingScores);
        [marginScores, marginRemoved] = calRemoveOutliers(marginScores);
    end

    % Calculate mean and 95% confidence intervals for winning, losing, and margin scores
    [winningLeft, winningMean, winningRight] = calMeanCI(winningsScores, 0.9);
    [losingLeft, losingMean, losingRight] = calMeanCI(losingScores, 0.9);
    [marginLeft, marginMean, marginRight] = calMeanCI(marginScores, 0.9);

    % Store data in cell arrays with year and formatted CI string
    winningData = {year, char(winningLeft + "<" + winningMean + "<" + winningRight)};
    losingData = {year, char(losingLeft + "<" + losingMean + "<" + losingRight)};
    marginData = {year, char(marginLeft + "<" + marginMean + "<" + marginRight)};
end
